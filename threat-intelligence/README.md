# Threat Intelligence

This section documents practical cyber-threat-intelligence work completed during my Blue Team Level 1 studies and extended with current financial-sector reporting, modern intelligence standards and detection-engineering methods.

The work focuses on turning public reporting and technical evidence into intelligence that supports SOC monitoring, threat hunting, detection engineering, fraud response, incident response and leadership decisions.

## Projects

### Financial-Sector Threat Intelligence Sources

This concise research note compares sector-sharing communities, public technical sources and commercial providers by the operational intelligence requirement each one supports. It covers peer financial-sector reporting, exploited vulnerabilities, adversary behaviour, technical indicators, payment fraud, compromised credentials and underground activity, then recommends layered combinations for a small fintech, a payment-heavy fintech or processor, and a mature bank.

The central selection principle is to use the smallest source collection that repeatedly changes a defensive or fraud decision, rather than measuring value by feed volume.

[View Financial-Sector Threat Intelligence Sources](financial-sector-threat-intelligence-sources/README.md)

### MISP Threat Intelligence Platform Lab

This project demonstrates how I would use MISP when a security question or suspected incident needs threat-intelligence context.

Rather than documenting the lab as a list of answers, I structured the investigation around an operational workflow:

```text
Security question / suspected incident
              -> search MISP
              -> identify relevant intelligence
              -> filter, pivot, correlate and enrich
              -> extract IOCs and behaviours
              -> validate context
              -> translate findings into defensive action
```

The exercises covered ransomware, Turla activity, DDoS botnets and exploitation of Mitel MiVoice infrastructure. They show how MISP intelligence can become:

- DNS, proxy, firewall, EDR or SIEM hunts for reported infrastructure;
- behaviour-based hunting and detection requirements from ATT&CK mappings;
- YARA-based malware detection opportunities;
- botnet compromise indicators across network, host and persistence telemetry;
- vulnerability remediation plus compromise assessment for an exploited edge system;
- better analyst triage by prioritising relevance over raw attribute volume.

A key finding from the MiVoice investigation was that the MISP event with fewer attributes surfaced the information required for the immediate question faster than the larger event. The project therefore treats intelligence value as a function of **relevance, context, confidence and timeliness**, not data volume.

The central lesson is: **threat intelligence is useful when it changes a defensive decision** — hunt, detect, patch, investigate, contain, monitor or report.

[View the MISP Threat Intelligence Platform Lab](misp-threat-intelligence-platform-lab/README.md)

### Digital Financial Services Threat Landscape

I completed a relevance-based assessment of current and historical threats affecting banks, payment processors, fintech platforms, cryptocurrency services and their technology providers.

The project includes:

- current actor and attack-model profiles;
- historical Eastern European banking comparisons;
- financial-sector campaign and incident case studies through 2026;
- source, confidence and alternative-hypothesis tracking;
- a transparent actor-relevance scoring method;
- MITRE ATT&CK behaviour mapping;
- a European sector threat baseline;
- BEC, insider-risk, AI impersonation and DDoS analysis;
- Microsoft 365 token-phishing and malicious-redirect analysis;
- developer, open-source package and transaction-workflow risk;
- a financial SOC telemetry catalogue;
- twelve vendor-neutral detection specifications;
- an experimental Sigma correlation rule and safe Windows lab plan;
- DORA operational alignment;
- a MISP platform design;
- modern updates covering STIX/TAXII, Sigma, RDAP, TLP 2.0, EPSS and ATT&CK v19;
- a final executive assessment.

The report explains technical concepts in plain language and connects attacker behaviour to identity, tokens, cloud, SaaS, suppliers, open-source packages, transaction systems, virtualisation, fraud and operational resilience.

The research and detection design are complete. Laboratory validation is clearly marked as the next stage rather than being claimed as finished work.

[View the Digital Financial Services Threat Landscape](financial-sector-threat-landscape/README.md)
