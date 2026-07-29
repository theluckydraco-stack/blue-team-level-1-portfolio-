# Executive Assessment: Digital Financial Services Threat Landscape

## Assessment

I assess with **high confidence** that the most important cyber risks to modern financial services are no longer confined to malware on bank workstations or direct attacks against payment servers.

The strongest current attack models affect the wider trust system around financial services:

1. direct theft from banks, payment and virtual-asset infrastructure;
2. identity recovery, help-desk and privileged-account compromise;
3. cloud, SaaS, session-token and application-integration abuse;
4. exploitation of internet-facing enterprise software;
5. compromise of developers, suppliers and outsourced service providers;
6. data theft and extortion without encryption;
7. attacks on virtualisation, identity and backup systems that reduce recovery capability;
8. fraud and transaction manipulation using legitimate access;
9. availability attacks and geopolitically linked disruption.

The selected actor profiles demonstrate these attack models, but they are not an exhaustive list of every group targeting finance.

## Why the financial sector remains attractive

Financial organisations combine several forms of value:

- money and virtual assets that can be stolen directly;
- customer, employee and corporate information that can be sold or used for fraud;
- trusted access to payment and transaction systems;
- links to governments, major companies and influential individuals;
- dependence on large technology, SaaS and supplier ecosystems;
- strong regulatory and reputational pressure that increases extortion leverage;
- public services whose disruption is immediately visible.

ENISA's analysis of 488 publicly reported European financial-sector incidents from January 2023 to June 2024 found banks to be the most frequently affected entity type. The report also identified DDoS, data-related threats, social engineering, fraud, ransomware, malware and supply-chain attacks as major sector risks.

## Priority threat profiles

### 1. DPRK financial-theft activity

This is the strongest direct financial-theft profile in the project.

Public reporting links North Korean activity to bank theft, SWIFT abuse, cryptocurrency exchanges, wallet providers, developer social engineering, cloud compromise, laundering and fraudulent remote-worker schemes.

The strategic implication is larger than the victim's financial loss. U.S. government reporting assesses that these revenue streams support North Korean state objectives, including weapons programmes. A major theft can therefore become a cyber, fraud, sanctions and national-security incident at the same time.

### 2. Scattered Spider / UNC3944

This profile demonstrates that the help desk and identity-recovery process can become the entry point to the entire enterprise.

The actor often uses employee information and convincing phone calls to obtain password or MFA resets. Once a trusted identity is controlled, the attacker can reach SaaS, cloud, privileged-access and virtualisation platforms through normal administrative features.

The financial-sector lesson is that identity verification must be treated as a security control, not merely a customer-service process.

### 3. CL0P-branded mass exploitation and extortion

This profile demonstrates systemic third-party and application concentration risk.

The MOVEit and Oracle E-Business Suite campaigns show how attackers can exploit one widely used enterprise product, steal concentrated business data and extort many organisations. A financial entity can be affected through a payroll provider, transfer service, administrator, law firm or other processor even when the financial entity's own perimeter was not directly breached.

The lesson is that supplier dependency must be visible before an incident, not discovered during breach notification.

### 4. APT41 comparison profile

APT41 is retained as a strategic comparison rather than ranked as the most active direct financial thief.

Its reporting shows how one broad activity cluster can combine state-aligned espionage, surveillance-related targeting, public-facing exploitation, software supply-chain compromise and financially motivated activity.

The lesson is that a financial intrusion may seek strategic information, access to third parties or long-term positioning rather than immediate monetary theft.

## Historical banking lessons

Cobalt Group and Silence remain useful historical comparisons because they show the full movement from employee compromise to financial-process abuse.

Cobalt Group demonstrated remote ATM cash-out, fraudulent transfers and manipulation of banking systems. Silence recorded employee screens and procedures so attackers could imitate legitimate financial operations.

These cases support a continuing principle:

> Monitoring the workstation is not enough; the SOC must understand the payment, approval and cash-out process the workstation can influence.

## Cross-actor judgement

The actor names differ, but several control failures repeat:

```text
Trusted identity accepted without strong verification
Public-facing system exposed without sufficient visibility
Supplier or SaaS integration granted excessive access
Sensitive data concentrated in one platform
Developer or administrator trusted without transaction-aware monitoring
Recovery infrastructure connected to the same compromised identity system
Cyber, fraud and business evidence investigated separately
```

