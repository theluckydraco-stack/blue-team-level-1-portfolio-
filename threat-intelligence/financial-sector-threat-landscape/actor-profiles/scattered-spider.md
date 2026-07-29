# Scattered Spider / UNC3944

## Status

**Strategic and technical baseline complete — primary identity and SaaS threat actor**

## Executive Assessment

Scattered Spider / UNC3944 is highly relevant to a modern financial SOC because its intrusions often begin by exploiting business processes rather than software vulnerabilities. The group researches employees, calls help desks, resets passwords or MFA methods, takes over privileged identities and then expands through cloud, SaaS and virtualisation platforms using legitimate administrative capabilities.

The group is financially motivated and has shifted between SIM swapping, ransomware, data theft and extortion. Mandiant observed sector-focused targeting of financial-services organisations in late 2023. The techniques are especially relevant to large enterprises with outsourced service desks, broad SSO integrations and complex hybrid-cloud environments.

The central lesson is:

```text
The help desk can become the front door to every application connected to identity.
```

## Identity and Alias Limitations

| Field | Current finding |
|---|---|
| MITRE ATT&CK ID | `G1015` |
| Common associated names | Scattered Spider, UNC3944, Octo Tempest, Roasted 0ktapus, Storm-0875 and other partially overlapping labels |
| Activity observed since | At least 2022 |
| Broad assessment | Financially motivated, native-English-speaking cybercriminal activity with strong social-engineering capability |
| Project role | Primary identity, SaaS and virtualisation actor |
| Confidence | High in broad behaviour and current financial-sector relevance; moderate when treating every public alias or individual as one identical group |

MITRE and Mandiant describe substantial overlap among several public names. The project therefore uses `Scattered Spider / UNC3944` as a working label and preserves the source-specific name for each claim.

## Motivation and Strategic Context

### Financial gain

The primary publicly documented motive is financial gain through:

- SIM swapping and account takeover;
- ransomware deployment;
- theft of sensitive data;
- extortion to prevent disclosure;
- cryptocurrency ransom payments.

Mandiant reported that the group moved from early telecommunications and SIM-swap activity into ransomware and data-theft extortion, then increasingly relied on data theft without necessarily deploying ransomware.

### Sector waves and victim selection

Mandiant observed the group concentrating on particular sectors during different periods, including financial services in late 2023. It also assessed that the group sometimes targeted prominent brands, possibly for prestige and media attention.

**My assessment:** victim selection may combine two incentives:

```text
Large organisation
        ↓
High-value data and ability to pay
        +
Large help desk and outsourced support surface
        +
Public visibility and criminal reputation value
```

**Confidence:** moderate. Financial value and operational opportunity are strongly supported; prestige is a publisher assessment and may not apply to every campaign.

### Coercion and intimidation

Mandiant reported threats involving doxxing, physical harm and compromising material during some operations.

**Strategic implication:** the response may involve employee safety, executive protection, legal counsel and law enforcement—not only technical containment.

## Why Financial Services Are Exposed

Financial institutions frequently depend on:

- large internal and outsourced help desks;
- business-process outsourcing providers;
- Okta, Entra ID or other identity platforms;
- broad SSO connections to SaaS applications;
- privileged-access management systems such as CyberArk;
- Microsoft 365, Salesforce and Workday;
- AWS, Azure and Google Cloud;
- VMware vCenter and ESXi;
- remote support and virtual desktop tools;
- customer PII and financial data that can support extortion.

A successful identity takeover may give the actor access to many applications without separately compromising each one.

## Typical Attack Path

Mandiant described a recurring chain:

```text
Employee research and stolen personal information
        ↓
Voice call or SMS phishing against employee or help desk
        ↓
Password reset and attacker-controlled MFA registration
        ↓
Privileged identity or SSO access
        ↓
Internal documentation and application discovery
        ↓
Cloud, SaaS, PAM and virtualisation access
        ↓
Data collection and exfiltration to attacker cloud storage
        ↓
Extortion, ransomware or evidence destruction
```

[Detailed help-desk-to-SaaS attack-path analysis](../campaign-analysis/unc3944-helpdesk-to-saas.md)

## Help-Desk Social Engineering

Mandiant reviewed recordings of calls in which actors spoke clear English and targeted accounts with high privilege potential. The actors possessed personal information such as dates of birth, manager names and job details to bypass identity-verification questions.

A common story was that the employee had received a new phone and needed an MFA reset. The help-desk administrator then performed a legitimate support action for the wrong person.

**My assessment:** the vulnerability is not simply an untrained employee. It is an identity-recovery process that allows knowledge-based information to replace strong proof of identity.

## Identity, Cloud and SaaS Expansion

After initial access, Mandiant observed behaviour including:

