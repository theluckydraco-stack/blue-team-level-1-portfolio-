# Detection Specification: Developer or Supply-Chain Compromise Leading to Transaction Manipulation

## Detection objective

Identify a sequence in which an attacker compromises a developer, package maintainer, repository or CI/CD workflow, steals credentials or manipulates software, and then reaches infrastructure capable of influencing a financial transaction.

## Threat basis

The 2024 DMM Bitcoin case, DPRK-aligned cloud intrusions and the 2026 Axios compromise show why developers, package ecosystems and build systems are high-value financial targets.

The attacker may target the person or software that builds the transaction system rather than the bank, exchange or wallet holding the final funds.

```text
Trusted developer, maintainer, package or workflow
        ↓
Malicious code or credential access
        ↓
Cloud, build or production access
        ↓
Transaction logic or approval path influenced
```

## Financial assets at risk

- wallet and signing infrastructure;
- transaction-approval services;
- payment APIs and financial applications;
- CI/CD pipelines and build artefacts;
- cloud control planes;
- source-code repositories and package registries;
- secrets and key-management systems;
- developer bastions and administrative workstations;
- supplier-operated transaction components.

## Required telemetry

### Developer endpoints

- recruitment and security reports involving unsolicited development tasks;
- repository clone, package and dependency activity;
- EDR process, command-line and interpreter events;
- Python, Node.js, container and shell execution;
- secret, credential-file and browser-session access;
- DNS and network connections following package installation.

### Repository and package identity

- maintainer and repository logins;
- MFA, password and recovery changes;
- personal-access-token and SSH-key creation or use;
- package ownership and publication events;
- GitHub App, service-account and OIDC trust changes;
- repository role and branch-protection changes.

### Source and workflow changes

- dependency manifest and lockfile differences;
- new package names and unusually recent versions;
- package source, registry and maintainer history;
- workflow-file and build-configuration changes;
- privileged triggers such as `pull_request_target`;
- peer-review, ticket and change-approval records.

### CI/CD and artefacts

- runner identity and pipeline execution;
- package lifecycle or install scripts;
- repository-secret and environment-variable access;
- network egress from build runners;
- container-image and package publication;
- build provenance, signatures and artefact hashes;
- deployment and code-signing actions.

### Cloud and financial systems

- cloud sign-ins, API calls and session-token events;
- access to wallet, signing and transaction services;
- transaction requests, approvals and destination changes;
- code or configuration changes outside approved deployment paths.

## Correlation logic

Alert on a high-risk sequence such as:

```text
Developer, maintainer or workflow identity change
        ↓
New dependency, package publication or privileged workflow execution
        ↓
Shell, installer or container activity
        ↓
Credential, repository-secret or cloud-key access
        ↓
New cloud session or privileged API activity
        ↓
Transaction-workflow, wallet or production change
```

Increase severity when:

- the code came from an unsolicited recruiter, compromised contact or newly created repository;
- a package version was published recently and entered production without a cooling period;
- a maintainer account published shortly after password, MFA or recovery changes;
- `pull_request_target` or another privileged trigger executed untrusted code with repository secrets;
- a package manager or Node.js process launched a shell, PowerShell, curl or download utility;
- a build runner accessed secrets and then made unusual external connections;
- cloud access occurred without the normal device or authentication sequence;
- wallet destinations, signing policies or approval logic changed;
- the same identity touched development and production transaction systems;
- normal separation of duties or code-review controls were bypassed.

## Expected legitimate activity

- proof-of-concept and recruitment exercises;
- new development projects and dependency upgrades;
- container-based testing;
- maintainer recovery and package publication;
- emergency production support;
- planned cloud, wallet or payment changes;
- approved CI/CD deployments.

These activities should be linked to tickets, repositories, peer review, change approval and known release windows.

## Investigation steps

1. Preserve the project, repository, package, lockfile, workflow and communication involved.
2. Record package names, versions, publication times, maintainers and dependency paths.
3. Calculate SHA-256 hashes for relevant files and artefacts without executing them again.
4. Review package-installation, interpreter, child-process and network activity.
5. Identify accessed repository secrets, credentials, browser data, cloud keys or session tokens.
6. Review maintainer authentication, recovery changes and package-publishing events.
7. Identify affected builds, artefacts, container images, applications and downstream customers.
8. Review cloud and bastion access after the suspected execution or publication.
9. Compare code, deployment and wallet changes with approved records.
10. Trace affected transactions and destination addresses or accounts.
11. Review suppliers and developer identities with similar exposure.

## Containment

- isolate affected developer devices and build runners;
- suspend compromised maintainer and repository identities;
- remove or quarantine malicious package versions and affected artefacts;
- revoke cloud sessions, OIDC credentials, keys, SSH credentials and developer tokens;
- rotate secrets and signing material according to key-management procedures;
- stop or require reapproval for affected transactions;
- suspend unauthorised deployments and rebuild from known-good sources;
- preserve registry, repository, CI/CD, cloud and transaction evidence;
- notify fraud, wallet operations, suppliers, legal, sanctions and law enforcement where applicable.

## ATT&CK mapping

- `T1656` — Impersonation
- `T1204.002` — User Execution: Malicious File
- `T1059` — Command and Scripting Interpreter
- `T1195.001` — Supply Chain Compromise: Compromise Software Dependencies and Development Tools
- `T1539` — Steal Web Session Cookie
- `T1552.001` — Unsecured Credentials: Credentials In Files
- `T1078` — Valid Accounts

The final transaction manipulation requires organisation-specific fraud and application mapping beyond ATT&CK.

## Defensive control requirements

- phishing-resistant MFA for maintainer, repository and build-system identities;
- short-lived workload identities instead of long-lived personal-access tokens;
- restricted privileged workflow triggers and mandatory review for workflow changes;
- approved internal registries and package cooling periods;
- SBOMs and inventories of third-party build actions;
- disabled or tightly allowlisted package lifecycle scripts;
- ephemeral runners with limited network egress;
- signed artefacts and verifiable build provenance;
- separation between development, build and production transaction roles;
- managed secret storage and rapid rotation procedures.

## Validation plan

Use an isolated test developer environment.

1. Clone a benign test repository.
2. Add a harmless test dependency and lockfile change.
3. Run a controlled package lifecycle script that creates a test marker only.
4. Execute the build through a test runner with dummy secrets.
5. Access a non-sensitive test cloud resource.
6. Submit a non-production transaction-configuration change.
7. Confirm the SIEM can connect the repository, package, runner, identity, cloud and transaction events.

Do not publish a real malicious package or expose production credentials.

## Review conditions

Review when:

- package-manager or registry security features change;
- development tooling or cloud providers change;
- transaction architecture changes;
- a new open-source supply-chain campaign is reported;
- maintainer or CI/CD identity models change;
- session-binding or device-trust controls improve;
- a real incident reveals an unmonitored developer, package or supplier path.
