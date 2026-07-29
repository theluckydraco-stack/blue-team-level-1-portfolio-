# Modern Parallels, Updates and Deprecated Concepts

## Purpose

BTL1 provides a strong foundation, but several terms, tools and practices have evolved. This file records what remains useful, what has changed and what I would use in a current financial-sector environment.

## BTL1 concept to modern practice

| BTL1 or older practice | Current professional parallel | Practical correction |
|---|---|---|
| IOC list | Observable, indicator, TTP and relationship model | Not every artifact is malicious; preserve context, confidence, source and expiry |
| Threat exposure check | Retrospective hunt, enterprise search or IOC sweep | Search identity, endpoint, cloud, SaaS, email and transaction data, not only hosts |
| MD5 as the main file identifier | SHA-256 as the primary hash | Keep MD5 only for legacy lookup compatibility |
| WHOIS lookup | RDAP lookup for gTLD registration data | RDAP became the definitive gTLD registration source on 28 January 2025 |
| TLP:WHITE | TLP:CLEAR | TLP 2.0 has been authoritative since August 2022 |
| CVSS-only prioritisation | CVSS + EPSS + CISA KEV + asset context | Severity alone does not establish organisational risk |
| Exact subject, filename or IP blocks | Behavioural and multi-signal detections | Use exact blocks for immediate containment, not as the only long-term defence |
| Public file upload by default | Hash search, policy review and approved private analysis | Do not expose confidential files or customer data to public services |
| ATT&CK as a checklist | Risk-based behaviour coverage and validated detections | A coloured technique does not prove that logging and alerting work |
| Static IOC feed | Structured intelligence lifecycle | Validate, enrich, operationalise, expire and review indicators |

## MITRE ATT&CK update

ATT&CK is a living knowledge base and should be referenced by version.

ATT&CK v19 became current in April 2026. A major Enterprise change split the former `Defense Evasion` tactic into:

- **Stealth** — behaviours intended to conceal or blend activity;
- **Defense Impairment** — behaviours that directly weaken or disable security controls.

This matters when older course material or reports use a tactic structure that no longer matches the current Enterprise matrix.

ATT&CK should be used to:

- describe behaviour consistently;
- identify telemetry requirements;
- compare actor procedures;
- plan hunts and control tests.

It should not be used to prove attribution from technique overlap.

## TLP update

The valid TLP 2.0 labels are:

```text
TLP:RED
TLP:AMBER
TLP:GREEN
TLP:CLEAR
```

`TLP:WHITE` is deprecated.

TLP controls who may receive information. It does not by itself specify which technical actions may be performed with that intelligence.

## RDAP replacing WHOIS

For generic top-level domains, RDAP is now the definitive registration-data access method.

RDAP improves on legacy WHOIS through:

- structured responses;
- authoritative service discovery;
- internationalisation support;
- secure and differentiated access.

The absence of public registrant details is not proof of maliciousness. Privacy and redaction are common.

## Vulnerability prioritisation update

### CVSS

CVSS describes technical severity. It does not establish whether the organisation uses the product, whether the asset is exposed or whether exploitation is occurring.

### EPSS

EPSS estimates the probability that exploitation activity will be observed for a published CVE during the next 30 days. EPSS v4 began publishing in March 2025.

EPSS does not include the organisation's business impact, asset criticality or compensating controls.

### CISA Known Exploited Vulnerabilities

When credible evidence shows active exploitation, that evidence should normally carry more weight than a predictive score.

### Financial-sector decision model

```text
Technical severity
        +
Active or predicted exploitation
        +
Internet or supplier exposure
        +
Asset and business criticality
        +
Available controls and recovery options
        =
Remediation priority
```

## Threat-intelligence platform update

MISP remains relevant, but modern use should go beyond storing hashes and domains.

Useful objects include:

- reports and campaigns;
- threat actors and source-specific aliases;
- ATT&CK behaviours;
- relationships among infrastructure, malware and victims;
- confidence and analyst opinions;
- TLP and sharing restrictions;
- indicator lifecycle and expiry.

MISP Workbench, released in beta in 2026, represents a newer analyst-focused approach to combining and reviewing intelligence from several sources.

## Structured sharing

STIX 2.1 and TAXII 2.1 remain the current OASIS standards commonly used for machine-readable CTI representation and exchange.

The important distinction is:

```text
STIX = how threat information is represented
TAXII = how threat information is exchanged
```

## Detection engineering update

Sigma is a generic detection-rule format that can be converted into platform-specific SIEM queries.

A Sigma rule is not automatically production-ready. It still needs:

- field mapping;
- available and reliable logs;
- environment-specific tuning;
- false-positive analysis;
- controlled validation;
- ownership and review dates.

Modern Sigma also includes correlation-rule capabilities, which are particularly relevant to multi-stage identity and payment detections.

## Financial-sector regulatory parallel

The EU Digital Operational Resilience Act has applied since 17 January 2025.

DORA makes several project findings operationally important:

- financial entities remain responsible for ICT risk when services are outsourced;
- third-party dependencies and concentration risk must be understood;
- ICT incidents require structured management and reporting;
- resilience testing must cover important business services;
- supplier contracts, audit rights and exit strategies matter.

In November 2025, the European Supervisory Authorities published the first list of critical ICT third-party providers under the DORA oversight framework. This turns cloud and supplier concentration from a theoretical concern into an active supervisory process.

## Modern incident parallel: support-insider fraud

Traditional insider-threat examples often describe an employee copying a file.

The 2025 Coinbase case demonstrates a more current chain:

```text
External criminals
        ↓
Bribed support personnel
        ↓
Customer data obtained through legitimate access
        ↓
Customers targeted with informed social engineering
        ↓
Fraud and extortion
```

This requires cooperation among SOC, fraud, insider-risk, HR, legal, procurement and customer-support teams.

## Modern incident parallel: DDoS as resilience risk

DDoS is not only a website-availability problem. In finance it can interrupt customer authentication, payment APIs, trading and trust in the organisation.

Modern monitoring should correlate traffic with the health and transaction success of the business service.

## Sources

- MITRE ATT&CK v19 updates: https://attack.mitre.org/resources/updates/
- FIRST TLP 2.0: https://www.first.org/tlp/
- ICANN RDAP transition: https://www.icann.org/en/announcements/details/icann-update-launching-rdap-sunsetting-whois-27-01-2025-en
- FIRST EPSS: https://www.first.org/epss/
- MISP features: https://www.misp-project.org/features/
- MISP Workbench beta: https://www.misp-project.org/2026/03/13/misp-workbench_beta_1.0_released.html/
- Sigma specification: https://sigmahq.io/sigma-specification/
- DORA: https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX%3A32022R2554
- EBA — Critical ICT third-party providers under DORA: https://www.eba.europa.eu/publications-and-media/press-releases/european-supervisory-authorities-designate-critical-ict-third-party-providers-under-digital
