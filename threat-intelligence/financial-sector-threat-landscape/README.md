# Digital Financial Services Threat Landscape

## Project Status

**In progress — APT41, DPRK and Scattered Spider baselines complete; CL0P research next**

## Problem Statement

Modern financial services are no longer contained inside traditional bank servers. Banks, payment processors, fintech platforms and cryptocurrency services depend on cloud identity, SaaS applications, virtualisation, APIs, outsourced service desks, software vendors and other third parties.

A purely technical report can explain which malware or ATT&CK technique was observed, but it may still fail to explain why the victim was selected, why the activity occurred at that time, which wider objective it may support, or what the activity means to operational and strategic decision-makers.

This project therefore combines technical cyber-threat intelligence with strategic context. It connects observable behaviour to victim selection, timing, motivation, sponsor-linked interests, business impact and defensive decisions while clearly separating sourced facts from analytical judgement.

## Intended Audiences

The project produces two connected views:

1. **SOC and incident-response view** — attack paths, ATT&CK techniques, telemetry, detections, hunting opportunities and containment priorities.
2. **Strategic stakeholder view** — actor motivation, victimology, geopolitical or criminal context, business exposure, third-party consequences and confidence-qualified implications.

## Intelligence Requirements

I aim to answer:

1. Which threat actors or activity clusters are most relevant to digital financial services during 2023–2026?
2. Which parts of the financial ecosystem do they target: banks, payments, fintech, cryptocurrency, cloud identity, SaaS or third parties?
3. What motivates each actor and what operational, financial or strategic outcome are they pursuing?
4. What does the timing and selection of victims suggest about the actor's priorities?
5. Which real-world organisations, public events, government interests or criminal ecosystems are credibly connected to the activity?
6. Which initial-access and post-compromise behaviours recur across the actor set?
7. Which logs and telemetry would allow a financial SOC to detect those behaviours?
8. Which controls would reduce risk across several attack models?
9. Where do public sources disagree, and how confident should the assessment be?

## Scope

- **Sector:** Banks, payment processors, fintech platforms, cryptocurrency exchanges and services, card-processing environments, SWIFT-connected organisations and financial technology providers
- **Modern attack surface:** Cloud identity, SaaS, APIs, third-party integrations, outsourced IT and BPO services, virtualisation, edge devices, software supply chains and Web3 infrastructure
- **Geography:** Europe, with Eastern Europe used as regional context rather than a constraint that overrides current relevance
- **Current landscape:** 2023–2026
- **Historical activity:** Included when required to explain an actor's development, sponsor relationship or recurring financial attack model

## Relevance-Based Actor Set

### Primary research actors

1. **DPRK financial-theft activity** — direct theft from banks, payment systems, cryptocurrency exchanges and other virtual-asset infrastructure. Public labels such as APT38, BlueNoroff, TraderTraitor and UNC4899 are mapped source by source rather than treated as automatically identical.
2. **Scattered Spider / UNC3944** — identity-focused intrusion, help-desk social engineering, MFA reset abuse, cloud and SaaS access, data theft and extortion, including documented financial-services targeting.
3. **CL0P / FIN11-related activity** — exploitation of third-party enterprise software and mass data-theft extortion, used to study how one provider weakness creates downstream financial-sector exposure.

### Secondary comparison actor

4. **APT41** — retained because it is the BTL1 research actor and provides a strong case study in connecting technical behaviour with state-aligned collection priorities, surveillance-related victim selection, supply-chain compromise, public-facing exploitation and financially motivated activity. It is not assumed to be the most relevant current financial actor.

### Historical regional context

- **Cobalt Group** — strong historical relevance to banks, ATM systems, card processing, payment systems and SWIFT, particularly in Eastern Europe.
- **Silence** — historical targeting of financial institutions in Eastern Europe and neighbouring regions.

The final actor set may change if stronger current evidence changes the relevance assessment.

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

For example, targeting hotel reservation systems is not recorded only as database access. The analysis also considers the timing, the people expected to use the facility, the possible collection requirement, alternative explanations and what the case reveals about actor tasking.

## Analytic Tradecraft Rules

The project methodology is informed by recognised intelligence-analysis principles:

- Separate **observed fact**, **source assessment** and **my analytical judgement**.
- Describe source quality and the evidence supporting each major conclusion.
- Express uncertainty and assign confidence to important judgements.
- Consider alternative explanations rather than forcing one attribution.
- Explain why a finding matters to its intended audience.
- Treat actor names as analytical activity clusters rather than automatically proven legal identities.
- Name real individuals or companies only when reliable public sources do so, and preserve legal language such as `alleged`, `charged` or `assessed`.
- Do not infer government direction solely from geography, language, infrastructure or one shared technique.
- Record changes when newer evidence alters an earlier assessment.

The detailed method is documented in [Analytic Framework](methodology/analytic-framework.md).

## Current Deliverables

- [APT41 comparison profile](actor-profiles/apt41.md) — baseline complete
- [DPRK financial-theft profile](actor-profiles/dprk-financial-theft.md) — baseline complete
- [DMM Bitcoin 2024 attack-path case study](campaign-analysis/dmm-bitcoin-2024.md)
- [Bybit 2025 strategic and laundering case study](campaign-analysis/bybit-2025.md)
- [Scattered Spider / UNC3944 profile](actor-profiles/scattered-spider.md) — baseline complete
- [UNC3944 help-desk-to-SaaS attack-path case study](campaign-analysis/unc3944-helpdesk-to-saas.md)
- [CL0P third-party compromise profile](actor-profiles/clop.md) — next research phase
- Cobalt Group historical regional profile — planned
- Silence historical regional profile — planned
- [Actor comparison dataset](data/actor-comparison.csv)
- [Research source log](data/source-log.csv)
- [Strategic context register](data/strategic-context-register.csv)
- [Common ATT&CK techniques](attack-mapping/common-techniques.md)
- Cross-actor detection and threat-hunting recommendations — planned
- Executive strategic assessment — planned

## Research Quality and Safety

- I prioritise direct sector and time-period relevance over the order used in the BTL1 activity.
- I use primary, governmental or authoritative sources where available.
- I cross-check important attribution, victimology and motivation claims.
- I do not merge overlapping DPRK, APT, UNC, FIN or vendor labels without source-specific evidence.
- I include cloud, SaaS, identity, third-party, virtualisation and crypto/Web3 risks where evidence supports them.
- I do not publish live malicious files, credentials, personal data or BTL1 assessment material.

## Current Phase

The Scattered Spider baseline now covers help-desk social engineering, MFA reset abuse, identity recovery, SSO expansion, cloud and SaaS access, virtualisation control, cloud-to-cloud exfiltration, employee intimidation, public legal allegations and financial-sector relevance.

The next phase is CL0P-related third-party exploitation because it will test a different problem: how one vulnerable enterprise product can expose many downstream organisations without each victim being targeted individually.
