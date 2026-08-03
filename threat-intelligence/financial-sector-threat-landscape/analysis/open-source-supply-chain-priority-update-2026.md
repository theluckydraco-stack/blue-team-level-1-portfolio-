# Open-Source Supply-Chain Priority Update — July 2026

## The problem

Financial organisations increasingly build services from open-source packages, hosted repositories and automated CI/CD workflows. A package maintainer, repository account or build workflow may therefore hold indirect trust over production financial software.

An attacker does not need to compromise the payment platform first. They can compromise a dependency or the identity that publishes it and wait for trusted developer or build systems to execute the malicious change.

```text
Maintainer or developer identity compromise
        ↓
Repository, package or workflow manipulation
        ↓
Trusted installation inside developer or CI/CD systems
        ↓
Credential, source-code or signing-secret theft
        ↓
Cloud, production or transaction access
```

## Material intelligence update

On 30 July 2026, Google Threat Intelligence Group and Mandiant reported that most of the highest-impact supply-chain incidents they tracked during 2025 and the first half of 2026 involved code repositories, software dependencies and developer tools.

The reporting included:

- attacks against PyPI, npm and Docker Hub ecosystems;
- abuse of GitHub Actions workflow triggers such as `pull_request_target`;
- credential theft from development and build environments;
- package-maintainer account compromise;
- malicious dependency publication;
- attempts to pivot from compromised developer tooling into wider networks;
- monetisation through credential sale, ransomware or data-theft partnerships.

GTIG assessed with high confidence that large-scale open-source supply-chain compromise had expanded significantly compared with previous years and expected further growth through the remainder of 2026.

## Financial-sector relevance

This is especially important to:

- fintech development teams;
- cryptocurrency exchanges and wallet providers;
- payment API and mobile-banking developers;
- software vendors serving financial institutions;
- cloud-native financial services;
- organisations whose CI/CD systems hold production credentials or signing authority.

A popular dependency creates concentration risk. One compromised package can enter many applications directly or through nested dependencies that the final organisation did not knowingly select.

## Axios case and actor naming

GTIG reported that a compromised Axios maintainer account was used to introduce a malicious dependency into legitimate package releases in March 2026. The activity was attributed to the North Korean cluster now named `MIDNIGHT NEPTUNE`, previously tracked by Google as `UNC1069` and `MASAN`.

The package reportedly had more than 100 million weekly downloads, and GTIG supported affected customers across at least 15 industries and 13 countries.

This strengthens the project's existing first-place ranking for DPRK financial-theft activity. It does not create a new actor priority because the same broad threat family was already ranked highest for developer targeting, cryptocurrency theft and software manipulation.

## Evidence a financial SOC should collect

### Repository and package identity

- maintainer logins, MFA events and recovery changes;
- package publication and ownership changes;
- personal-access-token and SSH-key creation or use;
- GitHub App and OIDC trust configuration;
- repository permission and branch-protection changes.

### Source and dependency changes

- dependency manifest and lockfile differences;
- new package names and unusually recent versions;
- package source, registry and maintainer history;
- changes to workflow files and build configuration;
- software bill of materials and dependency inventory.

### Build and runtime evidence

- package installation scripts and lifecycle hooks;
- shells, interpreters or download tools launched by package managers;
- secret, token and credential-file access from runners;
- network egress from developer systems and CI/CD runners;
- container-image creation and registry publication;
- artefact hashes, signatures and provenance.

### Downstream financial evidence

- deployments built from affected artefacts;
- new cloud sessions or API activity using exposed credentials;
- unauthorised changes to wallet, payment or transaction logic;
- financial events occurring after suspicious builds or deployments.

## Detection priorities

1. Alert on package or workflow publication after a maintainer recovery, MFA or credential change.
2. Detect privileged workflow triggers such as `pull_request_target` executing untrusted code with repository secrets.
3. Alert when a package manager or Node.js process launches a shell, PowerShell, curl or another download utility.
4. Correlate package installation with access to cloud keys, repository tokens or signing secrets.
5. Detect unusual egress from normally restricted build runners.
6. Alert on changes to dependency manifests or lock files outside approved pull requests.
7. Identify newly published package versions introduced directly into production builds without a cooling period.
8. Correlate a suspicious build with later production, wallet or transaction changes.

## Defensive priorities

- require phishing-resistant MFA for maintainer and repository identities;
- replace long-lived personal-access tokens with short-lived workload identities where possible;
- restrict privileged CI/CD triggers and require review for workflow changes;
- use ephemeral, single-purpose runners with limited network egress;
- isolate build environments from production transaction systems;
- maintain SBOMs and an inventory of third-party build actions;
- enforce approved internal registries and package cooling periods;
- disable or tightly allowlist package lifecycle scripts;
- require signed artefacts and verifiable build provenance;
- monitor and rotate secrets exposed to confirmed compromised runners.

## Assessment

**Observed fact:** GTIG documented increased use of open-source repositories, dependencies and developer tools for supply-chain compromise during 2025 and early 2026.

**Publisher assessment:** GTIG assessed with high confidence that this represented a significant expansion in attacker use of the tactic and expected continued growth.

**My assessment:** open-source package ecosystems and CI/CD workflow identities should be treated as first-tier financial trust relationships because they can influence the software that reaches production, handles customer data or authorises transactions.

**Confidence:** high.

**Alternative explanation:** public reporting may overrepresent large, visible package incidents, while many organisations may reduce exposure through internal registries, provenance controls and isolated build systems.

## Effect on the project

```text
Actor ranking                     No change
Primary financial threat          DPRK financial-theft activity remains first
Attack-model priority             Open-source and CI/CD compromise elevated
Telemetry priority                Developer, package-registry and runner logs elevated
Alias handling                     Current GTIG names recorded without erasing historical labels
Strategic conclusion              Reinforced
```

## Sources

- Google Threat Intelligence Group and Mandiant — Batten Down Your Packages: Mitigation Guidance for Supply Chain Compromise: https://cloud.google.com/blog/topics/threat-intelligence/mitigation-guidance-for-supply-chain-compromise
- Google Threat Intelligence Group — Updated Cyber Threat Actor Naming System: https://cloud.google.com/blog/topics/threat-intelligence/updated-cyber-threat-actor-naming-system
