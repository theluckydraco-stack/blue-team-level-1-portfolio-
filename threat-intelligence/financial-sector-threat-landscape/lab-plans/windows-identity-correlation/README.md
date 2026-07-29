# Windows Identity Correlation Lab

## Objective

Validate a simple version of the project's identity-compromise detection using the existing Windows Server and Windows 11 lab.

The lab simulates:

```text
Administrator resets a test user's password
        ↓
Same test user is added to a finance-privileged lab group
        ↓
Windows records both actions
        ↓
Events are collected and correlated
```

This is not intended to reproduce Scattered Spider or a real help-desk attack. It validates the local Windows evidence required for the first part of that attack path.

## Why this is the first lab

The project needs proof that intelligence can become a working detection.

Windows provides well-defined security events:

- `4724` — an attempt was made to reset an account's password;
- `4728` — a member was added to a security-enabled global group;
- `4624` — an account successfully logged on.

The first version correlates `4724` followed by `4728` for the same account. A later cloud lab can add MFA registration and SaaS access.

## Safe lab design

Use only:

- a test user named `FinSOC-TestUser`;
- a custom group named `Finance-Admins-Lab`;
- the private Active Directory lab;
- a non-production password entered securely at runtime.

Do not add the test user to Domain Admins or another real privileged group.

## Requirements

- Windows Server domain controller;
- Active Directory PowerShell module;
- administrative access to the lab domain;
- Security log auditing enabled;
- optional SIEM or Windows Event Forwarding;
- PowerShell 5.1 or later.

## Files

- [`run-lab.ps1`](run-lab.ps1) — creates or reuses the lab objects, performs the password reset and group addition, and exports matching events.
- [`../../detections/sigma/mr_password_reset_then_finance_group_add.yml`](../../detections/sigma/mr_password_reset_then_finance_group_add.yml) — experimental Sigma correlation rule.

## Manual execution

Run this only on the lab domain controller from an elevated PowerShell window:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
.\run-lab.ps1 -ConfirmLab "I-UNDERSTAND-THIS-IS-A-LAB"
```

The script asks for a temporary test password through a secure prompt. It does not contain a hard-coded credential.

## Expected evidence

The Security log should contain:

```text
Event 4724
Subject account = administrator who performed the reset
Target account = FinSOC-TestUser

Event 4728
Subject account = administrator who changed group membership
Member = FinSOC-TestUser
Group = Finance-Admins-Lab
```

The script exports matching events to:

```text
C:\BTL1-Lab-Evidence\windows-identity-correlation-events.csv
```

## Investigation questions

1. Who performed the reset?
2. Which account was reset?
3. How long passed before the group addition?
4. Which group received the user?
5. Was there an approved lab or help-desk record?
6. Did the account log on afterwards?
7. What additional evidence would distinguish an attack from legitimate administration?

## False positives

Legitimate events include:

- approved password recovery;
- onboarding or role change;
- administrator testing;
- emergency access restoration.

The sequence becomes more suspicious when the account is high value, the operator is unusual, no ticket exists or the account immediately accesses sensitive systems.

## Validation status

```text
Design complete
Manual execution pending
SIEM field mapping pending
Sigma backend conversion pending
```

The rule remains `experimental` until the event fields and correlation are validated against the chosen SIEM.

## Evidence to add after execution

- screenshot of Event 4724;
- screenshot of Event 4728;
- exported CSV with sensitive values reviewed;
- SIEM query or converted Sigma rule;
- correlated alert;
- false-positive and tuning notes.

## Sources

- Microsoft — Event 4724: https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/auditing/event-4724
- Microsoft — Audit Security Group Management: https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/auditing/audit-security-group-management
- Microsoft — Audit Logon: https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-10/security/threat-protection/auditing/audit-logon
- Sigma — Correlation Rules Specification: https://sigmahq.io/sigma-specification/specification/sigma-correlation-rules-specification.html
