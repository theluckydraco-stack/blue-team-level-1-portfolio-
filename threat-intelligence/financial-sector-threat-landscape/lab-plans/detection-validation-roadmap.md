# Detection Validation Roadmap

## Purpose

The current project proves research, analysis and detection design. The next stage should prove that selected detections work against controlled laboratory data.

I will not attempt to reproduce every real attack. I will simulate the smallest safe sequence that generates the required evidence.

## Lab principle

```text
One threat behaviour
        ↓
One controlled test
        ↓
Logs collected
        ↓
Detection fires
        ↓
Alert investigated
        ↓
Evidence documented
```

A successful lab is not measured by how many tools are installed. It is measured by whether I can show the complete path from intelligence to an understandable alert.

## Recommended order

### Phase 1 — Windows and SIEM foundation

Build or reuse:

- one Windows Server domain controller;
- one Windows client;
- Sysmon or equivalent endpoint telemetry;
- a SIEM such as Wazuh, Splunk or Microsoft Sentinel;
- central Windows event collection where possible.

Validate:

- user authentication;
- account and group changes;
- process creation;
- PowerShell activity;
- network connections;
- log forwarding.

### Phase 2 — Identity recovery simulation

Simulate:

```text
Test account password reset
        ↓
New MFA-like or device-registration event where available
        ↓
New application or role access
        ↓
Test data download
```

A local AD lab can validate the password and privilege parts. A cloud identity trial or synthetic log set may be required for real MFA and SaaS events.

### Phase 3 — Public application and web-shell indicators

Use an isolated local web server. Do not expose an intentionally vulnerable system to the internet.

Simulate:

- approved request to the test application;
- creation of a harmless server-side test file;
- a controlled web-process child process where the platform supports it;
- a test outbound connection or file read.

The goal is to validate logging and correlation, not exploit a real vulnerability.

### Phase 4 — BEC and payment-workflow correlation

Create synthetic or laboratory records for:

- an email from a test lookalike domain;
- a supplier bank-detail change;
- a new beneficiary;
- a test payment event;
- an independent verification result.

The detection should combine the email and payment context.

### Phase 5 — Support-insider data-access simulation

Create a small test customer dataset and support tickets.

Simulate:

- normal access to one assigned customer;
- supervisor access with approval;
- unusual burst access to unrelated customers;
- an export or copy event if the platform supports it.

The detection should identify purpose-to-access mismatch.

### Phase 6 — Cloud and SaaS exfiltration simulation

Use non-sensitive test files and an approved laboratory cloud account.

Simulate:

- a broad search or export;
- archive creation;
- upload to a new test destination;
- a new sharing link or sync job.

Confirm that identity, endpoint and cloud audit records can be correlated.

### Phase 7 — Virtualisation and recovery test

Use the existing VirtualBox environment or a dedicated lab hypervisor.

Simulate:

- a test administrative login;
- a role or local administrator change;
- mounting benign virtual media;
- stopping a test VM;
- changing a non-production backup setting.

The goal is to prove visibility into high-impact control-plane actions.

### Phase 8 — DDoS tabletop or safe load test

Do not direct attack traffic at public or third-party systems.

Use:

- an approved local application;
- a controlled load-testing tool;
- strict traffic and time limits;
- application-health monitoring.

Validate that traffic changes are correlated with service latency, errors and recovery actions.

## Evidence to capture for GitHub

For each completed validation:

1. A short diagram of the test sequence.
2. A screenshot of the source log.
3. A screenshot of the SIEM query or rule.
4. The generated alert.
5. The investigation timeline.
6. False-positive and tuning notes.
7. The final detection status.

Do not upload:

- real credentials;
- customer data;
- live malware;
- public cloud secrets;
- BTL1 assessment material;
- unredacted internal IPs or tokens.

## Validation record template

```markdown
# Detection Validation

## Objective

## Lab Environment

## Simulated Behaviour

## Data Sources

## Detection Logic

## Expected Result

## Actual Result

## Investigation

## False Positives and Tuning

## Limitations

## Final Status
- Not working
- Partially working
- Validated in lab
- Production validation required
```

## Practical first target

The best first validation is **Windows account and privilege change correlation** because it can be completed using the existing Windows Server and Windows 11 lab before adding cloud identity.

A later project phase can extend it into Microsoft Entra ID or another cloud identity service once the local log pipeline is stable.
