# Financial SOC Telemetry Catalogue

## The problem

A detection idea is only useful when the organisation collects the evidence needed to test it.

For example:

```text
Detection idea
Alert when MFA is reset and a new SaaS application is accessed

Missing evidence
Help-desk tickets are not logged centrally
MFA changes are retained for only seven days
SaaS audit logs are disabled

Result
The detection cannot work reliably
```

This catalogue connects the project's threat models to the minimum data a financial SOC should understand.

## 1. Identity and account-recovery telemetry

### What it includes

- password resets and account unlocks;
- MFA factor creation, removal and replacement;
- device registration;
- role and group changes;
- sign-in risk, location, device and application;
- token and session issuance;
- Conditional Access results;
- session revocation.

### Questions it answers

- Who changed the account?
- Was the action initiated through a help desk?
- Which new factor or device appeared?
- What did the account access afterwards?
- Was a token used without a normal login event?

### Threat models covered

Scattered Spider / UNC3944, Kali365 token phishing, valid-account abuse, DPRK developer compromise and BEC.

## 2. Help-desk and support telemetry

### What it includes

- ticket creator, operator and assignee;
- call time and recording where lawful;
- verification method;
- reset and override actions;
- customer or employee records viewed;
- case assignment and business purpose;
- supplier or BPO employer information.

### Questions it answers

- Did the operator follow the recovery policy?
- Was the caller independently verified?
- Did support access match a valid case?
- Did one worker access unrelated customer records?

### Threat models covered

Scattered Spider, Coinbase support-insider activity and customer impersonation fraud.

## 3. Email and collaboration telemetry

### What it includes

- complete message headers and gateway results;
- mailbox sign-ins and client applications;
- inbox, forwarding and transport rules;
- mailbox delegation;
- OAuth grants;
- MailItemsAccessed and search events;
- Teams, SharePoint and OneDrive audit records;
- internal messages sent after compromise.

### Questions it answers

- Was the visible sender spoofed or was a real mailbox compromised?
- Did the attacker read finance or supplier conversations?
- Were forwarding rules used to hide replies?
- Did a token access mail without a corresponding interactive sign-in?

### Threat models covered

BEC, Kali365, internal phishing, SaaS data theft and executive impersonation.

## 4. Endpoint and developer telemetry

### What it includes

- process creation and command line;
- PowerShell, Bash, Python, Node.js and script-host activity;
- package installation and repository cloning;
- Docker and container runtime events;
- file and credential access;
- archive creation;
- network and DNS activity;
- persistence and security-control changes.

### Questions it answers

- Which user executed the suspicious code?
- Did a package installer spawn a shell or download tool?
- Were cloud keys, SSH keys or browser sessions accessed?
- Did the endpoint connect to transaction infrastructure afterwards?

### Threat models covered

UNC1069, UNC4899, DMM Bitcoin, malicious attachments, ClickFix and APT41.

## 5. Source-control and CI/CD telemetry

### What it includes

- repository logins and personal-access tokens;
- maintainer and permission changes;
- pull requests, branch protection and code review;
- package and dependency changes;
- pipeline jobs and runners;
- build provenance and artifact hashes;
- secret access;
- package publishing;
- deployment approvals.

### Questions it answers

- Who changed the dependency?
- Was the package release produced by an approved pipeline?
- Did a maintainer account change before a malicious release?
- Which applications received the affected artifact?

### Threat models covered

Axios supply-chain compromise, APT41 supply-chain activity and developer-to-transaction compromise.

## 6. Cloud and SaaS telemetry

### What it includes

- control-plane API calls;
- object and file access;
- application grants and service principals;
- access-key and token use;
- storage sharing and sync jobs;
- virtual-machine and serverless changes;
- cloud-network and bastion access;
- data-loss-prevention alerts.

### Questions it answers

- Did a newly recovered identity assign itself access?
- Was data moved cloud-to-cloud?
- Did a stolen key access transaction-critical systems?
- Was an unusual SaaS integration used for exfiltration?

### Threat models covered

Scattered Spider, UNC4899, APT41 DUST, Kali365 and cloud data exfiltration.

## 7. Internet-facing application telemetry

### What it includes

