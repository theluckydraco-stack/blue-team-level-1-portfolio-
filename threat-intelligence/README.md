# Threat Intelligence

This section documents practical cyber-threat-intelligence work completed during my Blue Team Level 1 studies and extended with current financial-sector reporting, modern intelligence standards and detection-engineering methods.

The work focuses on turning public reporting and technical evidence into intelligence that supports SOC monitoring, threat hunting, detection engineering, fraud response, incident response and leadership decisions.

## Projects

### MISP Threat Intelligence Platform Lab

I completed a hands-on MISP investigation covering ransomware, Turla, DDoS botnets and exploitation of Mitel MiVoice infrastructure.

The lab demonstrates:

- MISP event, attribute, tag and Galaxy investigation;
- MITRE ATT&CK mapping and actor pivots;
- IOC extraction and external-source enrichment;
- YARA interpretation;
- C2, persistence and vulnerability analysis;
- threat-intelligence triage and signal-to-noise assessment;
- translation of CTI findings into SOC hunts, detection opportunities and remediation actions.

A key observation was that the largest MISP event was not always the most useful starting point: a smaller, more focused event often provided the relevant intelligence faster. The report therefore emphasizes relevance, context, confidence and timeliness rather than raw indicator volume.

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
