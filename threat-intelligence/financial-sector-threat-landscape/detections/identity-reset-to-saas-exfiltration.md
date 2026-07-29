# Detection Specification: Identity Reset Followed by SaaS Exfiltration

## Detection objective

Identify a possible help-desk or account-recovery compromise in which an attacker resets a password or MFA method, expands the account's access and then retrieves data from cloud or SaaS applications.

## Threat basis

This behaviour is strongly associated with Scattered Spider / UNC3944 reporting and is also relevant to any actor using social engineering, stolen sessions or valid accounts.

## Financial assets at risk

- customer and KYC data;
- payment and fraud systems;
- finance and payroll applications;
- privileged-access management;
- cloud administration;
- executive and legal information;
- virtualisation platforms.

## Required telemetry

- help-desk ticket and operator records;
- password-reset and account-unlock events;
- MFA factor registration, removal and device enrolment;
- identity-provider sign-ins and risk events;
- SSO application assignments and role changes;
- SaaS search, read, download and export events;
- cloud-storage and DLP events;
- device identity and network location.

## Correlation logic

Create a high-priority alert when the following sequence occurs for the same account within a defined period:

```text
Password, unlock or MFA recovery event
        ↓
New factor, device or session appears
        ↓
New application, role or privileged access is assigned
        ↓
Unusual search, bulk read, export or download occurs
```

Increase severity when:

- the account is privileged or supports finance, payments, security or cloud administration;
- the reset was performed by a support operator who does not normally handle that user;
- the new session uses an unfamiliar device, country, ASN or impossible travel pattern;
- the user denies requesting the reset;
- data is transferred to a personal or newly observed cloud destination.

## Expected legitimate activity

- lost or replaced employee devices;
- onboarding or role changes;
- emergency access recovery;
- approved administrator maintenance;
- business-approved bulk data exports.

The detection should not automatically label the reset as malicious. The suspicious element is the sequence and context.

## Investigation steps

1. Contact the user through an established directory or manager, not through details contained in the ticket.
2. Review the support interaction, caller verification and operator actions.
3. Confirm which factors, sessions, roles and applications changed.
4. Review every cloud and SaaS action after the recovery event.
5. Identify downloaded or exported data.
6. Search for similar resets by the same operator, source or device.
7. Review whether personal information used during verification was exposed elsewhere.

## Containment

- disable or restrict the account;
- revoke all active sessions and tokens;
- remove newly registered factors and unauthorised roles;
- suspend suspicious SaaS integrations;
- preserve tickets, calls and identity logs;
- notify fraud, privacy, legal and insider-risk teams if sensitive data was accessed.

## ATT&CK mapping

- `T1656` — Impersonation
- `T1078` — Valid Accounts
- `T1098` — Account Manipulation
- `T1556.006` — Modify Authentication Process: Multi-Factor Authentication
- `T1530` — Data from Cloud Storage
- `T1567.002` — Exfiltration to Cloud Storage

## Validation plan

Use a laboratory account to perform an approved password reset, enrol a new MFA method, assign a test SaaS application and download non-sensitive test files. Confirm that the data arrives in the SIEM and that one correlated alert explains the full sequence.

## Review conditions

Review the detection when:

- the identity provider or ticketing platform changes;
- new SaaS applications are added;
- account-recovery policy changes;
- false positives reveal a legitimate workflow not previously documented;
- new intelligence shows a different recovery or session-abuse method.
