# Cross-Actor Detection Priorities for a Financial SOC

## The problem

A SOC cannot build a separate monitoring programme for every threat-actor name. Actor names change, public definitions overlap and attackers reuse many of the same access paths.

I therefore compared the profiles and asked a more durable question:

> Which behaviours would expose several important financial-sector attack models at once?

The priorities below are ordered by current relevance, cross-actor coverage and potential financial impact.

## Priority 1 — Protect identity recovery as a critical security control

### What the attacker does

The attacker impersonates an employee, persuades a help desk to reset a password or MFA method, enrols a new device, or abuses an already valid session.

### Why it matters

A successful reset may provide access to every application connected through single sign-on, including email, cloud platforms, customer data, privileged-access systems and support tools.

### Evidence to collect

- help-desk tickets, call recordings and operator identity;
- password resets and account-unlock events;
- MFA factor registration, removal and device enrolment;
- new SSO application assignments and privileged-role changes;
- sign-ins from new devices, networks or locations;
- session-cookie and token-risk events.

### Detection idea

Alert when a privileged or high-value account receives a password or MFA reset and then accesses a new SaaS application, changes roles, downloads large amounts of data or signs in from an unfamiliar device.

### Profiles covered

Scattered Spider / UNC3944, DPRK developer and IT-worker activity, and any actor using stolen valid accounts.

---

## Priority 2 — Monitor internet-facing applications and edge devices

### What the attacker does

The attacker exploits a vulnerable VPN, file-transfer platform, ERP application, web server, firewall or other system reachable from the internet.

### Why it matters

Exploitation can provide access before phishing controls or endpoint agents have any opportunity to detect the attacker. Some appliances cannot run normal EDR software.

### Evidence to collect

- complete internet-facing asset inventory;
- product version and vulnerability status;
- WAF, reverse-proxy and application logs;
- administrative and configuration changes on edge devices;
- web-server child processes and file creation;
- outbound connections from public-facing systems;
- vendor advisories and CISA Known Exploited Vulnerabilities status.

### Detection idea

Correlate exploit-like requests with a web-server process launching a shell, a new server-side script, a privileged login, unusual data access or an outbound connection.

### Profiles covered

CL0P-branded MOVEit and Oracle EBS exploitation, APT41 public-facing exploitation and other opportunistic or state-linked campaigns.

---

## Priority 3 — Detect cloud, SaaS and token abuse

### What the attacker does

The attacker uses legitimate cloud accounts, OAuth tokens, API keys, service accounts, browser sessions or SaaS integrations to access data and move between services.

### Why it matters

Cloud-to-cloud activity may never cross the traditional corporate network, and a stolen token may continue to work without another password or MFA prompt.

### Evidence to collect

- identity-provider and conditional-access logs;
- OAuth application consent and permission changes;
- service-account and API-key creation or use;
- SaaS audit and bulk-download events;
- cloud storage, synchronisation and integration logs;
- session reuse from new devices or networks;
- application-to-application access that does not match normal business workflows.

### Detection idea

Alert on a newly approved application or token followed by bulk access to SharePoint, Salesforce, Workday, cloud storage or another sensitive service.

### Profiles covered

Scattered Spider / UNC3944, DPRK cloud cryptocurrency activity, APT41 cloud-based exfiltration and modern third-party SaaS compromise.

---

## Priority 4 — Monitor third-party and concentration risk

### What the attacker does

The attacker compromises a supplier, managed service, transfer platform or enterprise application that stores data or provides access for many customers.

### Why it matters

The financial institution may be affected even when its own network was not directly breached. One widely used provider can create simultaneous exposure across the sector.

### Evidence to collect

- register of ICT suppliers and the critical functions they support;
- data types and customers represented in each provider;
- supplier security alerts and incident notifications;
- administrative and integration activity from vendor accounts;
- third-party tokens, certificates and service credentials;
- evidence-retention and notification obligations in contracts.

### Detection idea

Treat a supplier incident as an internal threat-hunt trigger. Search for the supplier's accounts, integrations, tokens, software and transferred data across the environment rather than waiting for proof of internal compromise.

### Profiles covered

CL0P-branded mass exploitation, DPRK targeting of wallet and software providers, APT41 supply-chain activity and any SaaS integration breach.

---

## Priority 5 — Protect developer, transaction and approval workflows

### What the attacker does

The attacker targets developers, wallet administrators, software repositories or employees who can influence payment and transaction approval.

### Why it matters

The most valuable target may be the trusted person or system that authorises a transaction, not the final database holding the funds.

### Evidence to collect

- repository access, code changes and new dependencies;
- CI/CD secrets, package downloads and signing activity;
- developer container and script execution;
- wallet and payment approval logs;
- changes to beneficiary, destination or transaction data;
- separation-of-duty and dual-approval records;
- session and device information for transaction operators.

### Detection idea

Correlate unusual developer execution or stolen session activity with a later change to a transaction request, signing process, wallet destination or payment approval.

### Profiles covered

DPRK TraderTraitor and UNC4899 activity, APT41 supply-chain compromise, and historical Cobalt or Silence attacks against financial processes.

---

## Priority 6 — Detect data collection, exfiltration and extortion early

### What the attacker does

The attacker searches for valuable records, creates archives, performs bulk exports, synchronises data to another cloud service or steals application-held files before making an extortion demand.

### Why it matters

Encryption is no longer required to create ransomware-level pressure. Restoring systems does not reverse a confidentiality breach.

