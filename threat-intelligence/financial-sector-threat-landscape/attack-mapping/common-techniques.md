# Common MITRE ATT&CK Behaviours

## What This File Does

MITRE ATT&CK gives common names and identifiers to attacker behaviours. A **technique** describes how an attacker pursues an objective. For example, `T1190 — Exploit Public-Facing Application` means taking advantage of a weakness in an internet-accessible system.

I use ATT&CK to answer two defensive questions:

1. Which important behaviours recur across the selected financial threats?
2. Which logs and controls would allow a SOC to detect or prevent them?

Technique overlap does **not** prove that two incidents were caused by the same actor.

## Current Profiles Compared

- **DPRK financial theft:** direct theft from banks and virtual-asset organisations, including cloud and developer targeting.
- **Scattered Spider / UNC3944:** help-desk social engineering followed by identity, SaaS and virtualisation abuse.
- **CL0P-branded mass exploitation:** exploitation of enterprise products such as MOVEit Transfer and Oracle E-Business Suite for data theft and extortion.
- **APT41:** comparison case involving espionage, public-facing exploitation, cloud services and software supply-chain activity.

`Yes` means the behaviour is supported by the sources selected for this project. `Limited` means the source describes related capability or evidence but the behaviour is not broad enough to use as a central comparison. A blank does not mean the actor has never used the technique.

## Current-Threat Comparison

