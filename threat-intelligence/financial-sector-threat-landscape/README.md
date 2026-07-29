# Digital Financial Services Threat Landscape

## Project Status

**In progress — scope and actor-prioritisation phase**

## Problem Statement

Modern financial services are no longer contained inside traditional bank servers. Banks, payment processors, fintech platforms and cryptocurrency services depend on cloud identity, SaaS applications, virtualisation, APIs, outsourced service desks, software vendors and other third parties.

A useful threat-intelligence assessment must therefore identify which threat actors and attack models are most relevant to this wider ecosystem, how they gain access, which assets they target, and what a SOC should monitor or improve.

## Intelligence Objective

I aim to answer:

1. Which threat actors or activity clusters are most relevant to digital financial services during 2023–2026?
2. Which parts of the financial ecosystem do they target: banks, payments, fintech, cryptocurrency, cloud identity, SaaS or third parties?
3. What motivates each actor and what business outcome are they pursuing?
4. Which initial-access and post-compromise behaviours recur across the actor set?
5. Which logs and telemetry would allow a financial SOC to detect those behaviours?
6. Which controls would reduce risk across several attack models?
7. Where do public sources disagree, and how confident should the assessment be?

## Scope

- **Sector:** Banks, payment processors, fintech platforms, cryptocurrency exchanges and services, card-processing environments, SWIFT-connected organisations and financial technology providers
- **Modern attack surface:** Cloud identity, SaaS, APIs, third-party integrations, outsourced IT and BPO services, virtualisation, edge devices, software supply chains and Web3 infrastructure
- **Geography:** Europe, with Eastern Europe used as a regional context rather than a constraint that overrides current relevance
- **Current landscape:** 2023–2026
- **Historical activity:** Included when needed to explain an actor's development or a recurring financial attack pattern

## Relevance-Based Actor Set

### Primary research actors

1. **DPRK financial-theft activity** — direct theft from banks, payment systems, cryptocurrency exchanges and other virtual-asset infrastructure. Public labels such as APT38, BlueNoroff and TraderTraitor will be mapped source by source rather than treated as automatically identical.
2. **Scattered Spider / UNC3944** — identity-focused intrusion, help-desk social engineering, MFA reset abuse, cloud and SaaS access, data theft and extortion, including documented financial-services targeting.
3. **CL0P / Lace Tempest-related activity** — exploitation of third-party software and mass data-theft extortion, used to study how one vendor weakness can create downstream financial-sector exposure.

### Secondary comparison actor

4. **APT41** — retained because it is the BTL1 research actor and provides a useful comparison involving state espionage, broad exploitation of public-facing systems, supply-chain compromise and documented finance-sector targeting. It is not assumed to be the most relevant actor for this project.

### Historical regional context

- **Cobalt Group** — strong historical relevance to banks, ATM systems, card processing, payment systems and SWIFT, particularly in Eastern Europe.
- **Silence** — historical targeting of financial institutions in Eastern Europe and neighbouring regions.

The final actor set may change if newer evidence shows that another cluster is more relevant to the selected period and sector.

## Methodology

1. Define intelligence requirements and relevance criteria.
2. Collect information from authoritative and reputable sources.
3. Record each source and the exact claim it supports.
4. Separate confirmed observations from analytical assessment.
5. Map selected behaviours to the current MITRE ATT&CK version.
6. Compare actors by target, motivation, attack path and modern attack surface.
7. Translate findings into SOC telemetry, detection, hunting and defensive recommendations.
8. Record alias uncertainty, intelligence gaps, conflicting reporting and confidence levels.

## Planned Deliverables

- [APT41 comparison profile](actor-profiles/apt41.md)
- [DPRK financial-theft profile](actor-profiles/dprk-financial-theft.md)
- [Scattered Spider / UNC3944 profile](actor-profiles/scattered-spider.md)
- [CL0P third-party compromise profile](actor-profiles/clop.md)
- Cobalt Group historical regional profile
- Silence historical regional profile
- [Actor comparison dataset](data/actor-comparison.csv)
- [Research source log](data/source-log.csv)
- [Common ATT&CK techniques](attack-mapping/common-techniques.md)
- Financial-sector attack-path analysis
- Detection and threat-hunting recommendations
- Final executive assessment

## Research Quality Rules

- I will prioritise direct sector and time-period relevance over the order used in the BTL1 activity.
- I will use primary or authoritative sources where available.
- I will cross-check important attribution and targeting claims.
- I will treat actor names as analytical activity clusters rather than confirmed legal identities.
- I will not merge APT38, BlueNoroff, TraderTraitor, Lazarus or other overlapping labels without source-specific evidence.
- I will record publication and access dates.
- I will distinguish observed facts from my own assessment.
- I will assign confidence where uncertainty exists.
- I will include cloud, SaaS, identity, third-party, virtualisation and crypto/Web3 risks where evidence supports them.
- I will not publish live malicious files, credentials or BTL1 assessment material.

## Current Phase

The current task is to complete the relevance baseline, finish the APT41 comparison profile, and then begin with the highest-priority actor set rather than treating the BTL1 actor as the main threat by default.