# Blue Team Level 1 (BTL1) Portfolio

This repository documents practical projects and laboratory exercises completed while studying for the Blue Team Level 1 certification.

The portfolio demonstrates hands-on experience across:

- Phishing analysis
- Threat intelligence
- Digital forensics
- Security information and event management (SIEM)
- Incident response

Each project documents the objective, tools used, investigation process, findings, defensive considerations, and skills demonstrated.

## Portfolio Sections

| Domain | Projects | Status |
|---|---|---|
| [Phishing Analysis](phishing-analysis/README.md) | [Manual Artifact Extraction](phishing-analysis/manual-artifact-extraction/README.md), [Investigating an Attachment](phishing-analysis/investigating-an-attachment/README.md), [Phishing Response Challenge](phishing-analysis/phishing-response-challenge/README.md) | **Completed** |
| [Threat Intelligence](threat-intelligence/README.md) | [Financial-Sector Threat Intelligence Sources](threat-intelligence/financial-sector-threat-intelligence-sources/README.md), [MISP Threat Intelligence Platform Lab](threat-intelligence/misp-threat-intelligence-platform-lab/README.md), [Digital Financial Services Threat Landscape](threat-intelligence/financial-sector-threat-landscape/README.md) | **Source research and MISP lab completed; financial detection validation next** |
| [Digital Forensics](digital-forensics/README.md) | [Forensic Evidence Acquisition and Recovery](digital-forensics/forensic-evidence-acquisition-and-recovery/README.md), [Memory-Based Incident Triage with Volatility](digital-forensics/memory-based-incident-triage/README.md) | **Two operational projects published; Windows artifact reconstruction in progress** |
| SIEM | Projects to be added | In progress |
| Incident Response | Projects to be added | In progress |

## Current Portfolio Work

### Memory-Based Incident Triage with Volatility

I completed a memory-forensics workflow using both the legacy Volatility 2 approach and Volatility 3 through Workbench.

The project focuses on the operational progression from system and process identification to parent-child analysis, command-line context, network pivots, process privileges, artifact extraction, and hashing. It deliberately separates observed evidence from conclusions: an unusual process relationship, network endpoint, or token privilege is treated as a lead that requires corroboration rather than automatic proof of malware.

[View the Memory-Based Incident Triage project](digital-forensics/memory-based-incident-triage/README.md)

### Forensic Evidence Acquisition and Recovery

I combined multiple Digital Forensics exercises into one evidence-handling workflow focused on a practical question: **how can an examiner acquire, verify, classify, and examine digital evidence, then recover deleted content while preserving the limits of each method?**

The project covers whole-memory acquisition, process-specific memory capture, E01 disk imaging and verification, targeted KAPE collection, filesystem identification, metadata extraction, file carving, and cryptographic hashing. It also documents what the retained evidence does not prove, including gaps in source hashing, chain of custody, and independent verification.

[View the Digital Forensics project](digital-forensics/forensic-evidence-acquisition-and-recovery/README.md)

### MISP Threat Intelligence Platform Lab

I completed a hands-on MISP investigation designed around a practical defensive question: **if a security concern or suspected incident arises, how can I use MISP to find the relevant intelligence and turn it into action?**

The project follows an incident-to-intelligence-to-defence workflow: search for the most relevant MISP event, filter and pivot through attributes, tags, Galaxies and ATT&CK context, validate the intelligence with external reporting, then translate the result into a SOC hunt, detection requirement, vulnerability-remediation action or compromise assessment.

The lab covers ransomware, Turla activity, DDoS botnets and exploitation of Mitel MiVoice infrastructure. A key operational lesson was that more attributes did not automatically mean more useful intelligence: focused events with strong context could answer an intelligence requirement faster than much larger datasets.

[View the MISP lab](threat-intelligence/misp-threat-intelligence-platform-lab/README.md)

### Digital Financial Services Threat Landscape

I completed a cyber-threat-intelligence assessment of threats affecting banks, payment processors, fintech platforms, cryptocurrency services and their technology providers.

The project compares current and historical activity, maps attacker behaviour to MITRE ATT&CK, connects technical evidence to strategic context and produces practical detection specifications for a financial SOC.

It covers:

- direct financial and virtual-asset theft;
- identity recovery, help-desk, OAuth token and SaaS compromise;
- business email compromise and payment diversion;
- AI-assisted voice, video and identity impersonation;
- customer-support insider risk;
- third-party, ERP and managed-file-transfer exploitation;
- developer and open-source package compromise;
- malicious redirect infrastructure and financial brand impersonation;
- data-theft extortion;
- DDoS and operational resilience;
- cloud, virtualisation and recovery-system risk;
- a financial SOC telemetry catalogue;
- twelve vendor-neutral detection specifications;
- an experimental Sigma rule and safe Windows identity-correlation lab;
- DORA, MISP, STIX/TAXII, Sigma and other current professional practices.

The repository clearly separates completed intelligence and detection design from laboratory validation that has not yet been performed.

[View the Threat Intelligence project](threat-intelligence/financial-sector-threat-landscape/README.md)

## Disclaimer

The exercises documented in this repository were completed in controlled training environments or with publicly accessible threat-intelligence sources. URLs are defanged where appropriate. Live malicious files, credentials, assessment material, and sensitive information are not included.
