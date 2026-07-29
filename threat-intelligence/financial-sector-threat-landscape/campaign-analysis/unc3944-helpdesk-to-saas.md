# UNC3944 Help Desk to SaaS Attack Path

## Why This Case Matters

This attack model shows how a legitimate support process can be turned into an enterprise-wide compromise.

The attacker does not need to defeat every security product directly. They persuade one trusted support function to reset identity controls, then use the compromised identity to reach every application connected to SSO.

```text
One fraudulent support call
        ↓
One privileged identity
        ↓
Many cloud and SaaS applications
```

## Source Basis

This case study is based primarily on Mandiant incident-response reporting about UNC3944. It represents a recurring attack path observed across victims rather than one named organisation.

## Attack Path

### 1. Victim research

The actors gather personal and organisational information about employees, managers and support processes.

Observed verification information included dates of birth, manager names, job titles and other personally identifiable information.

**Problem exposed:** knowledge-based verification assumes that personal information is secret, even though it may be stolen, purchased or gathered online.

### 2. Help-desk impersonation

The actor calls the help desk and claims to be an employee with a new or lost phone. The goal is to trigger a password reset, remove an existing MFA factor or register a new attacker-controlled method.

**Detection challenge:** the administrator performs an approved support function. The malicious element is the caller's identity, not the reset command itself.

### 3. Privileged identity takeover

The actor gains access to an account with high privilege potential.

In some cases, the attacker assigns the compromised identity to additional Okta applications, expanding access across SSO-connected systems.

### 4. Internal documentation discovery

The actor searches SharePoint and other Microsoft 365 resources for:

- VPN instructions;
- VDI access requirements;
- remote-support tools;
- administrator guides;
- organisational relationships;
- active and recent sensitive projects.

**Analytic significance:** collaboration platforms provide both data and a map of how the organisation works.

### 5. SaaS and privileged-system access

Mandiant observed access to platforms including:

- Azure, AWS and Google Cloud;
- Salesforce and Workday;
- CyberArk;
- CrowdStrike;
- vCenter;
- Microsoft 365.

Cloud access may originate from compromised internal virtual machines, making IP-reputation-based detection less useful.

### 6. Persistence and control expansion

Observed methods included:

- new MFA methods;
- additional roles or application assignments;
- stolen ADFS certificates and Golden SAML potential;
- remote-access tooling;
- attacker-created virtual machines;
- local password reset through virtualisation control.

### 7. Data discovery and exfiltration

The actor searches cloud and SaaS repositories for valuable data. Mandiant observed use of legitimate synchronisation services such as Airbyte and Fivetran to move data to attacker-controlled cloud storage.

**Detection challenge:** data may move directly between SaaS providers and never cross the victim's on-premises network sensor.

### 8. Extortion or disruption

The operation may end with data-theft extortion, ransomware, destruction of virtualisation evidence or threats against employees and their families.

## Connection Ladder

| Level | Assessment |
|---|---|
| Technical observation | Password and MFA reset, app assignment, SaaS access, cloud-to-cloud transfer and virtualisation changes |
| Victim and asset context | Large enterprises centralise access through help desks, SSO and virtualisation platforms |
| Campaign context | Mandiant observed repeated sector waves, including financial services in late 2023 |
| Source assessment | UNC3944 is financially motivated and adapted from SIM swapping into ransomware and data-theft extortion |
| My assessment | Identity recovery is the critical control point because one successful reset unlocks many downstream systems |
| Decision relevance | SOC, help desk, IAM, BPO, SaaS owners and virtualisation teams require one joined detection and response process |

## Detection Correlation Model

A single event may be legitimate. The chain creates confidence:

```text
Help-desk MFA reset
        +
New device or factor registration
        +
New SaaS application assignment
        +
SharePoint reconnaissance
        +
Cloud or PAM access
        +
Bulk SaaS export
        =
High-confidence identity-led intrusion
```

## Required Telemetry

- Help-desk tickets and call recordings
- Password and MFA reset events
- Identity-provider risk and sign-in logs
- Factor registration and device-enrolment logs
- Okta or Entra application and role assignments
- Microsoft 365 and SharePoint audit logs
- CyberArk and privileged-vault access
- AWS, Azure and Google Cloud audit logs
- Salesforce, Workday and other SaaS audit logs
- OAuth grants and integration changes
- Airbyte, Fivetran and sync-job records
- vCenter and ESXi administrative events
- EDR, browser and virtual-machine telemetry

## Detection and Hunting Questions

1. Was a privileged MFA reset supported by independent identity verification?
2. Did the user register a new factor and access sensitive applications immediately afterwards?
3. Did the same identity add applications, roles or cloud credentials to itself?
4. Was SharePoint searched for VPN, VDI, security or administrator documentation?
5. Did an identity access applications outside its normal role?
6. Were cloud-to-cloud synchronisation jobs created without an approved business request?
7. Did vCenter attach an unexpected ISO, create a VM or restart a guest outside maintenance?
8. Did data export follow access from a new device or internal VM?

## Defensive Recommendations

- Require independent, phishing-resistant re-verification for privileged identity recovery.
- Prevent one help-desk analyst from resetting high-privilege credentials and MFA without approval.
- Use device-bound authentication and conditional access.
- Alert on factor changes followed by privileged access.
- Limit self-service or self-assignment of SaaS applications and cloud roles.
- Centralise SaaS logs and retain enough detail for investigation.
- Monitor cloud-to-cloud connectors and OAuth grants.
- Protect ADFS signing material and federation infrastructure.
- Segment vCenter and ESXi management using separate privileged identities.
- Test outsourced help desks through controlled social-engineering exercises.

## Business Implications

- A weak identity-recovery process can neutralise an otherwise strong MFA deployment.
- SaaS providers secure their platforms, but the customer remains responsible for compromised identities and excessive permissions.
- BPO and help-desk contracts should specify identity-proofing, logging and incident-response requirements.
- Virtualisation compromise can disrupt many critical services at once.
- Employee intimidation requires safety and law-enforcement planning.

## Confidence and Limitations

- **High confidence:** the recurring attack path and platform abuse documented by Mandiant.
- **Moderate confidence:** strategic interpretation of why specific sectors or prominent brands are selected.
- The profile represents overlapping public clusters and does not prove fixed membership or central command.

## Sources

1. Mandiant — UNC3944 Targets SaaS Applications:
https://cloud.google.com/blog/topics/threat-intelligence/unc3944-targets-saas-applications

2. Mandiant — Defending Against UNC3944: Cybercrime Hardening Guidance from the Frontlines:
https://cloud.google.com/blog/topics/threat-intelligence/unc3944-proactive-hardening-recommendations

3. MITRE ATT&CK — Scattered Spider, Group G1015:
https://attack.mitre.org/groups/G1015/
