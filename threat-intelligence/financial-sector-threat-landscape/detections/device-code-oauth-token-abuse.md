# Detection Specification: Device-Code OAuth Token Abuse

## Detection objective

Identify a user being deceived into authorising an attacker-controlled device through Microsoft device code flow, followed by token-based access to Microsoft 365.

## Threat basis

The FBI's May 2026 Kali365 warning described a PhaaS platform that captures Microsoft 365 access and refresh tokens after victims enter attacker-supplied device codes on the legitimate Microsoft verification page.

## Financial assets at risk

- executive and finance email;
- supplier and invoice conversations;
- Teams communications;
- SharePoint and OneDrive data;
- customer and employee information;
- internal password-reset and security notifications.

## Required telemetry

- Microsoft Entra sign-in and authentication-protocol details;
- device code flow events;
- access and refresh token issuance;
- application, client and resource identifiers;
- device, IP, location, ASN and user-agent context;
- Microsoft 365 unified audit logs;
- Outlook, Teams, SharePoint and OneDrive access;
- mailbox-rule, delegation and OAuth application changes;
- email reports and help-desk records.

## Correlation logic

Alert when device code flow is used by a user or application without a known business requirement, especially when followed by new Microsoft 365 activity.

```text
Unusual device-code authentication
        ↓
New access or refresh token
        ↓
Token used from unfamiliar client, device or network
        ↓
Mail, Teams, SharePoint or OneDrive access
```

Increase severity when:

- the user received an email containing the code or instructions;
- the account is privileged or belongs to finance, treasury, procurement or an executive;
- the token is used without a normal interactive sign-in from that device;
- large mailbox searches or file downloads occur;
- a new forwarding rule, delegated permission or OAuth application appears;
- internal phishing or payment changes follow.

## Expected legitimate activity

- approved command-line tools;
- devices without full browser interfaces;
- authorised development or administrative workflows;
- emergency or legacy business applications.

Maintain a documented allowlist of applications and users that genuinely require device code flow.

## Investigation steps

1. Confirm whether the user intentionally initiated a legitimate device code flow.
2. Preserve the phishing email and complete headers.
3. Identify the token, client, device, IP and services accessed.
4. Review mailbox, Teams, SharePoint and OneDrive actions after issuance.
5. Check for forwarding rules, delegated access, application grants and internal messages.
6. Identify payment, supplier or customer data accessed by the account.
7. Search for other users who received the same lure or authorised the same client.

## Containment

- revoke access and refresh tokens;
- terminate active sessions;
- disable or restrict device code flow;
- remove unauthorised applications, factors, rules and delegation;
- reset credentials where appropriate;
- preserve cloud audit evidence;
- notify fraud, finance, privacy and affected business owners when sensitive activity occurred.

## ATT&CK mapping

- `T1566.002` — Phishing: Spearphishing Link
- `T1656` — Impersonation
- `T1528` — Steal Application Access Token
- `T1550.001` — Use Alternate Authentication Material: Application Access Token
- `T1114` — Email Collection
- `T1530` — Data from Cloud Storage

## Validation plan

Use a laboratory Microsoft 365 tenant or approved synthetic logs. Perform an authorised device code sign-in for a test account, access test mail and files, and confirm that the SIEM correlates the token issuance with subsequent activity.

Do not send real users deceptive device codes during validation.

## Review conditions

Review when:

- Microsoft changes device code flow or logging fields;
- approved applications begin or stop using the flow;
- Conditional Access policy changes;
- new PhaaS reporting identifies another token-capture method;
- investigation shows that token use remained invisible after a password reset.
