# Skills Demonstrated

## Purpose

This file states exactly what I completed and separates finished analysis from work that still requires laboratory validation.

## Intelligence planning

I defined intelligence requirements before selecting actors. The project asks which threats are most relevant to digital financial services during 2023–2026, what they target and what a financial SOC should detect or change.

**Evidence:** project scope, requirements and relevance-scoring method.

## Source collection and validation

I collected evidence from:

- MITRE ATT&CK;
- CISA and FBI advisories;
- ENISA, Europol and EU supervisory sources;
- Mandiant and Google Threat Intelligence incident reporting;
- FS-ISAC financial-sector reporting;
- software-vendor incident and security advisories.

I recorded the exact claim, source, date, confidence and limitations in CSV source logs.

**Evidence:** `data/source-log.csv` and `data/operational-extension-source-log.csv`.

## Analytic tradecraft

I separated:

```text
Observed fact
Publisher assessment
My assessment
Confidence
Alternative explanation
Decision relevance
```

I did not treat actor aliases, infrastructure location or ATT&CK overlap as proof of identity.

**Evidence:** analytic framework and context registers.

## Financial-sector threat modelling

I expanded the scope beyond traditional bank servers to include:

- payment and SWIFT-connected systems;
- cryptocurrency and wallet infrastructure;
- cloud identity and SaaS;
- developers, CI/CD and open-source packages;
- outsourced service desks and support personnel;
- third-party MFT and ERP platforms;
- virtualisation, backup and recovery systems;
- customer-facing availability.

**Evidence:** actor profiles, campaign analyses and financial SOC telemetry catalogue.

## Threat-actor and campaign research

I researched and compared:

- DPRK financial-theft activity;
- Scattered Spider / UNC3944;
- CL0P-branded mass exploitation;
- APT41;
- Cobalt Group;
- Silence.

I added incident studies for DMM Bitcoin, Bybit, UNC1069, Axios, Kali365, MOVEit, Oracle EBS and Coinbase.

**Evidence:** `actor-profiles/` and `campaign-analysis/`.

## MITRE ATT&CK mapping

I mapped selected source-observed behaviours to ATT&CK techniques only when the mapping helped explain an attack path, required telemetry or detection opportunity.

I used the current ATT&CK structure and recorded that ATT&CK v19 split the former Defense Evasion tactic into Stealth and Defense Impairment.

**Evidence:** `attack-mapping/common-techniques.md` and each detection specification.

## Detection engineering

I converted intelligence into twelve vendor-neutral detection specifications covering:

- identity recovery and token abuse;
- public-application exploitation;
- support-insider access;
- BEC and payment changes;
- voice and video impersonation;
- developer and transaction compromise;
- malicious redirects;
- cloud exfiltration;
- virtualisation and recovery;
- payment-system operator imitation;
- DDoS and service degradation.

Each specification includes telemetry, correlation logic, false positives, investigation, containment and validation.

**Evidence:** `detections/` and `data/detection-coverage-matrix.csv`.

## Detection-rule design

I created an experimental Sigma correlation rule for a controlled Windows identity lab. The rule uses the current dedicated Sigma correlation format rather than the deprecated pipe/near style.

**Evidence:** `detections/sigma/`.

## Laboratory planning

I designed a safe validation roadmap and a first Windows Active Directory test using a custom non-production finance group.

I did not claim that the rule was validated before the lab was executed.

**Evidence:** `lab-plans/detection-validation-roadmap.md` and `lab-plans/windows-identity-correlation/`.

## Threat-intelligence platform design

I designed how the project could be represented in MISP using reports, objects, ATT&CK relationships, confidence, TLP, PAP and indicator lifecycle controls.

**Evidence:** `platform-design/misp-financial-threat-model.md`.

## Current standards and modernisation

I documented current parallels and updates including:

- TLP 2.0;
- RDAP replacing gTLD WHOIS;
- SHA-256 as the primary investigation hash;
- CVSS with EPSS, KEV and asset context;
- STIX 2.1 and TAXII 2.1;
- Sigma correlation rules;
- MISP Workbench;
- DORA;
- modern token, SaaS, supply-chain and AI-assisted threats.

## Communication

I wrote the project for both SOC analysts and non-technical decision-makers. New concepts are briefly defined and technical findings are translated into business and leadership implications.

## Honest limitations

The following work remains:

- execute the Windows identity lab;
- map the Sigma rule to the selected SIEM;
- validate event fields and alert logic;
- tune false positives using laboratory or authorised organisational data;
- implement a safe MISP event in the BTL1 MISP lab;
- add screenshots only after the tests are completed.

These limitations are part of the portfolio evidence because they show the difference between research, design and validated operational capability.
