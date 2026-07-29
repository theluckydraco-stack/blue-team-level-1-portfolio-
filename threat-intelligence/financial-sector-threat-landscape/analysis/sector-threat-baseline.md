# European Financial-Sector Threat Baseline

## Purpose

The actor profiles in this project are case studies. They do not represent every threat affecting banks, payment firms, fintech companies, insurers, investment firms or cryptocurrency services.

I use this sector baseline to check that the project remains relevant to the financial ecosystem as a whole.

## What the sector evidence shows

ENISA analysed 488 publicly reported incidents affecting European finance between January 2023 and June 2024. Banks were the most frequently affected type of organisation, but the report also covered payment institutions, electronic-money firms, investment firms, insurers, crypto-asset services, digital providers and financial-sector infrastructure.

The major threat categories included:

- distributed denial-of-service attacks;
- data breaches and leaks;
- phishing, smishing, vishing and other social engineering;
- fraud;
- ransomware;
- banking malware and spyware;
- supply-chain and service-provider compromise.

This means the sector cannot be defended by tracking a small list of named actors. The SOC must also prepare for opportunistic crime, fraud campaigns, hacktivist disruption, third-party incidents and attacks whose operator is never confidently identified.

## Plain-language threat model

| Threat | What it means | Why it matters to finance |
|---|---|---|
| Direct financial theft | The attacker manipulates a transaction, wallet, payment process, account balance or cash-out system | The loss can occur before traditional ransomware or data-theft alerts appear |
| Identity compromise | The attacker steals or resets an employee, contractor or administrator identity | One trusted identity may unlock email, cloud, SaaS, payment and support systems |
| Data theft and extortion | Sensitive information is copied and payment is demanded to prevent publication | Backups restore availability but cannot restore confidentiality |
| Public-facing exploitation | An internet-accessible application, VPN, edge device or enterprise platform is exploited | Financial services expose portals and depend on products that attackers can scan at scale |
| Supplier compromise | A vendor or processor holding financial data is breached | The financial organisation may suffer customer, legal and regulatory impact without its own network being directly compromised |
| Fraud and social engineering | Customers or staff are manipulated into approving access, revealing information or transferring funds | The malicious action may look like a legitimate business request |
| Ransomware and recovery denial | Systems are encrypted or the attacker damages identity, virtualisation and backup services | The incident can stop critical financial operations and prevent normal recovery |
| Availability attack | Online services are overwhelmed or disrupted, often through DDoS | Even limited technical impact can interrupt customer access and create public pressure |
| Espionage | Information is stolen for strategic, political or economic purposes rather than immediate payment | A financial institution may hold data about governments, companies, transactions and influential individuals |

## Current operational shifts

Mandiant's 2026 incident-response findings show several changes that strengthen the choices made in this project:

1. Exploitation of vulnerabilities remained the most common observed initial-access method in its 2025 investigations.
2. Voice phishing became the second most common observed entry method, making help-desk and identity-recovery controls more important.
3. Attackers increasingly targeted SaaS integrations, OAuth tokens, session cookies, identity systems, virtualisation platforms, backups and edge devices.
4. Some criminal access hand-offs occurred within seconds, reducing the time available to treat an apparently minor infection as low priority.
5. Financial organisations remained among the most frequently targeted industries in the investigation set.

These figures come from Mandiant investigations and should not be interpreted as a complete global incident census. They are useful because they show how real intrusions are moving beyond the traditional monitored workstation.

## European resilience context

The EU Digital Operational Resilience Act, or DORA, requires covered financial entities to manage ICT risk, report significant incidents, test resilience and manage third-party ICT risk. A financial entity remains responsible for its obligations even when it uses an external technology provider.

For this project, DORA supports four practical conclusions:

- third-party services must be inventoried and linked to the business functions they support;
- security leadership must understand concentration risk, where many important services depend on one provider or platform;
- contracts must support incident notification, cooperation, evidence access and recovery;
- threat intelligence must lead to tested operational resilience rather than only additional blocklists.

This project is not legal advice. DORA is used as operational context for European financial-sector defensive priorities.

## Relevance test for actor selection

I retain an actor or attack model when it meets several of the following conditions:

- documented financial-sector or financial-process targeting;
- meaningful activity during 2023–2026;
- relevance to banks, payments, fintech, cryptocurrency or financial providers;
- evidence from a government, MITRE ATT&CK, a vendor incident investigation or another authoritative source;
- a distinct attack path that changes what a financial SOC should monitor;
- strategic or business implications beyond one malware family.

This is why current DPRK financial theft, Scattered Spider identity abuse and CL0P-branded mass exploitation rank above historical Cobalt Group and Silence activity, while APT41 remains a useful comparison rather than the main financial threat.

## Sources

1. ENISA — Threat Landscape: Finance Sector: https://www.enisa.europa.eu/publications/enisa-threat-landscape-finance-sector
2. Google Cloud / Mandiant — M-Trends 2026 Executive Edition: https://cloud.google.com/security/resources/m-trends-executive-edition
3. EUR-Lex — Regulation (EU) 2022/2554, Digital Operational Resilience Act: https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32022R2554
