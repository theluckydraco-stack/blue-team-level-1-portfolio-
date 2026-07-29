# Financial-Sector Threat Landscape

## Project Status

**In progress — APT41 research phase**

## Problem Statement

Financial institutions face different adversaries with different objectives. A list of actor names or indicators does not tell a SOC which threats are most relevant, which behaviours should be monitored, or which defensive controls should be prioritised.

In this project, I am developing a cyber-threat-intelligence assessment that compares threat actors relevant to European financial services, with an Eastern European focus. APT41 is the initial deep-dive actor because it is the subject of the BTL1 threat-actor research activity.

## Intelligence Objective

I aim to answer the following questions:

1. Which threat actors have documented relevance to European financial services?
2. What motivates each actor?
3. Which organisations, systems, countries, and financial processes do they target?
4. Which initial-access and post-compromise techniques recur across the actors?
5. Which logs and telemetry would a financial SOC need to detect those behaviours?
6. Which defensive improvements would provide protection against multiple actors?

## Scope

- **Sector:** Banks, payment processors, fintech platforms, cryptocurrency services, card-processing environments, and SWIFT-connected organisations
- **Geography:** Europe, with an Eastern European focus
- **Current landscape:** 2023–2026
- **Historical activity:** Included when required to explain an actor's development or established operating pattern
- **Initial actor set:** APT41, Cobalt Group, Silence, and APT38

## Methodology

I will use an intelligence-led research process:

1. Define intelligence requirements and scope.
2. Collect information from authoritative and reputable sources.
3. Record each source and the claim it supports.
4. Separate confirmed facts from analytical assessments.
5. Map selected actor behaviours to MITRE ATT&CK.
6. Compare actors and identify recurring financial-sector attack patterns.
7. Translate the findings into detection, threat-hunting, and defensive recommendations.
8. Record intelligence gaps, conflicting reporting, and confidence levels.

## Planned Deliverables

- [APT41 actor profile](actor-profiles/apt41.md)
- Cobalt Group actor profile
- Silence actor profile
- APT38 actor profile
- [Actor comparison dataset](data/actor-comparison.csv)
- [Research source log](data/source-log.csv)
- [Common ATT&CK techniques](attack-mapping/common-techniques.md)
- Financial-sector attack-path analysis
- Detection and threat-hunting recommendations
- Final executive assessment

## Research Quality Rules

- I will use primary or authoritative sources where available.
- I will cross-check important attribution and targeting claims.
- I will treat actor names as analytical activity clusters rather than confirmed legal identities.
- I will record publication dates and access dates.
- I will distinguish observed facts from my own assessment.
- I will assign confidence where uncertainty exists.
- I will not publish live malicious files, credentials, or BTL1 assessment material.

## Current Phase

The current task is to build a verified APT41 profile covering identity, motivation, targeting, significant campaigns, financial-sector relevance, selected ATT&CK techniques, detection opportunities, and intelligence gaps.
