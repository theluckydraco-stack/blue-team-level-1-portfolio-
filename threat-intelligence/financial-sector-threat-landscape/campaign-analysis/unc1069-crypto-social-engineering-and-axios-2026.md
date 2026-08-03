# MIDNIGHT NEPTUNE Cryptocurrency Targeting and Axios Supply-Chain Compromise — 2026

## Naming note

The February and March 2026 source reports used the label `UNC1069`. On 30 July 2026, Google Threat Intelligence Group published the current mapping:

```text
UNC1069 / MASAN → MIDNIGHT NEPTUNE
```

I retain `UNC1069` when describing what the original reports said and use `MIDNIGHT NEPTUNE` for the current GTIG name. This does not make MIDNIGHT NEPTUNE identical to APT38, TraderTraitor, UNC4899 or every other North Korea-linked cluster.

## Why I included this case

This is one of the strongest current updates to the project's highest-priority threat family.

The reporting shows two different ways to reach financial technology:

```text
High-touch path
Compromise or impersonate a trusted person
        ↓
Deceive one valuable employee

Scalable path
Compromise a trusted package or maintainer
        ↓
Reach many developer and build environments
```

Both paths exploit trust before they reach the financial asset.

## Case 1 — AI-enabled social engineering against a fintech entity

On 9 February 2026, Mandiant described an intrusion against a fintech entity in the cryptocurrency and decentralised-finance sector.

The reported chain involved:

```text
Compromised Telegram account belonging to a trusted contact
        ↓
Fake Zoom meeting
        ↓
Reported AI-generated video strengthens the deception
        ↓
ClickFix-style instruction persuades the victim to run a command
        ↓
Malware deployment and host compromise
```

### ClickFix explained

**ClickFix** is a social-engineering method in which a website or message claims that the user must copy and run a command to repair a problem, verify access or complete a meeting. The user performs the execution step for the attacker.

It is a modern parallel to the BTL1 attachment lesson:

```text
Traditional attachment
User opens the malicious file

ClickFix
User copies and runs the malicious command
```

Mandiant identified seven malware families in the compromised environment. The report named new tooling including `SILENCELIFT`, `DEEPBREATH` and `CHROMEPUSH`, with `SUGARLOADER` being the only family already tracked before the investigation.

### Why the deception was effective

The attacker combined several trust signals:

- a compromised real messaging account;
- an expected business communication platform;
- a video interaction;
- an instruction framed as a technical fix;
- targeting inside a cryptocurrency business context.

No single signal would necessarily appear obviously malicious to the victim.

## Case 2 — Axios npm package supply-chain compromise

On 31 March 2026, Google Threat Intelligence reported an active compromise involving the widely used `axios` Node Package Manager package.

Between 00:21 and 03:20 UTC, a malicious dependency named `plain-crypto-js` was introduced into axios releases `1.14.1` and `0.30.4`.

The reported chain was:

```text
Axios maintainer account compromised
        ↓
Malicious dependency added to legitimate releases
        ↓
Developer or build system installs the trusted package
        ↓
npm postinstall hook runs automatically
        ↓
Obfuscated dropper selects Windows, macOS or Linux payload
        ↓
WAVESHAPER.V2 backdoor deployed
        ↓
Credentials, source code, cloud access and other secrets at risk
```

Google attributed the activity to the cluster then called UNC1069, now MIDNIGHT NEPTUNE, based on WAVESHAPER.V2 and infrastructure overlaps.

## July 2026 supply-chain update

On 30 July 2026, GTIG and Mandiant reported that most of the highest-impact supply-chain incidents they tracked during 2025 and early 2026 involved code repositories, dependencies and developer tools.

For the Axios compromise, GTIG reported:

- more than 100 million weekly package downloads;
- affected customers across at least 15 industries;
- affected customers in 13 countries;
- spread into downstream packages that depended on Axios.

**My assessment:** this is not only a malware-distribution case. It is a concentration-risk case in which one maintainer identity and one trusted dependency could expose many development environments.

## Why Axios created systemic financial risk

Axios is a widely used JavaScript library. Developers may install it directly, while other applications receive it indirectly through nested dependencies.

```text
Financial application
        ↓ depends on
Another library
        ↓ depends on
Compromised Axios release
```

The risk applies to:

- fintech developers;
- exchanges and wallet software;
- web and mobile banking applications;
- CI/CD build systems;
- cloud deployment pipelines;
- third-party software vendors;
- environments where developer systems hold production credentials.

## Observables versus durable behaviours

The source published package versions, hashes, domains and IP addresses. These are useful for immediate exposure checks.

The more durable behaviours are:

