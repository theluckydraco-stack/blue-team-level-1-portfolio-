# Digital Financial Services Threat Landscape

## Project Status

**In progress — current and historical actor baselines complete; cross-actor detection analysis next**

## Problem Statement

Modern financial services are not contained inside traditional bank servers. Banks, payment processors, fintech platforms and cryptocurrency services depend on cloud accounts, online business applications, virtualisation, APIs, outsourced service desks, software vendors and other third parties.

A report that only lists malware, IP addresses or MITRE ATT&CK techniques may still fail to answer the questions that matter:

- Why was this organisation or employee targeted?
- What did the attacker want to achieve?
- Which business dependency made the attack possible?
- What evidence should a SOC collect?
- What should security leaders change?

I am therefore building a threat-intelligence assessment that connects technical activity to victim selection, timing, motivation, business impact and defensive decisions.

## Who This Is Written For

The project is designed for two audiences:

1. **SOC and incident-response readers** — people who need attack paths, logs, detections, hunting ideas and containment priorities.
2. **Security leaders and business stakeholders** — people who need to understand motivation, financial exposure, third-party consequences and the confidence behind each assessment.

Technical terms are explained briefly when they first appear. A fuller glossary is available in the [Reader Guide](methodology/reader-guide.md).

## How to Read the Actor Names

Security companies often assign different names to partly overlapping activity. These names are working intelligence labels, not automatically the legal names of fixed organisations.

For this project:

- an **actor or activity cluster** is a set of incidents researchers believe are related;
- an **actor family** groups related source-specific labels without claiming they are identical;
- an **extortion brand** is a public name used to threaten victims or publish stolen data and may be used by changing operators.

I preserve the name used by each source and explain uncertainty where definitions differ.

## Why Each Profile Is Included

| Priority | Profile | Plain-language reason for inclusion | Financial-sector relevance |
|---:|---|---|---|
| 1 | [DPRK financial-theft activity](actor-profiles/dprk-financial-theft.md) | North Korean operations have directly stolen money and virtual assets from banks, payment systems, cryptocurrency exchanges and their technology providers | Direct theft, cloud compromise, developer targeting, laundering, sanctions and remote-worker risk |
| 2 | [Scattered Spider / UNC3944](actor-profiles/scattered-spider.md) | This financially motivated cluster often persuades help desks to reset accounts and MFA, then uses the stolen identity to access cloud and SaaS systems | Financial-services targeting, identity recovery, outsourced support, customer data and extortion |
| 3 | [CL0P-branded mass exploitation](actor-profiles/clop.md) | These campaigns exploit widely used enterprise software, steal concentrated business data and extort many organisations at scale | Third-party exposure, managed file transfer, ERP systems, data theft and systemic supplier risk |
| 4 | [APT41](actor-profiles/apt41.md) | I first encountered APT41 in a Blue Team Level 1 training exercise. I retained it as a comparison case because it shows how espionage, surveillance, public-facing exploitation and financially motivated activity can overlap | Useful comparison for strategic targeting, supply-chain risk and broad exploitation, but not ranked as the most active direct financial thief |
| 5 | [Cobalt Group](actor-profiles/cobalt-group.md) | This historical cybercriminal operation moved from employee phishing into ATM, card-processing, payment and SWIFT-connected systems | Shows the complete path from workstation compromise to organised bank cash-out |
| 6 | [Silence](actor-profiles/silence.md) | This historical banking actor recorded employee activity to learn how legitimate financial procedures worked before stealing money | Shows why process reconnaissance, screen recording and valid-account monitoring matter |

Cobalt Group and Silence are not placed above the current profiles because the strongest detailed public reporting for their core campaigns is concentrated mainly in 2016–2020. They are included to preserve important Eastern European banking lessons without presenting them as the most active 2023–2026 threats.

## Intelligence Requirements

I aim to answer:

