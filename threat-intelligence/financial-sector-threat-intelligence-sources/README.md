# Financial-Sector Threat Intelligence Sources — OSINT, Community and Commercial Services

## Purpose

This note identifies threat-intelligence sources that can support banks, fintechs, payment processors and other financial-services organisations in 2026. It is structured around the security decision each source can improve, rather than around a simple free-versus-paid list.

A useful collection should answer several different questions:

```text
What are peer institutions seeing?       -> sector sharing
Which vulnerabilities need action now?   -> exploitation intelligence
How does the adversary operate?           -> actor and TTP intelligence
Which observables require investigation? -> IOC and malware intelligence
Where are credentials or payment data
being traded or abused?                   -> fraud and underground intelligence
```

No external source establishes that activity occurred inside the organisation. Its output must be correlated with internal identity, endpoint, network, cloud, email, transaction and fraud telemetry before a block, escalation or incident declaration is made.

## Sector-sharing communities

These are trusted sharing communities, not ordinary public feeds or commercial CTI products.

| Source | Access | Best operational use |
|---|---|---|
| [FS-ISAC](https://www.fsisac.com/what-we-do/intelx/share/faq) | Membership | Peer financial-sector intelligence at tactical, operational and strategic levels. Its Share platform supports STIX 2.1 and TAXII 2.1, making it suitable for both analyst collaboration and automated dissemination. Use it to ask whether comparable institutions are seeing the same campaign, control failure or fraud pattern. |
| [Swift ISAC](https://www.swift.com/news-events/news/swift-launches-swift-information-sharing-and-analysis-centre) | Swift customers | Intelligence derived from threats affecting the Swift community, including IOCs, malware hashes, YARA rules and attacker methods. Use it for detections, hunts and control changes around local Swift-connected infrastructure and payment operations. |

Membership intelligence is especially valuable because victim and incident context can be shared within a trusted community. Handling restrictions such as Traffic Light Protocol markings and community terms still apply.

## Public and OSINT sources

| Source | What it provides | Best operational use | Important limitation |
|---|---|---|---|
| [CISA Known Exploited Vulnerabilities (KEV) Catalog](https://www.cisa.gov/known-exploited-vulnerabilities-catalog) | An authoritative catalogue of vulnerabilities with evidence of exploitation in the wild, available in machine-readable formats | Prioritise remediation and start compromise assessment for affected internet-facing, identity, cloud and financial-service dependencies | KEV records exploitation, not organisation-specific exposure or compromise; asset criticality and reachability still matter |
| [MITRE ATT&CK](https://attack.mitre.org/resources/) | A public knowledge base of adversary tactics and techniques based on real-world observations | Translate reporting into detection coverage, telemetry requirements and threat-hunting hypotheses | ATT&CK is a behavioural model, not a live alert or confidence-scored feed |
| [URLhaus](https://urlhaus.abuse.ch/api/) | Malware-distribution URLs through an API, database exports, MISP events and network-control formats | Enrich proxy/DNS investigations and hunt for contact with malware-delivery infrastructure | Indicators age quickly; validate status, time and context before blocking |
| [ThreatFox](https://threatfox.abuse.ch/) | Community-submitted IOCs associated with malware families and campaigns | Enrich domains, IP addresses, URLs and hashes found in alerts; support retrospective IOC hunts | Community data varies in context and relevance; a match is investigative evidence, not proof of compromise |
| [MalwareBazaar](https://bazaar.abuse.ch/api/) | Searchable malware-sample metadata and controlled sample access by hash | Enrich file alerts, compare samples and support malware-analysis or YARA work in an isolated environment | Samples are hazardous and should never be downloaded or opened on an analyst workstation |
| [MISP default and CIRCL OSINT feeds](https://www.circl.lu/doc/misp/managing-feeds/) | MISP-, CSV- and free-text feeds that can be cached, correlated or imported into MISP | Aggregate open sources and correlate external indicators with existing MISP events | MISP is the platform and exchange format; enabling more feeds does not automatically create better intelligence |

These sources provide strong technical coverage but little financial-institution-specific victim context on their own. Their safest role is enrichment, prioritisation and hypothesis generation.

## Commercial providers

Commercial services should be selected for a defined intelligence gap. Product names, packaging, access and licensing can change; the links below are the providers' current official descriptions, and pricing generally requires direct scoping.

| Provider | Distinct coverage | Best fit |
|---|---|---|
| [Visa Payment Threat Intelligence](https://corporate.visa.com/content/dam/VCOM/corporate/visa-perspectives/trends-and-insights/documents/visa-pfd-biannual-threats-report-fall-2024.pdf) | Alerts, analysis, technical indicators and mitigations for cybercrime, account compromise and fraud affecting the payment ecosystem; Visa describes its intelligence as using transaction data, source monitoring and technical analysis | Issuers, acquirers, merchants and payment-heavy fintechs that need card- and payment-specific intelligence connected to fraud operations |
| [Recorded Future Threat Intelligence](https://www.recordedfuture.com/products/threat-intelligence) | Actor, infrastructure, TTP, malware and vulnerability context with integrations for SOC and TIP workflows | Teams needing broad external intelligence, prioritised monitoring, enrichment and investigation across many regions and technologies |
| [Flashpoint](https://flashpoint.io/) | Collections and analysis from open and hard-to-reach adversary spaces, with use cases for stolen credentials, ransomware, fraud and insider threats | Fraud, account-takeover, brand-protection and CTI teams that require underground-market visibility |
| [Intel 471 / Verity471](https://www.intel471.com/platform/cyber-threat-intelligence) | Adversary and malware intelligence plus compromised-credential and vulnerability intelligence, with emphasis on criminal ecosystems | Teams investigating cybercrime, credential exposure, malware operations and threats being prepared in underground communities |
| [Google Threat Intelligence / Mandiant](https://cloud.google.com/security/products/threat-intelligence) | Mandiant frontline reporting, Google telemetry and VirusTotal community visibility for IOC enrichment, actor/campaign research, YARA hunting and incident response | Organisations needing broad technical pivoting and incident/campaign context, especially where Google Security Operations or VirusTotal workflows already exist |
| [CrowdStrike Falcon Adversary Intelligence](https://www.crowdstrike.com/en-us/platform/threat-intelligence/adversary-intelligence/) | Adversary profiles, contextual indicators, vulnerability intelligence, malware analysis and open/deep/dark-web monitoring, with Falcon and third-party integrations | SOC and threat-hunting teams that want intelligence connected closely to endpoint, identity and cloud investigations, particularly existing Falcon customers |

The table is not a ranking. A proof of concept should test the provider against the organisation's own priority intelligence requirements and representative cases. Useful measures include unique relevant findings, source transparency, false-positive burden, time saved during triage, integration quality, handling restrictions and whether the output changed a defensive or fraud decision.

## Intelligence requirement to source mapping

| Intelligence requirement | Start with | Add when the requirement justifies it |
|---|---|---|
| What are other financial institutions seeing? | FS-ISAC | Regional sharing groups and a broad commercial provider |
| What is affecting Swift-connected operations? | Swift ISAC | FS-ISAC and internal Swift/payment telemetry |
| Which vulnerabilities need urgent attention? | CISA KEV plus asset inventory | Commercial vulnerability/exploitation intelligence when earlier warning or deeper context is required |
| Which behaviours should detections cover? | MITRE ATT&CK plus public reporting | Google/Mandiant, CrowdStrike, Recorded Future or Intel 471, selected by environment and actor coverage |
| Is this URL, domain, IP or hash associated with malware? | URLhaus, ThreatFox, MalwareBazaar and CIRCL/MISP feeds | A commercial provider for additional context, history and integrations |
| Are credentials, payment data or fraud methods being traded? | Sector sharing and internal fraud telemetry | Flashpoint or Intel 471; Visa for payment-network-specific requirements |
| Which external threats are relevant to this organisation? | Sector sources, CISA KEV, ATT&CK and internally defined intelligence requirements | One broad commercial platform after a requirements-led evaluation |

## Layered combination recommendations

### Small fintech

Use a low-overhead baseline:

1. CISA KEV for exploitation-led patch priority.
2. MITRE ATT&CK to map priority threats to telemetry and detections.
3. URLhaus and ThreatFox for network-indicator enrichment; MalwareBazaar metadata only when file analysis is required.
4. MISP/CIRCL feeds only if the team can maintain the platform, tune sources and review matches; otherwise integrate the few relevant APIs directly into existing SIEM or case workflows.
5. Join FS-ISAC when the organisation can operationalise member reporting and meet membership requirements.

Buy a commercial service only after documenting a persistent gap—for example compromised-customer credentials, brand impersonation or actor research—and confirming that the team has an owner and response process for its alerts.

### Payment-heavy fintech or payment processor

Use the small-fintech baseline, then add:

1. Visa Payment Threat Intelligence where the business participates in the relevant Visa ecosystem and card/payment fraud is a priority.
2. Swift ISAC if the organisation operates Swift-connected infrastructure.
3. FS-ISAC for cross-institution incident and fraud context.
4. Flashpoint or Intel 471 when stolen credentials, account takeover, criminal-market activity or fraud preparation is a material gap.

Route relevant findings to both the SOC and fraud teams. Payment intelligence loses value when it remains isolated from transaction, customer, device and identity evidence.

### Mature bank

Use all three layers:

```text
FS-ISAC + Swift ISAC
        ↓
CISA KEV + ATT&CK + selected technical OSINT
        ↓
One broad commercial intelligence platform
        +
One specialist service for payment/fraud or underground coverage
        ↓
TIP/SIEM/SOAR enrichment, detection engineering, fraud controls,
vulnerability management, hunting and incident response
```

Choose the broad platform according to the bank's technology stack, priority actors, regions and analyst workflow; choose the specialist service according to a separate payment, credential or underground-intelligence requirement. Overlapping subscriptions should be justified by measured unique value, not feed volume.

## Selection principle

The best combination is not the one with the most indicators. It is the smallest collection that repeatedly produces relevant, timely and sufficiently contextual intelligence—and has a named team able to act on it.