- maintainer-account recovery or authentication changes;
- new dependency introduction;
- unusually recent package versions entering a build;
- unexpected package lifecycle or `postinstall` scripts;
- Node.js spawning shells, PowerShell, curl or system utilities;
- package installation followed by credential access;
- lockfile, workflow or package-metadata modification;
- unusual outbound connections from developer or build systems;
- personal-access-token, OIDC or repository-secret abuse;
- automated cleanup intended to remove traces.

## Evidence a financial SOC needs

### Developer endpoints

- package installation and process creation;
- Node.js child processes;
- PowerShell, Bash, Python, curl and script-host activity;
- access to SSH keys, cloud credentials and browser sessions;
- EDR, DNS and network telemetry.

### Source control and package registries

- maintainer logins, MFA and recovery changes;
- package ownership and publishing events;
- personal-access-token and SSH-key use;
- dependency-manifest and lockfile changes;
- workflow-file and branch-protection changes;
- privileged triggers such as `pull_request_target`;
- GitHub App and OIDC trust configuration.

### CI/CD and artefacts

- pipeline execution and secret access;
- package install-script activity;
- runner network egress;
- build provenance, signatures and artefact hashes;
- container-image and registry publication;
- deployments using affected artefacts.

### Cloud and transaction systems

- use of exposed keys or tokens;
- new sessions from developer identities;
- unusual access to wallet, signing or transaction services;
- code or configuration changes outside approved pipelines;
- financial events following suspicious builds or deployments.

## Detection and hunting priorities

1. Search dependency inventories, caches and SBOMs for affected versions and the malicious dependency.
2. Hunt for package managers or Node.js spawning shells and download tools.
3. Correlate package installation with access to credential files, repository secrets or cloud keys.
4. Review package publishing, maintainer authentication and recovery events.
5. Alert on workflow changes or privileged triggers executing untrusted pull-request code with secrets.
6. Identify unusually recent package versions entering production builds without an approved cooling period.
7. Review CI/CD builds created during the exposure period and trace downstream artefacts.
8. Restrict and analyse unexpected egress from developer systems and build runners.
9. Rotate credentials present on confirmed compromised systems or runners.
10. Search for WAVESHAPER.V2 activity across Windows, macOS and Linux developer environments.

## Defensive priorities

- pin dependencies and review lockfile changes;
- use approved internal package registries;
- maintain software bills of materials and third-party action inventories;
- require phishing-resistant authentication for maintainers and repository administrators;
- replace long-lived personal-access tokens with short-lived workload identities where possible;
- restrict `pull_request_target` and other privileged workflow triggers;
- use ephemeral build runners with limited egress;
- isolate builds from production transaction systems;
- disable or tightly allowlist package lifecycle scripts;
- require signed artefacts and traceable build provenance;
- store secrets in managed vaults;
- treat developer workstations and build systems as high-value financial infrastructure.

## Strategic assessment

**Observed fact:** Mandiant documented targeted social engineering against a cryptocurrency-sector fintech entity in February 2026. GTIG documented a March 2026 Axios package compromise attributed to the same source-defined cluster and later renamed it MIDNIGHT NEPTUNE.

**Publisher assessment:** GTIG assessed with high confidence that large-scale open-source supply-chain compromise had expanded significantly during 2025 and early 2026 and expected further growth.

**My assessment:** the cases show movement between precision targeting and scalable software access. One path abuses trust in a person; the other abuses trust in a maintainer, package and build process.

**Confidence:** high for the source-reported incidents and name mapping; moderate when inferring one unified operational strategy because public reporting cannot show every decision or operator.

**Alternative explanation:** different subgroups or operators may use shared tooling and infrastructure under one analytical cluster.

## Financial-sector decision relevance

This case strengthens the project's original conclusion:

> The modern financial attack surface includes the people, identities, packages and build systems that create the financial service—not only the systems that hold the money.

## Sources

- Mandiant — UNC1069 Targets Cryptocurrency Sector with New Tooling and AI-Enabled Social Engineering: https://cloud.google.com/blog/topics/threat-intelligence/unc1069-targets-cryptocurrency-ai-social-engineering
- Google Threat Intelligence Group — North Korea-Nexus Threat Actor Compromises Widely Used Axios npm Package in Supply Chain Attack: https://cloud.google.com/blog/topics/threat-intelligence/north-korea-threat-actor-targets-axios-npm-package
- Google Threat Intelligence Group and Mandiant — Batten Down Your Packages: Mitigation Guidance for Supply Chain Compromise: https://cloud.google.com/blog/topics/threat-intelligence/mitigation-guidance-for-supply-chain-compromise
- Google Threat Intelligence Group — Updated Cyber Threat Actor Naming System: https://cloud.google.com/blog/topics/threat-intelligence/updated-cyber-threat-actor-naming-system