- assigning a compromised Okta account to additional applications;
- using SSO to access Azure, AWS, GCP, Salesforce, Workday, CyberArk, CrowdStrike and vCenter;
- reading internal SharePoint guidance for VPN, VDI and remote-access requirements;
- using Microsoft 365 discovery features to find recent sensitive projects and organisational relationships;
- exporting ADFS certificates to support forged SAML access;
- using legitimate SaaS synchronisation tools such as Airbyte and Fivetran to move data to attacker-controlled cloud storage;
- accessing cloud applications from inside compromised environments, reducing the value of simple source-IP reputation.

### Why this is difficult to detect

Much of the activity uses valid identities, approved applications and legitimate administration features.

```text
Normal administrator:
Resets MFA, assigns an application and accesses cloud data.

Threat actor:
Performs the same actions using a compromised privileged identity.
```

Detection therefore requires context: who requested the action, which device was used, whether the change matched a ticket, what applications were added and what happened afterwards.

## Virtualisation and Recovery Risk

Mandiant observed UNC3944 manipulating VMware environments, including mounting the `PCUnlocker` ISO to virtual machines to reset local administrator passwords and bypass normal domain controls. Earlier incidents also involved ALPHV ransomware on ESXi hypervisors.

Virtualisation platforms are high-value because they can provide:

- access to many servers from one control plane;
- the ability to create attacker-controlled virtual machines;
- offline modification of guest systems;
- destruction or encryption of evidence;
- disruption of recovery and business operations.

## Public Legal and Law-Enforcement Context

In September 2025, the U.S. Department of Justice charged UK national Thalha Jubair and alleged participation in a Scattered Spider extortion scheme involving at least 120 attacks and more than $115 million in ransom payments.

In July 2026, the DOJ announced that Peter Stokes had been arrested in Finland and extradited to the United States. A criminal complaint alleged involvement in Scattered Spider activity and a 2025 intrusion against a luxury jewellery retailer.

These are public criminal allegations. The named individuals must be described as **charged** or **alleged** unless a reliable source establishes conviction. The cases also do not prove that every person using the Scattered Spider label worked in one fixed organisation.

## Selected ATT&CK Behaviours

| Technique ID | Technique | Source-observed procedure | Why it matters to a financial SOC | Required telemetry |
|---|---|---|---|---|
| `T1656` | Impersonation | Actors impersonate employees or IT/help-desk personnel | Human trust can bypass technical perimeter controls | Help-desk recordings, ticketing, HR identity data, employee reports |
| `T1566.004` | Phishing: Spearphishing Voice | Voice calls are used to obtain access or trigger support actions | Telephone-based attacks may bypass email security entirely | Call recordings, ticket records, identity changes, user reporting |
| `T1621` | Multi-Factor Authentication Request Generation | Repeated MFA requests are used for fatigue attacks | Push-based MFA can become an approval prompt for the attacker | IdP MFA events, denied prompts, source device and location |
| `T1556.006` | Modify Authentication Process: Multi-Factor Authentication | Actors register attacker-controlled MFA methods after account compromise | Persistent access can survive password resets | MFA registration, device enrollment, factor removal and help-desk logs |
| `T1078.004` | Valid Accounts: Cloud Accounts | Compromised accounts access SaaS and cloud platforms | Activity may appear legitimate and originate from trusted networks | IdP, SSO, SaaS, cloud and device telemetry |
| `T1098` | Account Manipulation | Actors add roles, applications or credentials to compromised identities | One identity change can expand access to many platforms | Okta/Entra admin logs, role assignments, app assignments, ticket correlation |
| `T1213.002` | Data from Information Repositories: SharePoint | Internal documentation and sensitive data are searched through SharePoint or M365 | Collaboration platforms contain network guides, projects and organisational context | Microsoft 365 audit, SharePoint search and file-access logs |
| `T1530` | Data from Cloud Storage | Actors access data in SaaS and cloud repositories | Sensitive data may never cross the on-premises network perimeter | SaaS audit, object access, API calls and DLP logs |
| `T1567.002` | Exfiltration Over Web Service: Exfiltration to Cloud Storage | Synchronisation tools move victim SaaS data to attacker-controlled cloud storage | The transfer may occur cloud-to-cloud and bypass network sensors | SaaS integration, OAuth, sync job, storage and CASB logs |
| `T1606.002` | Forge Web Credentials: SAML Tokens | ADFS certificates may be stolen to support Golden SAML access | Forged tokens can create persistent access across federated applications | ADFS certificate access, token claims, service-provider and IdP correlation |

## Detection and Threat-Hunting Opportunities

### 1. Help-desk and identity recovery

Alert on:

