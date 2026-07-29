# UNC1069 Cryptocurrency Targeting and Axios Supply-Chain Compromise — 2026

## Why I included this case

This is one of the strongest current updates to the project's highest-priority threat family.

Google Threat Intelligence and Mandiant used the source-specific label `UNC1069` for North Korea-nexus activity targeting cryptocurrency and decentralised-finance organisations.

The reporting shows two very different ways to reach financial technology:

```text
High-touch path
Compromise or impersonate a trusted person
        ↓
Deceive one valuable employee

Scalable path
Compromise a trusted software package
        ↓
Reach many developer and build environments
```

The actor label is preserved exactly as used by the source. It is not automatically merged with APT38, TraderTraitor, UNC4899 or every other DPRK-related name.

## Case 1 — AI-enabled social engineering against a fintech entity

On 9 February 2026, Mandiant described an intrusion against a fintech entity in the cryptocurrency and decentralised-finance sector.

The reported chain involved:

```text
Compromised Telegram account belonging to a trusted contact
        ↓
Fake Zoom meeting
        ↓
Reported AI-generated video used to strengthen the deception
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

No single clue would necessarily look obviously malicious to the victim.

## Case 2 — Axios NPM package supply-chain compromise

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
NPM postinstall hook runs automatically
        ↓
Obfuscated dropper selects Windows, macOS or Linux payload
        ↓
WAVESHAPER.V2 backdoor deployed
        ↓
Credentials, source code, cloud access and other secrets at risk
```

Google attributed the activity to UNC1069 based on the use of WAVESHAPER.V2 and infrastructure overlaps with previous activity.

## Why Axios created systemic risk

Axios is a highly used JavaScript library. Many developers may install it directly, while many more projects receive it indirectly as a dependency.

This creates a hidden trust path:

```text
Financial application
        ↓ depends on
Another library
        ↓ depends on
Compromised Axios release
```

A developer may never knowingly select the malicious package.

The risk applies to:

- fintech developers;
- exchange and wallet software;
- web and mobile banking applications;
- CI/CD build systems;
- cloud deployment pipelines;
- third-party software vendors;
- any environment where developer systems hold production credentials.

## Observables versus durable behaviours

The source published package versions, hashes, domains and IP addresses. These are useful for immediate exposure checks.

The more durable behaviours are:

- maintainer-account changes;
- new dependency introduction;
- unexpected `postinstall` scripts;
- Node.js spawning shells, PowerShell, curl or system utilities;
- package installation followed by credential access;
- modification of lockfiles or package metadata;
- unusual outbound connections from developer or build systems;
- automated cleanup intended to remove traces.

## Evidence a financial SOC needs

### Developer endpoints

- package installation and process creation;
- Node.js child processes;
- PowerShell, Bash, Python, curl and script-host activity;
- access to SSH keys, cloud credentials and browser sessions;
- EDR and DNS/network telemetry.

### Source control and CI/CD

- package-lock and dependency changes;
- build provenance and artifact hashes;
- maintainer and repository-account changes;
- pipeline execution and secret access;
- package-registry downloads and cache contents;
- deployments using affected artifacts.

### Cloud and transaction systems

- use of exposed keys or tokens;
- new sessions from developer identities;
- unusual access to wallet, signing or transaction services;
- code or configuration changes outside approved pipelines.

## Detection and hunting priorities

1. Search dependency inventories and caches for the affected versions and malicious dependency.
2. Hunt for Node.js or package installers spawning system shells and download tools.
3. Correlate package installation with access to credential files or cloud secrets.
4. Review CI/CD builds created during the exposure period.
5. Identify applications and downstream customers that received affected artifacts.
6. Rotate credentials present on confirmed compromised systems.
7. Search for WAVESHAPER.V2 activity across Windows, macOS and Linux developer environments.
8. Review maintainer-account and package-publishing security.

## Defensive priorities

- pin dependencies and review lockfile changes;
- use approved internal package repositories;
- generate and review software bills of materials;
- require strong, phishing-resistant authentication for package maintainers;
- isolate build environments and remove unnecessary production credentials;
- store secrets in managed vaults;
- monitor package `postinstall` behaviour;
- require signed and traceable build provenance;
- treat developer workstations and build servers as high-value financial infrastructure.

## Strategic assessment

**Observed fact:** Mandiant documented targeted social engineering against a cryptocurrency-sector fintech entity in February 2026. GTIG documented a March 2026 Axios package compromise attributed to the same source-defined UNC1069 cluster.

**My assessment:** the two cases show an actor moving between precision targeting and scalable supply-chain access. Both methods exploit trust: one trusts a colleague and video meeting, while the other trusts a software maintainer and package ecosystem.

**Confidence:** high for the source-reported incidents and attribution assessment; moderate when inferring one unified operational strategy because public reporting cannot show every decision or operator.

**Alternative explanation:** different subgroups or operators may have used shared malware and infrastructure under the same analytical cluster.

## Financial-sector decision relevance

This case strengthens the project's original conclusion:

> The modern financial attack surface includes the people and software that build the financial service, not only the systems that hold the money.

## Sources

- Mandiant — UNC1069 Targets Cryptocurrency Sector with New Tooling and AI-Enabled Social Engineering: https://cloud.google.com/blog/topics/threat-intelligence/unc1069-targets-cryptocurrency-ai-social-engineering
- Google Threat Intelligence Group — North Korea-Nexus Threat Actor Compromises Widely Used Axios NPM Package in Supply Chain Attack: https://cloud.google.com/blog/topics/threat-intelligence/north-korea-threat-actor-targets-axios-npm-package
