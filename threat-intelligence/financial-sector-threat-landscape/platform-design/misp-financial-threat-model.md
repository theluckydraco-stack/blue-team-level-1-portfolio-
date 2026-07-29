# MISP Design for the Financial Threat Landscape

## Purpose

This design shows how the project's research could be stored and shared in a threat-intelligence platform instead of remaining only as Markdown files.

MISP is an open-source threat-intelligence and sharing platform. It can store reports, indicators, ATT&CK techniques, relationships, analyst opinions and sharing restrictions.

The goal is not to upload every item found online. The goal is to preserve enough context for another analyst to decide whether and how to use it.

## The problem with a flat IOC list

A spreadsheet containing a domain or hash may not explain:

- which campaign it came from;
- whether it is confirmed or only suspected;
- when it was active;
- which actor label the source used;
- which financial assets are relevant;
- whether the indicator is safe to block;
- when it should expire.

A MISP event can hold the indicator and its relationships.

## Proposed event structure

Create one MISP event for each significant campaign or intelligence package.

Examples:

```text
DMM Bitcoin theft — 2024
Bybit virtual-asset theft — 2025
UNC3944 help-desk to SaaS attack path
MOVEit mass data-theft campaign — 2023
Coinbase support-insider extortion case — 2025
Financial-sector DDoS operational-resilience assessment
```

## Core event fields

| Field | Example |
|---|---|
| Event title | `Financial Sector - UNC3944 Help-Desk to SaaS Attack Path` |
| Date | Date of the observed campaign or publication |
| Threat level | Based on operational impact and confidence, not actor reputation alone |
| Analysis state | Initial, ongoing or complete |
| Distribution | Selected according to source and organisational policy |
| TLP | `TLP:CLEAR`, `TLP:GREEN`, `TLP:AMBER` or `TLP:RED` |
| Source | Publisher and report URL |
| Confidence | High, moderate or low with explanation |
| Sector | Finance, banking, payments, cryptocurrency or financial technology |
| Geography | Global, Europe or source-specific region |

## Recommended MISP objects

### Threat-report object

Use for:

- report title;
- publisher;
- publication date;
- source URL;
- summary;
- confidence;
- report type.

### Organisation and person objects

Use only when reliable public sources name an organisation or individual. Preserve legal language such as `alleged`, `charged` or `assessed`.

Do not add personal data merely because it is publicly discoverable.

### Vulnerability object

Use for CVEs exploited in campaigns such as MOVEit or Oracle EBS.

Include:

- CVE ID;
- affected product;
- exploitation status;
- patch or mitigation information;
- CISA KEV status where applicable;
- CVSS and EPSS as separate context fields.

### File and malware objects

Use SHA-256 as the primary hash. MD5 may be added for legacy lookup compatibility.

Do not upload malware samples to the portfolio or a public MISP instance.

### Domain, URL and IP objects

Keep the raw value in the secured platform when operational use requires it. Defang values only in human-readable reports.

Record:

- first and last observed dates;
- source;
- confidence;
- role, such as phishing, command and control, exfiltration or hosting;
- expiry or review date.

### Identity and account objects

For identity-led campaigns, record behaviours and account types rather than exposing real victim accounts.

Examples:

- privileged cloud administrator;
- help-desk operator;
- developer account;
- supplier support account;
- attacker-controlled MFA factor.

### Financial-transaction context

MISP is not a fraud platform, but campaign context can record:

- transaction system targeted;
- payment, wallet or SWIFT relevance;
- laundering method described by the source;
- connection to fraud, AML or sanctions response.

Sensitive transaction details should remain in approved case systems.

## ATT&CK and behaviour mapping

Attach only the techniques that explain the campaign or support a detection decision.

Example for an identity-led intrusion:

```text
T1656 — Impersonation
T1078 — Valid Accounts
T1098 — Account Manipulation
T1556.006 — Modify Authentication Process: MFA
T1530 — Data from Cloud Storage
T1567.002 — Exfiltration to Cloud Storage
```

A technique relationship should point to the observed procedure, not merely state that the actor has used the technique somewhere in history.

## Tags

Suggested tags include:

```text
sector:finance
sector:cryptocurrency
region:europe
workflow:reviewed
confidence:high
confidence:moderate
tlp:clear
tlp:green
tlp:amber
source-type:government
source-type:primary-research
project:financial-threat-landscape
```

Use the official MISP taxonomy format where available rather than inventing a duplicate tag.

## TLP and PAP

### TLP

TLP controls the permitted sharing audience.

Use TLP 2.0 labels. `TLP:WHITE` is deprecated and replaced by `TLP:CLEAR`.

### PAP

The Permissible Actions Protocol can describe which actions recipients may take with intelligence. This is separate from who may receive it.

```text
TLP = Who may receive the information?
PAP = What actions may recipients take?
```

## Indicator lifecycle

Every indicator should have a review process.

```text
Received
↓
Validated and enriched
↓
Used for hunt or control
↓
Monitored for continued activity
↓
Expired, revoked or retained with justification
```

Do not keep a domain permanently blocked solely because it appeared in an old report. Ownership and use may change.

## Correlation use cases

MISP correlation could reveal:

- the same domain or certificate across several campaigns;
- repeated targeting of a supplier or technology;
- a file hash already observed in phishing analysis;
- techniques shared across several financially relevant actors;
- indicators appearing in internal SIEM or EDR telemetry;
- relationships between a vulnerability, web shell and data-theft campaign.

Correlation is a lead, not proof of attribution.

## Example event: Coinbase support-insider case

The event should focus on the attack model rather than inventing unavailable IOCs.

```text
Event: Coinbase support-insider and customer-social-engineering case — 2025
Observed fact: Coinbase reported bribed overseas support agents and misuse of support access
Behaviour: Legitimate account abuse, customer-data collection, informed impersonation and extortion
Financial relevance: Customer fraud, supplier/BPO risk, insider risk and customer trust
Confidence: High for the company disclosure; moderate for the full criminal structure
Defensive actions: Support-access monitoring, purpose binding, DLP, customer verification and cross-team response
```

## Automation and integration

A mature workflow may connect MISP with:

- SIEM and EDR for retrospective searches;
- email security for domain and attachment enrichment;
- SOAR for controlled response actions;
- case management for analyst decisions;
- vulnerability management for CVE and exploitation context;
- fraud and blockchain intelligence through approved integrations.

Automated blocking should require confidence, relevance, expiry and collateral-impact checks.

## Modern update

MISP Workbench entered beta in 2026 as an analyst-focused workspace for combining intelligence from several sources. This reflects a broader shift from feed ingestion toward investigation, comparison and collaborative analysis.

## Manual implementation point

A future MISP lab can implement one safe event using only public, non-sensitive data from this project. No live malicious file or victim information is required.

## Sources

- MISP features: https://www.misp-project.org/features/
- MISP taxonomies: https://www.misp-project.org/taxonomies.html
- MISP Workbench beta: https://www.misp-project.org/2026/03/13/misp-workbench_beta_1.0_released.html/
- FIRST TLP 2.0: https://www.first.org/tlp/