- password and MFA reset without a matching verified ticket;
- high-privilege user claiming a new or lost phone;
- several identity changes during one call;
- factor registration immediately followed by access from a new device;
- support actions based only on personal information that may be publicly available or stolen.

### 2. SSO and application expansion

Hunt for:

- a user assigning themselves to many Okta or Entra applications;
- new cloud roles or credentials outside normal change windows;
- access to CyberArk, CrowdStrike, Salesforce, Workday or vCenter shortly after an MFA reset;
- new SSO application tiles or administrator privileges not linked to an approved request;
- sign-ins originating from compromised internal virtual machines.

### 3. SaaS reconnaissance and exfiltration

Hunt for:

- unusual SharePoint or M365 search volume;
- access to recent executive, legal, financial or security projects;
- creation of Airbyte, Fivetran or similar synchronisation jobs;
- new OAuth grants or integrations capable of bulk data transfer;
- cloud-to-cloud transfers to unapproved storage accounts;
- data export without corresponding endpoint or firewall traffic.

### 4. Virtualisation abuse

Hunt for:

- unexpected ISO attachment to virtual machines;
- VM reboots and BIOS changes outside maintenance;
- new virtual machines created by help-desk or identity-admin accounts;
- ESXi or vCenter access soon after identity recovery;
- hypervisor administrative actions from unusual devices;
- evidence loss following encryption or deletion of virtual machines.

## Defensive Priorities

1. Use phishing-resistant MFA and device-bound authentication for privileged users.
2. Require strong re-verification and supervisor approval for privileged password or MFA resets.
3. Remove knowledge-based questions as the primary proof of identity.
4. Record help-desk calls and retain ticket, identity and telephony evidence.
5. Restrict which roles can register new MFA methods or assign SaaS applications.
6. Centralise logs from Okta/Entra, Microsoft 365, Salesforce, CyberArk, cloud platforms and vCenter.
7. Monitor OAuth grants, SaaS connectors and cloud-to-cloud data movement.
8. Protect ADFS certificates and correlate federation events with service-provider sign-ins.
9. Segment virtualisation management and require separate privileged identities.
10. Include BPO and outsourced help-desk providers in detection, testing and incident-response plans.

## Business and Leadership Implications

- A technically strong MFA deployment can fail if the recovery process is weak.
- Outsourced help desks and BPO providers are part of the organisation's security perimeter.
- SaaS data theft may not create traditional network-exfiltration alerts.
- Hypervisor compromise can turn an identity incident into organisation-wide disruption.
- Employee intimidation may require coordination with law enforcement and physical-security teams.
- High-profile brands may face additional exposure because publicity can increase criminal status and extortion pressure.

## Alternative Hypotheses and Intelligence Gaps

- Public aliases may represent overlapping communities rather than a fixed membership list.
- Native English speech and geography do not prove nationality or residence.
- Help-desk resets may be legitimate; risk comes from the surrounding context and follow-on activity.
- Not every sector wave is centrally planned; access availability and publicity may influence target selection.
- Vendor reporting may observe different subsets of the broader criminal ecosystem.
- Legal complaints contain allegations and may change through later court proceedings.

## Confidence Assessment

| Judgement | Confidence |
|---|---|
| Scattered Spider / UNC3944 is a major current identity and SaaS threat to large enterprises | High |
| Financial-services organisations were a documented sector focus in late 2023 | High |
| Help-desk and MFA-reset abuse are central operating methods | High |
| Prestige and media attention influence some victim selection | Moderate |
| Every public alias and charged individual belongs to one centrally controlled group | Low |

## Authoritative and Primary Sources

1. Mandiant — UNC3944 Targets SaaS Applications: https://cloud.google.com/blog/topics/threat-intelligence/unc3944-targets-saas-applications
2. Mandiant — Defending Against UNC3944: Cybercrime Hardening Guidance from the Frontlines: https://cloud.google.com/blog/topics/threat-intelligence/unc3944-proactive-hardening-recommendations
3. MITRE ATT&CK — Scattered Spider, Group G1015: https://attack.mitre.org/groups/G1015/
4. FBI and international partners — Scattered Spider Joint Cybersecurity Advisory: https://www.fbi.gov/file-repository/cyber-alerts/scattered-spider-072925.pdf/view
5. U.S. Department of Justice — United Kingdom National Charged in Connection with Multiple Cyber Attacks: https://www.justice.gov/opa/pr/united-kingdom-national-charged-connection-multiple-cyber-attacks-including-critical
6. U.S. Department of Justice — Alleged Member of Scattered Spider Arrested in Finland and Extradited: https://www.justice.gov/opa/pr/alleged-member-criminal-cyber-hacking-group-scattered-spider-arrested-finland-and-extradited
