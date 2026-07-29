# Kali365 Microsoft 365 Token Phishing — 2026

## Why I included this case

This case directly updates the BTL1 phishing model.

A traditional phishing page often steals a username, password and sometimes an MFA code. Kali365 instead uses a legitimate Microsoft verification page to persuade the user to authorise the attacker's device.

```text
Traditional credential phishing
Fake login page steals the password

Kali365 device-code phishing
Real Microsoft page issues tokens to the attacker's device
```

The page being legitimate does not make the request legitimate.

## What the FBI reported

On 21 May 2026, the FBI warned about an emerging Phishing-as-a-Service platform named `Kali365`, first observed in April 2026 and primarily distributed through Telegram.

**Phishing-as-a-Service (PhaaS)** means that criminals provide ready-made phishing infrastructure, templates and management tools to other attackers in return for a fee or subscription.

The FBI reported that Kali365 provides:

- AI-generated phishing lures;
- automated campaign templates;
- real-time target tracking;
- Microsoft 365 OAuth token capture;
- access that can continue without collecting the victim's password.

## Attack path

```text
Phishing email impersonates a trusted cloud or document service
        ↓
Message provides a device code
        ↓
User visits the legitimate Microsoft verification page
        ↓
User enters the code
        ↓
User unknowingly authorises the attacker's device
        ↓
Attacker receives access and refresh tokens
        ↓
Outlook, Teams and OneDrive accessed without another MFA challenge
```

## Concepts explained

### Device code flow

Device code flow is a legitimate authentication method designed for devices or applications that cannot easily display a full sign-in interface. The user enters a short code on another device to authorise the original application.

The attacker abuses the flow by generating the code and convincing the victim to approve it.

### OAuth token

An **OAuth access token** allows an application or device to access an approved service. A **refresh token** can obtain new access tokens after the first one expires.

A stolen or fraudulently authorised token can allow access without the attacker repeatedly entering the password.

### Why MFA did not solve it

The attacker did not necessarily bypass MFA by breaking the control. The victim completed a legitimate authorisation step on the attacker's behalf.

This is an important distinction:

```text
MFA failure
The control does not work

Authorisation deception
The control works, but the user approves the wrong device
```

## Financial-sector relevance

Microsoft 365 commonly contains:

- payment and invoice conversations;
- customer and employee records;
- supplier details;
- executive communications;
- SharePoint and OneDrive documents;
- Teams messages;
- password-reset and security notifications.

Token access can support:

- business email compromise;
- supplier-payment diversion;
- internal phishing from a trusted account;
- customer-data theft;
- discovery of financial procedures;
- persistence after a password change if tokens are not revoked.

## Evidence to collect

### Email evidence

- original message and full headers;
- sender, Reply-To and Return-Path;
- subject, body and device code;
- links and impersonated service;
- affected recipients.

### Identity evidence

- device-code authentication events;
- token issuance and refresh events;
- application and client identifiers;
- new device or session records;
- source IP, location and user agent;
- Outlook, Teams, SharePoint and OneDrive access;
- mailbox rules, OAuth grants and delegated access;
- session revocation records.

### Business evidence

- accessed finance or supplier conversations;
- downloaded documents;
- internal messages sent after compromise;
- payee or payment changes;
- other users contacted by the account.

## Detection opportunities

### Device code flow use

Identify device-code authentication where the user or organisation does not normally use the flow.

### Token use without expected authentication context

Alert when a Microsoft 365 token is used from a device, network or application inconsistent with the user and no normal interactive sign-in explains the session.

### Token issuance followed by mailbox or file access

Correlate:

```text
Device-code authorisation
        ↓
New token or session
        ↓
MailItemsAccessed, FileAccessed or bulk search
        ↓
Forwarding rule, internal phishing or data download
```

### Account actions after password reset

A password change alone may not invalidate every active token. Review token and session use after remediation.

## Defensive priorities

1. Block or restrict device code flow where it is not required.
2. Audit existing legitimate use before enforcing the restriction.
3. Use Conditional Access and device trust for sensitive accounts.
4. Train users never to enter a device code received through an unsolicited message.
5. Monitor token issuance and access to Outlook, Teams, SharePoint and OneDrive.
6. Revoke access and refresh tokens during incident response.
7. Review mailbox rules, OAuth applications and delegated permissions.
8. Use phishing-resistant authentication, while recognising that user-authorised token abuse requires additional controls.

## ATT&CK mapping

Relevant mappings include:

- `T1566.002` — Phishing: Spearphishing Link
- `T1656` — Impersonation
- `T1528` — Steal Application Access Token
- `T1550.001` — Use Alternate Authentication Material: Application Access Token
- `T1114` — Email Collection
- `T1530` — Data from Cloud Storage

## Modern correction to phishing analysis

The BTL1 method remains useful:

- preserve the email;
- inspect sender and authentication artifacts;
- understand the lure;
- identify affected users;
- document defensive actions.

Modern phishing analysis must also ask:

```text
Did the user authorise an application or device?
Which tokens were issued?
Which cloud services were accessed?
Were sessions revoked?
What business actions followed?
```

A phishing investigation is no longer complete when the password is reset.

## Strategic assessment

**My assessment:** Kali365 demonstrates that modern PhaaS platforms are moving from password theft toward token and authorisation abuse. Financial organisations must monitor the cloud identity control plane and the business activity performed with the token, not only the phishing page.

**Confidence:** high for the FBI-reported platform capabilities and attack sequence; moderate regarding the number and type of affected financial organisations because the public warning does not provide a full victim list.

## Source

- FBI IC3 — Kali365 Phishing-as-a-Service Kit Hijacks Microsoft 365 Access Tokens: https://www.ic3.gov/PSA/2026/PSA260521