I assess that financial institutions will gain more defensive value from closing these repeated control gaps than from attempting to maintain a blocklist for every named actor.

## Recommended leadership priorities

### 1. Make identity recovery a Tier-0 process

Require strong independent verification for privileged password and MFA resets. Monitor factor enrolment, role changes and application access immediately after recovery events.

### 2. Know every internet-facing and business-critical technology asset

Maintain ownership, version, exposure, logging and dependency information for VPNs, edge devices, managed file transfer, ERP, SaaS, cloud and virtualisation platforms.

### 3. Govern SaaS integrations and non-human identities

Inventory OAuth applications, API keys, service accounts, personal access tokens and cross-cloud integrations. Apply least privilege, short lifetimes, rotation and monitored consent.

### 4. Map third parties to functions and data

Record which supplier supports each critical or important service, what data it holds, which credentials or integrations it uses, and how quickly it must notify and support the organisation during an incident.

### 5. Join cyber detection with fraud, AML and transaction monitoring

Create escalation paths that combine identity, endpoint, payment, wallet, beneficiary, sanctions and blockchain evidence. A suspicious login and an unusual transfer should not remain in separate queues.

### 6. Protect virtualisation, identity and backups as recovery infrastructure

Use separate administrative paths, phishing-resistant MFA, privileged workstations, segmentation, centralised logging and immutable or isolated recovery copies.

### 7. Prepare for data-theft extortion without encryption

Response plans must include data scoping, customer impact, supplier coordination, legal obligations, executive communications and evidence preservation even when systems remain operational.

### 8. Retain logs from the whole financial technology ecosystem

Forward and protect evidence from cloud identity, SaaS, applications, edge appliances, hypervisors, backups, suppliers and payment systems. Endpoint logs alone cannot reconstruct these attack paths.

## European operational-resilience relevance

The EU Digital Operational Resilience Act reinforces several of these priorities. Covered financial entities remain responsible for ICT risk even when services are outsourced. DORA also requires governance of ICT risk, incident handling, resilience testing and third-party dependencies.

This means threat intelligence should lead to:

- identified critical services and dependencies;
- tested detections and response plans;
- management awareness of concentration risk;
- supplier contractual and evidence requirements;
- measurable improvement in recovery and containment.

A report that only names attackers and indicators does not meet that operational need.

## Confidence and limitations

### High-confidence judgements

- Direct financial and virtual-asset theft remains a major sector threat.
- Identity, SaaS, public-facing systems and third parties are central modern attack surfaces.
- Data-theft extortion does not require ransomware encryption.
- Financial SOCs need visibility into transaction, cloud, supplier and recovery systems in addition to endpoints.

### Moderate-confidence judgements

- The exact ranking of named actors may change as private incidents become public or actor definitions change.
- Public reporting can overrepresent incidents involving well-known companies, visible extortion or vendors with strong research teams.
- A group label may combine several operators or partially overlapping campaigns.

### Project limitations

- The assessment uses publicly accessible intelligence and cannot include private financial-sector sharing.
- Not every European incident is publicly reported.
- MITRE ATT&CK records observed behaviours but does not measure actor prevalence.
- Vendor incident statistics describe their investigation sample rather than the entire global threat landscape.
- The report is a defensive intelligence portfolio project, not legal, regulatory or investment advice.

## Final conclusion

The financial sector is best defended as an interconnected ecosystem rather than a collection of bank servers.

```text
Identity
+ cloud and SaaS
+ suppliers and enterprise applications
+ developers and administrators
+ payment and transaction workflows
+ virtualisation and recovery infrastructure
+ fraud and sanctions processes
= the modern financial attack surface
```

The practical goal is not to predict the exact actor name that will attack next. It is to ensure that the institution can detect and contain the access paths that the most relevant actors repeatedly use.

## Sources

1. ENISA — Threat Landscape: Finance Sector: https://www.enisa.europa.eu/publications/enisa-threat-landscape-finance-sector
2. Google Cloud / Mandiant — M-Trends 2026 Executive Edition: https://cloud.google.com/security/resources/m-trends-executive-edition
3. EUR-Lex — Regulation (EU) 2022/2554, Digital Operational Resilience Act: https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32022R2554
4. MITRE ATT&CK: https://attack.mitre.org/
5. Individual actor, campaign, government and vendor sources are listed in the relevant profile and case-study files.
