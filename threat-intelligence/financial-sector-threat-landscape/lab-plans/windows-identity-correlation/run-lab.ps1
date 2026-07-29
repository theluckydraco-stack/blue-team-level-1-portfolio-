[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [ValidateSet("I-UNDERSTAND-THIS-IS-A-LAB")]
    [string]$ConfirmLab
)

Set-StrictMode -Version Latest
$ErrorActionPreference = "Stop"

function Test-IsAdministrator {
    $identity = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($identity)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

if (-not (Test-IsAdministrator)) {
    throw "Run this script from an elevated PowerShell window on the lab domain controller."
}

Import-Module ActiveDirectory -ErrorAction Stop

$domain = Get-ADDomain
$userSam = "finsoc.test"
$userName = "FinSOC-TestUser"
$groupName = "Finance-Admins-Lab"
$outputDirectory = "C:\BTL1-Lab-Evidence"
$outputFile = Join-Path $outputDirectory "windows-identity-correlation-events.csv"
$startTime = Get-Date

Write-Host "Enabling the required audit subcategories in the lab..."
& auditpol.exe /set /subcategory:"User Account Management" /success:enable /failure:enable | Out-Null
& auditpol.exe /set /subcategory:"Security Group Management" /success:enable /failure:enable | Out-Null
& auditpol.exe /set /subcategory:"Logon" /success:enable /failure:enable | Out-Null

$securePassword = Read-Host "Enter a temporary password for the lab user" -AsSecureString

$group = Get-ADGroup -Filter "SamAccountName -eq '$groupName'" -ErrorAction SilentlyContinue
if (-not $group) {
    Write-Host "Creating the custom global security group $groupName..."
    $group = New-ADGroup `
        -Name $groupName `
        -SamAccountName $groupName `
        -GroupScope Global `
        -GroupCategory Security `
        -Path $domain.UsersContainer `
        -PassThru
}

$user = Get-ADUser -Filter "SamAccountName -eq '$userSam'" -ErrorAction SilentlyContinue
if (-not $user) {
    Write-Host "Creating the test user $userName..."
    $user = New-ADUser `
        -Name $userName `
        -SamAccountName $userSam `
        -UserPrincipalName "$userSam@$($domain.DNSRoot)" `
        -Path $domain.UsersContainer `
        -AccountPassword $securePassword `
        -Enabled $true `
        -ChangePasswordAtLogon $false `
        -PassThru
}

# Remove previous membership so the later addition produces a fresh 4728 event.
$existingMembers = Get-ADGroupMember -Identity $group -Recursive:$false
if ($existingMembers.DistinguishedName -contains $user.DistinguishedName) {
    Write-Host "Removing previous lab-group membership before the test..."
    Remove-ADGroupMember -Identity $group -Members $user -Confirm:$false
    Start-Sleep -Seconds 2
}

Write-Host "Resetting the test user's password to generate Event 4724..."
Set-ADAccountPassword -Identity $user -Reset -NewPassword $securePassword
Start-Sleep -Seconds 2

Write-Host "Adding the test user to $groupName to generate Event 4728..."
Add-ADGroupMember -Identity $group -Members $user
Start-Sleep -Seconds 5

if (-not (Test-Path $outputDirectory)) {
    New-Item -Path $outputDirectory -ItemType Directory -Force | Out-Null
}

$events = Get-WinEvent -FilterHashtable @{
    LogName   = "Security"
    Id        = 4724, 4728
    StartTime = $startTime
} | Where-Object {
    $_.Message -match [regex]::Escape($userSam) -or
    $_.Message -match [regex]::Escape($userName) -or
    $_.Message -match [regex]::Escape($groupName)
} | Sort-Object TimeCreated

if (-not $events) {
    Write-Warning "No matching events were found. Confirm the audit policy, event timing and domain-controller role."
    return
}

$events | Select-Object `
    TimeCreated,
    Id,
    MachineName,
    ProviderName,
    LevelDisplayName,
    Message | Export-Csv -Path $outputFile -NoTypeInformation -Encoding UTF8

Write-Host "Lab actions completed."
Write-Host "Evidence exported to: $outputFile"
Write-Host "Review Event 4724 and Event 4728 in Event Viewer before removing or redacting any evidence."