### Evidence to collect

- database and application queries;
- file and object access;
- archive creation and staging directories;
- DLP, proxy and CASB events;
- large or unusual downloads and uploads;
- new SaaS synchronisation jobs;
- executive extortion emails and data-leak claims.

### Detection idea

Alert when a recently changed or newly privileged identity performs broad searches, creates large archives and uploads data to a rare cloud destination.

### Profiles covered

CL0P-branded activity, Scattered Spider / UNC3944, APT41 and most modern extortion operations.

---

## Priority 7 — Treat virtualisation, identity and backup systems as recovery infrastructure

### What the attacker does

The attacker compromises hypervisors, identity systems or backups to control many systems at once and prevent recovery.

### Why it matters

These platforms sit below normal workstations and servers. If they are controlled by the attacker, the organisation may lose production systems and the tools required to restore them.

### Evidence to collect

- vCenter, ESXi and hypervisor administration logs;
- virtual-machine creation, cloning, snapshot and datastore events;
- backup deletion, policy and retention changes;
- privileged identity and certificate changes;
- emergency-account use;
- out-of-band management access.

### Detection idea

Alert on hypervisor or backup administration from a newly reset account, a normal user workstation, an unusual network segment or outside an approved change window.

### Profiles covered

Scattered Spider / UNC3944 and modern ransomware or recovery-denial operations identified in current incident-response reporting.

---

## Priority 8 — Link cyber telemetry to fraud and financial operations

### What the attacker does

The attacker uses technical access to perform a financial action: change a payment, issue a transfer, manipulate an account balance, trigger ATM cash dispensing or move stolen virtual assets.

### Why it matters

A SOC may detect the account compromise while fraud or payment teams see the monetary consequence. Neither team has the full attack path alone.

### Evidence to collect

- SWIFT, payment, ATM, card-processing and wallet events;
- account and beneficiary changes;
- transaction approval and exception records;
- blockchain and virtual-asset movement data;
- mule, fraud, AML and sanctions alerts;
- identity and endpoint events for the operator involved.

### Detection idea

Correlate an unusual login, MFA reset or workstation compromise with a new beneficiary, abnormal payment instruction, wallet transfer or ATM-management action.

### Profiles covered

DPRK financial theft, Cobalt Group, Silence and other fraud-focused intrusions.

---

## Priority 9 — Maintain availability monitoring and DDoS readiness

### What the attacker does

The attacker overwhelms public services to interrupt customer access, create publicity or respond to geopolitical events.

### Why it matters

ENISA found DDoS to be a prominent threat to European finance, particularly against banks and around geopolitical developments. The technical impact may be temporary, but customer, reputational and operational consequences can still be significant.

### Evidence to collect

- traffic volume, protocol and source distribution;
- application and upstream-provider health;
- mitigation-provider actions;
- customer-service impact;
- public claims and geopolitical timing.

### Detection idea

Baseline normal customer traffic and trigger coordinated network, application and business alerts when availability falls while traffic or request patterns increase abnormally.

### Profiles covered

This is a sector-wide threat rather than a behaviour unique to the selected actor profiles.

---

## Priority 10 — Preserve evidence from systems outside normal EDR coverage

### What the attacker does

The attacker operates through edge devices, SaaS, identity systems, hypervisors or application platforms where endpoint telemetry is missing or short-lived.

### Why it matters

A financial organisation may be unable to confirm what data was accessed if the required logs were never collected or were retained for only a short period.

### Evidence to collect

- centralised logs from IdP, SaaS, cloud, hypervisors, edge devices, applications and suppliers;
- administrative events retained long enough for delayed discovery;
- alerts when logging stops or configuration changes;
- immutable or protected copies of critical audit data;
- time synchronisation across all evidence sources.

### Detection idea

Alert when a critical platform stops forwarding logs, its audit settings change, or the event volume drops unexpectedly.

### Profiles covered

All profiles. This is a visibility requirement rather than an actor-specific detection.

## Implementation order

A financial SOC should not attempt every rule at once. I would begin with this sequence:

```text
Identity recovery and privileged changes
        ↓
Internet-facing and edge visibility
        ↓
Cloud, SaaS and token monitoring
        ↓
Data access and exfiltration
        ↓
Transaction and fraud correlation
        ↓
Third-party, virtualisation and recovery coverage
```

The exact order should be adjusted according to the institution's technology, critical services and existing visibility.

## How success should be measured

Useful measures include:

- percentage of privileged resets independently verified;
- time from active-exploitation notice to patch, isolation or compensating control;
- percentage of SaaS applications and integrations inventoried;
- percentage of critical suppliers mapped to data and business functions;
- coverage of IdP, SaaS, edge, hypervisor, backup and payment logs in the SIEM;
- time to detect unusual bulk data access;
- time to correlate a cyber event with a fraud or transaction event;
- percentage of high-priority detections tested through controlled emulation.

## Sources

1. ENISA — Threat Landscape: Finance Sector: https://www.enisa.europa.eu/publications/enisa-threat-landscape-finance-sector
2. Google Cloud / Mandiant — M-Trends 2026 Executive Edition: https://cloud.google.com/security/resources/m-trends-executive-edition
3. MITRE ATT&CK: https://attack.mitre.org/
4. EUR-Lex — Regulation (EU) 2022/2554, Digital Operational Resilience Act: https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32022R2554
5. Individual actor and campaign sources are listed in their respective profiles.
