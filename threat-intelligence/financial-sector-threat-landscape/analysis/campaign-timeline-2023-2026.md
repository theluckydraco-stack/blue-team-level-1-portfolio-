# Financial Threat Timeline — 2023 to 2026

## Purpose

This timeline helps readers understand why the project prioritises identity, cloud, third parties, virtual assets, fraud and operational resilience rather than focusing only on traditional malware campaigns.

It includes selected public events that changed the project's assessment. It is not a complete list of every financial-sector incident.

## 2023

### MOVEit Transfer mass exploitation

Attackers exploited an internet-facing managed file-transfer product, deployed the specialised LEMURLOOT web shell and stole data from many organisations.

**Why it matters:** one product weakness created downstream exposure across customers and suppliers. Data theft and extortion created material impact without requiring ransomware encryption.

### Financial-services targeting by Scattered Spider / UNC3944

Mandiant later reported sector-focused targeting of financial services during late 2023.

**Why it matters:** the actor showed that help-desk social engineering, identity recovery and valid SaaS access could bypass controls without exploiting a public application.

## 2024

### DMM Bitcoin theft

The FBI and Japanese partners attributed the theft of approximately USD 308 million in bitcoin to North Korean TraderTraitor activity. The public chain began with fake recruiter contact against an employee of wallet-software provider Ginco.

**Why it matters:** the attacker targeted a trusted developer and supplier path rather than only the exchange holding the funds.

### DDoS pressure on financial services

FS-ISAC and Akamai later assessed financial services as the leading target of volumetric DDoS during 2024.

**Why it matters:** customer-facing availability and provider capacity became strategic financial-security concerns, not only network-operations issues.

### AI-assisted fraud warning

The FBI warned that criminals were using generative AI to produce more believable text, audio, images and videos for financial fraud.

**Why it matters:** grammar and visual quality are weaker indicators. Identity and transaction verification must carry more of the defensive burden.

## 2025

### Bybit virtual-asset theft

The FBI attributed the theft of approximately USD 1.5 billion in virtual assets to North Korean TraderTraitor activity and reported rapid conversion and dispersal across thousands of blockchain addresses.

**Why it matters:** the incident connected cyber intrusion with fraud, blockchain intelligence, sanctions and international laundering response.

### Coinbase support-insider incident

Coinbase reported that criminals bribed and recruited overseas support agents, stole customer data and used it to facilitate social engineering. Coinbase also reported a USD 20 million extortion demand.

**Why it matters:** customer-support and outsourced business processes are part of the financial attack surface. Legitimate access can support external fraud.

### Oracle E-Business Suite extortion campaign

Google Threat Intelligence and Mandiant reported widespread exploitation and extortion involving Oracle EBS environments and an actor claiming CL0P affiliation.

**Why it matters:** ERP systems concentrate finance, payroll, procurement and supplier data. Extortion messages may be the first visible sign of months-old compromise.

### DORA becomes operational

The EU Digital Operational Resilience Act applied from 17 January 2025. In November 2025, the European Supervisory Authorities designated the first critical ICT third-party providers under the oversight framework.

**Why it matters:** third-party dependencies, concentration risk, incident evidence and resilience testing became active financial-supervisory concerns.

### Caller-ID spoofing and financial fraud

Europol published a position paper highlighting the cross-border impact of caller-ID spoofing and the role of calls and messages in financial scams.

**Why it matters:** a familiar number displayed on a phone is not proof of caller identity.

## 2026

### UNC1069 targets cryptocurrency with AI-supported social engineering

Mandiant reported an intrusion against a cryptocurrency-sector fintech entity involving a compromised Telegram account, fake Zoom meeting, ClickFix instruction and reported AI-generated video.

**Why it matters:** modern phishing may arrive through a trusted messaging account and meeting rather than a suspicious attachment. The user can be persuaded to execute the command themselves.

### Axios open-source supply-chain compromise

Google Threat Intelligence reported that the axios maintainer account was compromised and malicious releases introduced the `plain-crypto-js` dependency to deploy WAVESHAPER.V2 across Windows, macOS and Linux.

**Why it matters:** one maintainer account and one popular package can expose developer systems, build pipelines and downstream financial applications at scale.

### Kali365 Microsoft 365 token phishing

The FBI warned that Kali365 PhaaS uses device codes to obtain Microsoft 365 access and refresh tokens without collecting the victim's password.

**Why it matters:** a legitimate Microsoft verification page can be part of the phishing chain. Password reset alone may not remove token-based access.

### Exploitation before patch availability

Mandiant reported a mean time-to-exploit of negative seven days in its M-Trends 2026 data. GTIG also reported an AI-assisted zero-day exploit assessment.

**Why it matters:** financial organisations need inventory, segmentation, application logging and retrospective hunting before and after patch deployment.

### ATT&CK v19

MITRE split the former Enterprise Defense Evasion tactic into Stealth and Defense Impairment.

**Why it matters:** course material and older reports may use an outdated ATT&CK structure. Current mapping should use the active version and still preserve the version used by historical sources.

### MISP Workbench beta

The MISP Project released an analyst-focused workbench for combining intelligence from several sources.

**Why it matters:** modern CTI is moving beyond passive feed ingestion toward investigation, comparison and analyst judgement.

### Malicious traffic distribution systems

The FBI warned that criminals were using traffic distribution systems to selectively redirect victims to fraudulent websites, financial phishing pages and malware.

**Why it matters:** one analyst or sandbox may receive a harmless page while the original victim receives a malicious destination. URL analysis must preserve the full chain and victim context.

## What changed across the period

```text
2023
Mass exploitation of shared enterprise software
        ↓
2024
Trusted developers, identity and availability become central
        ↓
2025
Large virtual-asset theft, insider-enabled fraud and ERP extortion
        ↓
2026
Token phishing, AI-supported lures, open-source supply-chain compromise
and faster exploitation
```

## Overall assessment

The period shows a shift from defending individual endpoints toward defending **trust relationships and business services**:

- trusted identities and tokens;
- support and recovery processes;
- developers, package maintainers and suppliers;
- cloud and SaaS sessions;
- payment and transaction workflows;
- enterprise applications;
- customer-facing availability.

This is why the project was started as a financial-sector threat landscape rather than a single-actor biography.

## Sources

Sources for each event are recorded in the project's source logs and linked from the corresponding actor, campaign or analysis file.