1. Which threat actors or attack models are most relevant to digital financial services during 2023–2026?
2. Which parts of the ecosystem do they target: banks, payments, fintech, cryptocurrency, cloud identity, SaaS or third parties?
3. What financial, criminal or strategic outcome are they pursuing?
4. What does the timing and choice of victims suggest?
5. Which real-world organisations, public events, government interests or criminal systems are credibly connected to the activity?
6. Which attack behaviours recur across the profiles?
7. Which logs would allow a financial SOC to detect those behaviours?
8. Which controls reduce risk across several attack models?
9. Where do sources disagree, and how confident should the assessment be?

## Scope

- **Financial ecosystem:** Banks, payment processors, fintech platforms, cryptocurrency exchanges and services, card-processing environments, SWIFT-connected organisations and financial technology providers
- **Modern attack surface:** Cloud identity, SaaS, APIs, third-party integrations, outsourced IT and business-process services, virtualisation, edge devices, software supply chains and Web3 infrastructure
- **Geography:** Europe, with Eastern Europe used as regional context without allowing geography to override stronger current evidence
- **Current period:** 2023–2026
- **Historical activity:** Included when it explains an actor's development, a sponsor relationship or a recurring financial attack model

## Analytical Model

Each major claim moves through the following chain:

```text
Technical observation
        ↓
Victim, asset and campaign context
        ↓
Source assessment of motive or attribution
        ↓
My confidence-qualified assessment
        ↓
Operational and strategic implications
```

For example, targeting a hotel reservation database is not recorded only as database access. The analysis also asks who was expected to stay there, why travel information was valuable, what the publisher assessed, which alternative explanations remain and what the case teaches decision-makers.

## Research Rules

- I separate **observed fact**, **publisher assessment** and **my judgement**.
- I describe the evidence and source quality behind important conclusions.
- I assign confidence and consider alternative explanations.
- I explain new concepts in plain language.
- I prioritise current financial-sector relevance over the order used in the training course.
- I use MITRE ATT&CK to organise behaviour, not to prove attribution.
- I name people and companies only when reliable public sources do so and preserve legal wording such as `alleged`, `charged` or `assessed`.
- I do not merge overlapping actor labels without source-specific evidence.
- I do not publish live malicious files, credentials, personal data or course assessment material.

The detailed method is documented in the [Analytic Framework](methodology/analytic-framework.md).

## Completed Profiles and Case Studies

### Current profiles

- [APT41 comparison profile](actor-profiles/apt41.md)
- [DPRK financial-theft profile](actor-profiles/dprk-financial-theft.md)
- [Scattered Spider / UNC3944 profile](actor-profiles/scattered-spider.md)
- [CL0P-branded mass exploitation profile](actor-profiles/clop.md)

### Historical banking profiles

- [Cobalt Group](actor-profiles/cobalt-group.md)
- [Silence](actor-profiles/silence.md)
- [Historical Eastern European bank-intrusion comparison](campaign-analysis/eastern-european-bank-intrusions.md)

### Campaign analysis

- [DMM Bitcoin 2024 attack path](campaign-analysis/dmm-bitcoin-2024.md)
- [Bybit 2025 theft and laundering context](campaign-analysis/bybit-2025.md)
- [UNC3944 help-desk-to-SaaS attack path](campaign-analysis/unc3944-helpdesk-to-saas.md)
- [MOVEit 2023 mass data-theft campaign](campaign-analysis/moveit-2023.md)
- [Oracle E-Business Suite 2025 extortion campaign](campaign-analysis/oracle-ebs-2025.md)

### Supporting analysis

- [Actor comparison dataset](data/actor-comparison.csv)
- [Research source log](data/source-log.csv)
- [Strategic context register](data/strategic-context-register.csv)
- [Common ATT&CK techniques](attack-mapping/common-techniques.md)
- [Reader Guide](methodology/reader-guide.md)

## Current Finding

The strongest financial-sector risks are not limited to malware on bank workstations:

```text
Direct theft of funds and virtual assets
Identity recovery and help-desk compromise
Cloud and SaaS account takeover
Trusted developer and supplier access
Mass exploitation of internet-facing enterprise software
Data theft followed by extortion
Movement from employee systems into ATM and payment infrastructure
Observation of legitimate employee procedures before fraud
```

## Current Phase

The actor and campaign baselines are now complete. The next phase will convert the research into a short set of cross-actor detection priorities for a financial SOC and a final executive assessment for security leadership.
