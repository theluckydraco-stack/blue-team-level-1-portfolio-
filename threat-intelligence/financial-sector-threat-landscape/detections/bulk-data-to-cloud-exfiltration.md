# Detection Specification: Bulk Data Collection Followed by Cloud Exfiltration

## Detection objective

Identify an attacker collecting large volumes of financial or customer data and transferring it through a legitimate cloud or SaaS service.

## Threat basis

APT41 DUST reporting described data theft through legitimate cloud services. Scattered Spider / UNC3944 reporting described cloud-to-cloud data movement using authorised SaaS capabilities. CL0P-related campaigns demonstrate that data theft alone can create extortion pressure without file encryption.

## Financial assets at risk

- customer and KYC records;
- payroll and employee information;
- supplier and procurement records;
- legal, audit and regulatory data;
- source code and technical documentation;
- payment or transaction information;
- executive and strategic documents.

## Required telemetry

- endpoint file access and archive creation;
- database queries and exports;
- SaaS searches, reads, downloads and API calls;
- proxy, CASB and DLP events;
- cloud-storage uploads and sharing changes;
- application-to-cloud synchronisation jobs;
- identity, device and privileged-role context;
- business owner and data-classification information.

## Correlation logic

Alert when unusual data collection is followed by transfer to a new, personal or rare cloud destination.

```text
Broad search or database export
        ↓
Large archive or staged collection
        ↓
New sync job, API client or cloud destination
        ↓
High-volume upload or external sharing
```

Increase severity when:

- the identity recently underwent a password, MFA or role change;
- the data is classified or belongs to many customers;
- the destination has not been approved by the organisation;
- the transfer occurs outside normal hours or from an unusual device;
- the same account disables alerts, deletes logs or changes retention;
- an extortion message or leak-site claim follows.

## Expected legitimate activity

- backup and disaster-recovery jobs;
- approved data migrations;
- regulatory submissions;
- legal discovery;
- analytics and data-science exports;
- mergers, audits or incident-response collection.

These should have documented owners, destinations and change records.

## Investigation steps

1. Identify the data set, owner, classification and affected customers or entities.
2. Review who initiated the search, export, archive or sync job.
3. Confirm whether the destination is corporate, personal or attacker-controlled.
4. Inspect recent identity, role, factor and session changes.
5. Review application and cloud audit events for data sharing or token creation.
6. Determine whether the activity occurred entirely cloud-to-cloud.
7. Search for extortion contact, supplier notification or public exposure.

## Containment

- revoke suspicious sessions, tokens and application grants;
- stop or disable unauthorised sync jobs;
- restrict the destination and rotate exposed credentials;
- preserve SaaS, cloud and endpoint evidence;
- notify privacy, legal, fraud and affected data owners;
- assess customer, contractual and regulatory impact.

## ATT&CK mapping

- `T1213` — Data from Information Repositories
- `T1005` — Data from Local System
- `T1530` — Data from Cloud Storage
- `T1560` — Archive Collected Data
- `T1567.002` — Exfiltration to Cloud Storage

## Validation plan

Use approved test data. Generate a controlled export, create a test archive and upload it to an approved laboratory cloud destination. Confirm that the detection includes identity, data classification and destination context.

## Review conditions

Review when:

- new SaaS or storage services are introduced;
- backup or migration workflows change;
- DLP classification changes;
- new threat reporting describes a different cloud-to-cloud method;
- legitimate bulk activity causes repeated false positives.
