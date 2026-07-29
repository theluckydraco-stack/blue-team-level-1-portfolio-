# Detection Specification: Developer Compromise Leading to Transaction Manipulation

## Detection objective

Identify a sequence in which an attacker uses a fake recruitment or development task to compromise a developer, steals cloud or session credentials and then reaches infrastructure capable of influencing a financial transaction.

## Threat basis

The 2024 DMM Bitcoin case and Google Threat Intelligence reporting on DPRK-aligned UNC4899 show why developers and wallet-software providers are high-value targets. The attacker may target the person who writes or manages the transaction system rather than the exchange or bank holding the final funds.

## Financial assets at risk

- wallet and signing infrastructure;
- transaction-approval services;
- CI/CD pipelines;
- cloud control planes;
- secrets and key-management systems;
- developer bastions and administrative workstations;
- supplier-operated transaction components.

## Required telemetry

- recruitment and security reports involving unsolicited development tasks;
- repository clone, package and dependency activity;
- EDR process, command-line and interpreter events;
- Python, Node.js, container and shell execution;
- container-image pulls and runtime activity;
- secret, credential-file and browser-session access;
- cloud sign-ins, API calls and session-token events;
- CI/CD changes, deployments and code-signing actions;
- transaction requests, approvals and destination changes.

## Correlation logic

Alert on a high-risk sequence such as:

```text
New external development task or repository
        ↓
Interpreter or container execution from an unusual project
        ↓
Credential, cookie or cloud-secret access
        ↓
New cloud session or privileged API activity
        ↓
Transaction-workflow or wallet configuration change
```

Increase severity when:

- the code came from an unsolicited recruiter or newly created account;
- a developer runs a package or container that is rare in the organisation;
- cloud access occurs without the normal device or authentication sequence;
- a session cookie is reused from another device or network;
- wallet destinations, signing policies or approval logic change;
- the same identity touches both development and production transaction systems;
- normal separation of duties is bypassed.

## Expected legitimate activity

- proof-of-concept and recruitment exercises;
- new development projects;
- container-based testing;
- emergency production support;
- planned cloud or wallet changes;
- approved CI/CD deployment.

These activities should be linked to tickets, repositories, peer review and change approval.

## Investigation steps

1. Preserve the project, repository, container image and communication used to deliver the task.
2. Calculate SHA-256 hashes for relevant files without executing them again.
3. Review interpreter, package-installation and network activity.
4. Identify accessed credentials, browser data, cloud keys or session tokens.
5. Review cloud and bastion access after the suspected execution.
6. Compare code, deployment and wallet changes with approved change records.
7. Trace affected transactions and destination addresses or accounts.
8. Review supplier and developer identities with similar exposure.

## Containment

- isolate the developer device;
- revoke cloud sessions, keys and developer tokens;
- rotate secrets and signing material according to key-management procedures;
- stop or require reapproval for affected transactions;
- suspend unauthorised deployments;
- preserve CI/CD, cloud and transaction evidence;
- notify fraud, wallet operations, legal, sanctions and law enforcement where applicable.

## ATT&CK mapping

- `T1656` — Impersonation
- `T1204.002` — User Execution: Malicious File
- `T1059` — Command and Scripting Interpreter
- `T1539` — Steal Web Session Cookie
- `T1552.001` — Unsecured Credentials: Credentials In Files
- `T1078` — Valid Accounts

The final transaction manipulation may require organisation-specific fraud and application mapping beyond ATT&CK.

## Validation plan

Use an isolated test developer environment. Clone a benign test repository, execute a harmless script or container, access a dummy secret, sign in to a test cloud account and submit a non-production transaction change. Confirm the SIEM can connect the steps.

## Review conditions

Review when:

- development tooling or cloud providers change;
- transaction architecture changes;
- new recruitment-themed campaigns are reported;
- session-binding or device-trust controls improve;
- a real incident reveals an unmonitored developer or supplier path.
