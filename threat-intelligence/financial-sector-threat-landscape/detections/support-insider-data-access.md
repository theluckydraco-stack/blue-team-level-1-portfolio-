# Detection Specification: Suspicious Support-Agent Customer-Data Access

## Detection objective

Identify support personnel or contractors using legitimate access to collect customer information outside an approved business purpose.

## Threat basis

The 2025 Coinbase disclosure showed how external criminals could bribe or recruit support personnel, use legitimate support access to obtain customer information and then perform better-informed social engineering and extortion.

## Financial assets at risk

- customer identity and contact records;
- KYC and verification information;
- account-support history;
- transaction metadata;
- high-value or executive customer records;
- fraud and dispute information.

## Required telemetry

- support-agent authentication and device records;
- ticket ownership and customer-case assignment;
- customer-record views, searches and exports;
- clipboard, print, screenshot and file-transfer controls where permitted;
- DLP, endpoint and remote-access telemetry;
- contractor employer, role and work schedule;
- customer fraud and impersonation reports;
- privileged-role changes and exception approvals.

## Correlation logic

Alert when a support user performs customer-data access that does not match the expected case, role or peer pattern.

Examples:

```text
No active case
        +
Repeated customer lookups
        +
Unrelated accounts or geographies
        =
Suspicious support access
```

Increase severity when:

- records belong to high-value customers or employees;
- access occurs outside the worker's normal shift or country;
- the user performs many searches but few legitimate case actions;
- data is copied, printed, exported or photographed;
- several accessed customers later report impersonation or fraud;
- the agent is a contractor with recently changed access or supervision.

## Expected legitimate activity

- fraud investigations involving several linked customers;
- quality assurance and supervisor reviews;
- regulatory or legal requests;
- incident-response searches;
- customer migration or remediation campaigns.

These activities should have a documented case, approval or campaign identifier.

## Investigation steps

1. Confirm the employee or contractor's role, employer, manager and assigned cases.
2. Compare the records viewed with actual customer interactions.
3. Review authentication, device, remote-access and physical-access data.
4. Identify exports, screenshots, clipboard use or external communication.
5. Correlate the accessed customers with later fraud or social-engineering reports.
6. Review other agents, accounts or devices associated with the same pattern.
7. Involve insider-risk, HR, legal and procurement according to policy.

## Containment

- suspend or restrict support access;
- preserve endpoint, application and identity evidence;
- remove bulk-search or export permissions;
- notify affected customer-protection and fraud teams;
- review the third-party provider's access and supervision;
- determine whether customer warnings or protective controls are required.

## ATT&CK mapping

Depending on the evidence, relevant mappings may include:

- `T1078` — Valid Accounts
- `T1213` — Data from Information Repositories
- `T1530` — Data from Cloud Storage
- `T1656` — Impersonation, for the later customer-facing fraud stage

The employee's legitimate access means ATT&CK mapping alone will not distinguish insider abuse from authorised work.

## Validation plan

Create approved test cases for normal single-customer support work, supervisor review and a simulated unauthorised burst of unrelated customer lookups. Confirm that the detection alerts on the mismatch while excluding documented campaigns.

## Review conditions

Review when:

- support work moves to a new supplier;
- the ticketing or customer-data platform changes;
- privacy or labour-law requirements affect monitoring;
- new customer-fraud reports reveal missing telemetry;
- role baselines or business campaigns create false positives.
