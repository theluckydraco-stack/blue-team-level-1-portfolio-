# Financial Threat Watch — Material Update

**Review date:** 3 August 2026  
**Material developments:** 2  
**Actor-ranking change:** None

## 1. Open-source supply-chain compromise receives higher operational priority

Google Threat Intelligence Group and Mandiant reported that most of the highest-impact supply-chain incidents they tracked during 2025 and the first half of 2026 involved code repositories, software dependencies and developer tools.

The report documented activity involving PyPI, npm, Docker Hub, GitHub Actions and CI/CD environments. It also described `pull_request_target` workflow abuse, package-maintainer compromise, credential theft and attempts to pivot from developer tooling into wider networks.

The Axios incident attributed to the North Korean cluster now named `MIDNIGHT NEPTUNE` reportedly affected customers across at least 15 industries and 13 countries. Axios had more than 100 million weekly downloads, illustrating how one trusted dependency can create concentration risk.

### Project effect

Open-source package ecosystems and CI/CD workflow identities are now treated as first-tier financial trust relationships.

The detection design was strengthened to include:

- dependency-manifest and lockfile changes;
- newly published package versions;
- maintainer and registry authentication;
- privileged GitHub Actions triggers;
- repository secrets, OIDC trust and personal-access-token use;
- package lifecycle scripts;
- network egress from build runners;
- credential access from developer and CI/CD systems.

The actor ranking did not change. DPRK financial-theft activity remains first because the update strengthens the already documented link among developer compromise, software manipulation and cryptocurrency theft.

## 2. GTIG actor-naming system changed

Google Threat Intelligence Group introduced a unified cryptonym-based naming system. The second word communicates the category used by GTIG:

```text
NEPTUNE = North Korea
CASTLE  = People's Republic of China
RELIC   = Russia
ION     = Iran
COMET   = cybercriminal activity
```

Relevant project mappings published in the 30 July table include:

- `UNC1069` / `MASAN` → `MIDNIGHT NEPTUNE`;
- `APT41` → `SPIRE CASTLE`;
- `FIN11` → `RAZOR COMET`.

### Project effect

The project now uses an alias register and applies these rules:

1. Preserve the name used by the source at the time of publication.
2. Record the current GTIG name as an alias with an effective date.
3. Do not rewrite historical reports as though the new name existed at publication time.
4. Do not merge every actor sharing a category word.
5. Keep MITRE, government and other vendor labels source-specific unless evidence establishes overlap.

## Overall judgement

```text
Actor ranking                     No change
Primary financial threat          DPRK financial-theft activity remains first
Attack-model priority             Open-source and CI/CD compromise elevated
Detection priorities              Developer and build-pipeline telemetry elevated
Alias methodology                 Updated
Strategic conclusion              Reinforced
```

The project conclusion remains:

> Attackers increasingly reach financial assets by compromising trusted identities, developers, packages, build systems and suppliers rather than attacking the final financial platform directly.

## Sources

- Google Threat Intelligence Group and Mandiant — Batten Down Your Packages: Mitigation Guidance for Supply Chain Compromise: https://cloud.google.com/blog/topics/threat-intelligence/mitigation-guidance-for-supply-chain-compromise
- Google Threat Intelligence Group — Updated Cyber Threat Actor Naming System: https://cloud.google.com/blog/topics/threat-intelligence/updated-cyber-threat-actor-naming-system