| Technique ID | Technique | DPRK financial theft | Scattered Spider / UNC3944 | CL0P-branded activity | APT41 | Why it matters to financial services | Required telemetry | Detection or hunting idea |
|---|---|---:|---:|---:|---:|---|---|---|
| `T1656` | Impersonation | Yes | Yes |  |  | Recruiter, help-desk, supplier or executive impersonation can obtain trusted access without exploiting software | Employee reports, help-desk records, HR verification and identity investigations | Correlate suspicious external contact with resets, new MFA devices, code execution or privileged access |
| `T1566.004` | Phishing: Spearphishing Voice |  | Yes |  |  | Voice attacks can manipulate account-recovery and support processes | Call records, support tickets, identity changes and user reports | Alert on privileged reset requests followed by new device or factor enrolment |
| `T1204.002` | User Execution: Malicious File | Yes |  |  |  | Developers may execute malicious job tests, repositories, documents or tools | EDR, process creation, shell history, container runtime, download and repository telemetry | Detect interpreters or containers launched from new and low-reputation project folders |
| `T1621` | Multi-Factor Authentication Request Generation |  | Yes |  |  | Repeated prompts can pressure a user into authorising attacker access | Identity-provider MFA, denied prompt, source device and location logs | Alert on prompt bursts followed by successful authentication or factor changes |
| `T1556.006` | Modify Authentication Process: Multi-Factor Authentication |  | Yes |  |  | Attacker-controlled factors can preserve access after a password reset | Factor registration, removal, device enrolment and help-desk logs | Correlate new factor enrolment with reset tickets and privileged SaaS access |
| `T1539` | Steal Web Session Cookie | Yes |  |  |  | Session theft may bypass passwords and some MFA controls | Identity-provider, browser, device-binding and cloud audit logs | Alert on session reuse from a new device or network without a matching authentication event |
| `T1078` | Valid Accounts | Yes | Yes |  | Yes | Stolen identities can blend into normal administrative and cloud activity | Identity-provider, VPN, Active Directory, cloud audit, PAM and endpoint logs | Identify unusual device, time, geography, privilege use or service access for legitimate accounts |
| `T1098` | Account Manipulation |  | Yes | Yes, application account |  | New roles, credentials, factors or application users can expand or preserve access | Okta/Entra, IAM, application-administration and support-ticket logs | Detect unusual account or role creation after exploitation or account recovery |
| `T1552.001` | Unsecured Credentials: Credentials in Files | Yes |  |  |  | Developer endpoints and bastions may contain cloud keys, SSH keys and signing credentials | EDR file access, secret scanning, cloud key use, CLI and repository telemetry | Hunt for credential-file access followed by remote cloud or bastion activity |
| `T1213.002` | Data from Information Repositories: SharePoint |  | Yes |  |  | Collaboration systems reveal sensitive data, projects and internal access instructions | Microsoft 365 audit, search and file-access logs | Detect unusual searches for VPN, VDI, security, executive or administrator information |
| `T1530` | Data from Cloud Storage |  | Yes | Limited |  | SaaS and application data theft may not cross traditional on-premises sensors | SaaS audit, storage-object access, API, secret-use and DLP logs | Identify bulk reads, unusual storage-key use and downloads by recently changed identities |
| `T1567.002` | Exfiltration to Cloud Storage |  | Yes |  | Yes | Legitimate cloud services can hide data theft inside expected encrypted traffic | Proxy, CASB, endpoint, SaaS integration, cloud-service and DLP logs | Detect new synchronisation jobs or high-volume uploads to personal or rare destinations |
| `T1606.002` | Forge Web Credentials: SAML Tokens |  | Yes |  |  | Stolen federation certificates can provide persistent access across many SaaS applications | ADFS certificate, token claim, identity-provider and service-provider logs | Correlate token use with missing or inconsistent identity-provider authentication events |
| `T1190` | Exploit Public-Facing Application |  |  | Yes | Yes | Internet-facing banking, payment, file-transfer, ERP, VPN and supplier systems can provide scalable access | Asset inventory, WAF, application, vulnerability, reverse-proxy, EDR and authentication logs | Correlate exploitation attempts with child processes, new files, web shells or unusual data access |
| `T1505.003` | Server Software Component: Web Shell |  |  | Yes | Yes | Web shells can provide remote access to exposed application servers after initial exploitation | Web access, file-integrity, process, EDR and application logs | Hunt for new server-side scripts and web-server processes spawning shells |
| `T1083` | File and Directory Discovery |  |  | Yes |  | Attackers enumerate files to identify valuable customer and business records | Application audit, file access, database and endpoint logs | Detect unusual recursive listing or application queries shortly after exploitation |
| `T1005` | Data from Local System |  |  | Yes |  | Enterprise applications may hold payroll, supplier, customer and transaction files locally | File access, application export, database-query and download logs | Correlate unusual application access with large file retrieval or archive creation |
| `T1195.002` | Compromise Software Supply Chain | Yes |  |  | Yes | A compromised provider, package or deployment process can expose many downstream financial organisations | Vendor-risk, CI/CD, package, code-signing, deployment, integrity and endpoint logs | Detect unauthorised build changes, new dependencies, code-signing anomalies and downstream execution |
| `T1550.002` | Pass the Hash |  |  |  | Yes | Stolen Windows authentication material can enable lateral movement without plaintext passwords | Windows authentication, EDR, domain-controller and lateral-movement telemetry | Hunt for abnormal NTLM use, remote service creation and privileged logons from unusual hosts |

## Historical Banking Comparison

Cobalt Group and Silence are included as historical Eastern European banking comparisons. Their strongest detailed public reporting is older, but the behaviours remain useful for testing whether a modern financial institution can detect movement from an employee workstation into money-moving systems.

