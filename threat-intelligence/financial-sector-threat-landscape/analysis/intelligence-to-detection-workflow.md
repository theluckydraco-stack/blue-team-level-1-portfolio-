# From Threat Intelligence to Detection

## The problem

A threat report can be accurate and still be operationally useless.

A SOC does not improve because an analyst copied twenty IP addresses into a document. The intelligence has value only when it changes a search, detection, control, investigation or business decision.

```text
Threat report
        ↓
Relevant behaviour identified
        ↓
Required evidence confirmed
        ↓
Detection designed and tested
        ↓
Alert investigated
        ↓
Feedback improves the intelligence
```

This is the practical connection between the BTL1 threat-intelligence lifecycle and modern detection engineering.

## 1. Define the intelligence requirement

Start with a decision, not a feed.

Example:

> Can a caller persuade our support team to reset MFA for a privileged finance user and then use that identity to steal data from SaaS applications?

This question defines:

- the relevant actor behaviour;
- the accounts and systems in scope;
- the logs required;
- the action expected from the SOC.

## 2. Collect and assess sources

I collect information from sources such as MITRE ATT&CK, government advisories, vendor incident reports, financial-sector reports and internal incidents.

For every important claim, I record:

- what was directly observed;
- what the publisher assessed;
- how reliable and current the source is;
- whether another source agrees;
- how relevant the activity is to the organisation.

## 3. Separate observables from behaviours

An observable may be:

- an IP address;
- a domain;
- a file hash;
- an email address;
- a user-agent string.

A behaviour may be:

- an MFA reset followed by a new factor registration;
- a web server spawning a command shell;
- a developer executing code from a fake recruitment task;
- a SaaS account downloading an unusual volume of records.

Observables often expire quickly. Behaviour usually produces more durable detection value.

## 4. Map the behaviour to the financial environment

The same ATT&CK technique has different importance depending on the asset.

For example, `Valid Accounts` is broad. In a financial organisation, the important questions are:

- Is the account able to approve payments?
- Can it access customer or KYC data?
- Is it an administrator for cloud identity?
- Can it change wallet or transaction infrastructure?
- Does it support a third-party provider?

The detection must include asset and business context.

## 5. Confirm the telemetry

Before writing a detection, I verify that the required evidence exists and is retained long enough.

Possible data sources include:

- help-desk and identity-recovery records;
- Entra ID, Okta or other identity-provider logs;
- Microsoft 365 and SaaS audit logs;
- cloud control-plane and storage logs;
- EDR and process-creation events;
- WAF, reverse-proxy and application logs;
- payment, beneficiary and approval events;
- fraud, AML and blockchain intelligence;
- vendor notifications and supplier records.

A detection that depends on a log the organisation does not collect is only a proposal.

## 6. Write a detection specification

A useful specification contains:

```text
Detection objective
Threat behaviour
Financial assets affected
Required data
Correlation logic
Expected false positives
Severity and confidence
Investigation steps
Containment action
Validation method
Owner and review date
```

The detection should explain why the activity matters, not only provide a query.

## 7. Validate through controlled testing

The team should reproduce the behaviour safely.

Example validation:

1. A test help-desk ticket resets a laboratory account.
2. A new MFA factor is registered.
3. The account accesses a previously unused SaaS application.
4. A test set of files is downloaded.
5. The SIEM should correlate the sequence and create one understandable alert.

The test should confirm:

- the logs arrived;
- timestamps can be correlated;
- the detection fired;
- the alert contains enough context;
- the response process works.

## 8. Investigate the alert as a chain

One event rarely proves an intrusion.

A reset may be legitimate. A new device may be legitimate. A download may be legitimate.

The confidence increases when the events form a suspicious sequence:

```text
Unusual identity-recovery request
        +
New MFA factor
        +
New privileged application access
        +
Bulk data download
        =
High-priority identity compromise investigation
```

## 9. Feed results back into intelligence

The investigation should update:

- the actor or campaign profile;
- known normal behaviour;
- the detection logic;
- false-positive exclusions;
- required telemetry;
- defensive recommendations;
- confidence in the original assessment.

This completes the intelligence lifecycle rather than ending it at dissemination.

## Worked example: Scattered Spider / UNC3944

### Intelligence finding

Public reporting described actors persuading help desks to reset passwords and MFA methods, then using the identity to reach SSO-connected cloud and SaaS systems.

### Detection translation

```text
Help-desk reset event
        ↓ within a short period
New MFA factor or device
        ↓
New privileged application assignment
        ↓
Unusual SaaS search or bulk download
```

### Financial relevance

The compromised identity may reach customer records, payment operations, fraud systems, cloud administration or privileged-access tooling.

### Response

- contact the account owner through an established channel;
- suspend the session and newly registered factor;
- review all SaaS and cloud access after the reset;
- inspect the help-desk interaction;
- preserve voice, ticket and identity logs;
- determine whether sensitive data was accessed or transferred.

## Modern operational tools and standards

### MITRE ATT&CK

ATT&CK provides a common language for adversary behaviour and helps identify relevant telemetry and control gaps. It does not prove attribution.

### MISP

MISP can store, correlate and share indicators, reports, relationships and analyst judgements. It is more useful when context and confidence are preserved rather than when it is treated as a hash database.

### STIX and TAXII

STIX 2.1 is a structured model for representing cyber-threat information. TAXII 2.1 is a protocol designed to exchange CTI, including STIX content, between systems.

### Sigma

Sigma provides a generic rule format that can be converted into queries for different SIEM platforms. A Sigma rule still requires correct field mapping, tuning and validation in the target environment.

### ATT&CK Navigator

ATT&CK Navigator can visualise selected techniques and compare coverage. A coloured matrix is not evidence that a detection works; every claimed coverage area needs telemetry and testing.

## Modern correction to the IOC-feed model

The older model was:

```text
Receive IOC feed
↓
Block everything
```

The stronger model is:

```text
Receive intelligence
↓
Validate source, age and relevance
↓
Separate observables from behaviours
↓
Search historical data
↓
Create or improve detections
↓
Take proportionate action
↓
Review effectiveness and expire stale indicators
```

## Sources

- MITRE ATT&CK — Data and tools: https://attack.mitre.org/resources/attack-data-and-tools/
- MISP — Features: https://www.misp-project.org/features/
- OASIS — STIX 2.1: https://docs.oasis-open.org/cti/stix/v2.1/stix-v2.1.html
- OASIS — TAXII 2.1: https://docs.oasis-open.org/cti/taxii/v2.1/os/taxii-v2.1-os.html
- Sigma — Official specification: https://sigmahq.io/sigma-specification/