- asset inventory and public exposure;
- product version and vulnerability status;
- WAF and reverse-proxy requests;
- application and database audit logs;
- file-integrity events;
- application-user changes;
- server process and outbound connections;
- data export volume.

### Questions it answers

- Which request preceded the new server-side file?
- Did the web process launch a shell?
- Was a privileged application user created?
- What data was accessed before the patch was applied?

### Threat models covered

MOVEit, Oracle EBS, APT41 and other public-application exploitation.

## 8. Payment, fraud and transaction telemetry

### What it includes

- beneficiary and supplier-master changes;
- payment request and approval chain;
- transaction amount, currency, country and destination;
- wallet and blockchain addresses;
- device and session used for approval;
- recall, reversal and freeze actions;
- fraud and mule-account indicators;
- AML and sanctions alerts.

### Questions it answers

- Was a new beneficiary created shortly before payment?
- Did the payment follow a suspicious email or identity event?
- Was a legitimate transaction workflow manipulated?
- Where did the funds move after the initial transfer?

### Threat models covered

BEC, DPRK financial theft, Cobalt, Silence and customer fraud.

## 9. Virtualisation, identity infrastructure and recovery telemetry

### What it includes

- vCenter, ESXi and hypervisor audit logs;
- identity-server and federation changes;
- backup administration and deletion;
- virtual-media mounts;
- VM shutdown, export and snapshot actions;
- recovery testing;
- security-agent and log-forwarding changes.

### Questions it answers

- Did a newly changed administrator access the hypervisor?
- Were backups or snapshots deleted?
- Was an ISO mounted to reset local credentials?
- Can the organisation still trust its recovery path?

### Threat models covered

Scattered Spider, ransomware and destructive or extortion activity.

## 10. Network, DNS and availability telemetry

### What it includes

- flow, bandwidth, packets and requests per second;
- firewall, CDN, WAF and scrubbing-provider logs;
- DNS queries and response health;
- load-balancer and connection-table utilisation;
- application latency and error rates;
- successful and failed customer transactions;
- upstream-provider alerts.

### Questions it answers

- Is traffic malicious or legitimate demand?
- Which dependency failed first?
- Did the attack affect customer payments or authentication?
- Was DDoS used alongside fraud or intrusion activity?

### Threat models covered

DDoS, malicious redirects, command and control and exfiltration.

## 11. Supplier and third-party evidence

### What it includes

- service and data-owner inventory;
- supplier contacts and contract terms;
- subcontractors and fourth parties;
- access paths and service accounts;
- security and incident notifications;
- audit reports and test results;
- data locations and retention;
- exit and continuity plans.

### Questions it answers

- Which business service depends on the supplier?
- What data or privileges does the supplier hold?
- Can the supplier provide logs quickly?
- Which other customers may be affected?
- Can the service be replaced or isolated?

### Threat models covered

MOVEit, Oracle EBS, DMM Bitcoin, Coinbase support access and DORA concentration risk.

## Cross-cutting requirements

### Time synchronisation

Events from identity, cloud, email, payment and endpoint systems must use reliable timestamps and time zones. A timeline becomes unreliable when systems differ by minutes or record local time without context.

### Retention

Retention should match the time required to discover and investigate the threat. Extortion messages or supplier notifications may arrive weeks or months after initial access.

### Data quality

A log source should have:

- a known owner;
- documented fields;
- health monitoring;
- an expected event volume;
- reliable user, device and asset identifiers;
- a process for schema changes.

### Privacy and proportionality

Support, employee and customer monitoring may involve personal data. Collection and access must follow applicable law, policy, purpose limitation and authorised investigation procedures.

## Minimum viable financial SOC data set

A smaller organisation should prioritise:

```text
1. Identity and MFA changes
2. Email and Microsoft 365 or SaaS audit
3. Endpoint process and network telemetry
4. Internet-facing application and WAF logs
5. Payment and beneficiary changes
6. Help-desk reset records
7. Critical cloud control-plane logs
8. Supplier and incident-notification records
```

Adding a feed before collecting these internal data sources may increase threat information without improving detection.

## Supporting dataset

The machine-readable version is stored in [`data/telemetry-requirements.csv`](../data/telemetry-requirements.csv).