| Technique ID | Technique | Cobalt Group | Silence | Bank-specific importance | Required telemetry | Detection or hunting idea |
|---|---|---:|---:|---|---|---|
| `T1566.001` | Spearphishing Attachment | Yes | Yes | A malicious document can create the first foothold inside a trusted bank network | Email gateway, sandbox, Office and endpoint logs | Detect high-risk attachments followed by Office child processes or script execution |
| `T1204.002` | User Execution: Malicious File | Yes | Yes | The attack often depends on an employee opening or enabling content | Endpoint process creation and user reports | Correlate file opening with PowerShell, cmd, mshta, cscript or unusual network connections |
| `T1059.001` | PowerShell | Yes | Yes | PowerShell can download payloads and automate compromise while resembling administration | Script Block Logging, AMSI and EDR | Hunt for encoded commands, downloads and PowerShell launched by Office or HTML Help |
| `T1003.001` | OS Credential Dumping: LSASS Memory | Yes | Yes | Privileged credentials may provide access to payment, ATM or administration systems | EDR, LSASS access and credential-protection telemetry | Alert on non-security processes opening LSASS or dumping memory |
| `T1078` | Valid Accounts | Limited | Yes | Stolen accounts allow attacker actions to resemble authorised employee activity | Active Directory, VPN, RDP and application logs | Identify new host, time or system use by privileged accounts |
| `T1021.001` | Remote Services: RDP | Yes | Yes | RDP can move the attacker from employee systems to banking administration environments | RDP authentication, session and source-host logs | Detect user workstations initiating privileged RDP sessions to restricted segments |
| `T1046` | Network Service Discovery | Yes | Related network mapping | Attackers must locate payment, ATM, card-processing and SWIFT-connected systems | Network-flow, EDR and firewall logs | Detect scanning from ordinary user networks toward protected financial segments |
| `T1219` / `T1072` | Remote Access or Deployment Tools | Yes | Yes | TeamViewer, Ammyy Admin, RAdmin and similar tools can provide persistent control | Software inventory, services, sessions and network logs | Alert on unapproved remote tools or use against payment and ATM hosts |
| `T1113` | Screen Capture | Related tooling | Yes | Screens reveal applications, data and approval steps | EDR, suspicious capture APIs and file creation | Hunt for repeated screenshots on privileged financial workstations |
| `T1125` | Video Capture |  | Yes | Recording employee activity can teach attackers how legitimate financial procedures work | EDR, recording processes, file growth and outbound transfer | Detect screen-recording software or video files on restricted systems |
| `T1195.002` | Compromise Software Supply Chain | Yes |  | A trusted software update can provide access to several financial institutions | Vendor-risk, software integrity, code-signing and deployment logs | Detect unexpected update changes or new code-signing behaviour |

## Cross-Actor Defensive Themes

### 1. Protect identity recovery

The initial attack may be a phone call or fake recruiter rather than a software exploit. Password resets, MFA changes and session reuse must be treated as security events.

### 2. Inventory internet-facing enterprise software

The MOVEit and Oracle EBS cases show that attackers can exploit a central platform and steal data quickly. Product ownership, version, exposure and log availability must be known before a crisis.

### 3. Monitor applications and cloud services directly

Activity may occur inside SaaS, cloud storage, ERP or file-transfer platforms without passing through traditional endpoint or perimeter sensors.

### 4. Treat suppliers as part of the financial attack surface

A wallet provider, payroll processor, managed file-transfer service or software vendor may hold the access or data the attacker actually needs.

### 5. Protect money-moving systems from ordinary workstations

The Cobalt Group and Silence cases show why employee compromise must not provide a path to ATM, payment, card-processing or SWIFT-connected environments.

### 6. Correlate cyber and fraud evidence

A remote session, credential alert or network scan may only become clearly malicious when connected to a fraudulent transfer, balance change, ATM cash-out or laundering activity.

### 7. Detect behaviour, not only indicators

IP addresses, hashes and domains change quickly. Account recovery, web-shell creation, screen recording, remote administration, bulk application downloads and unusual cloud synchronisation are more durable hunting targets.

## Evidence Basis

- DPRK mappings use FBI, Google Threat Intelligence and MITRE ATT&CK reporting.
- Scattered Spider / UNC3944 mappings use Mandiant, MITRE ATT&CK and government advisories.
- CL0P mappings use Mandiant MOVEit reporting, the CISA/FBI advisory and Oracle/GTIG reporting on the 2025 Oracle EBS campaign.
- APT41 mappings use Mandiant and MITRE ATT&CK reporting.
- Cobalt Group mappings use MITRE ATT&CK, Europol and Group-IB reporting.
- Silence mappings use MITRE ATT&CK, Kaspersky and Group-IB reporting.

The rows do not mean every campaign or associated public label used every listed technique. ATT&CK names and identifiers will be checked again against the current version before the project is marked complete.
