# Project Status

## Completed

### Intelligence and analysis

- Intelligence requirements and financial-sector scope
- Reader guide and analytic framework
- Transparent [relevance-scoring method](methodology/relevance-scoring.md)
- Six actor or historical-comparison profiles
- Nine campaign and incident analyses through 2026
- [Financial attack-model comparison](analysis/attack-model-comparison.md)
- European financial-sector baseline
- Executive assessment
- [Financial SOC telemetry catalogue](analysis/financial-soc-telemetry-catalogue.md)
- DORA operational alignment
- Modern standards and deprecated-concept review
- [Skills demonstrated and honest limitations](analysis/skills-demonstrated.md)

### Detection engineering

- Twelve vendor-neutral detection specifications
- Detection coverage matrix
- Threat-intelligence-to-detection workflow
- Experimental Sigma ordered-correlation rule
- MISP event and platform design

### Current-source maintenance

- Weekly Financial Threat Watch enabled
- [Material update index](updates/README.md)
- Research and operational source logs
- Strategic and operational context registers
- 2023–2026 financial threat timeline

## Latest material update — 3 August 2026

The latest review did not change the actor ranking. It strengthened two parts of the project:

1. **Open-source and CI/CD compromise received higher operational priority.** Package registries, maintainer identities, workflow triggers, repository secrets and build-runner egress are now treated as first-tier financial telemetry.
2. **GTIG actor-name changes were recorded without rewriting historical sources.** The project now tracks current mappings such as `UNC1069` / `MASAN` to `MIDNIGHT NEPTUNE`, `APT41` to `SPIRE CASTLE`, and `FIN11` to `RAZOR COMET`.

Files added or updated:

- [Financial Threat Watch — 3 August 2026](updates/2026-08-03-financial-threat-watch.md)
- [Open-source supply-chain priority update](analysis/open-source-supply-chain-priority-update-2026.md)
- [Actor alias management method](methodology/actor-alias-management.md)
- [Actor alias register](data/actor-alias-register.csv)
- [MIDNIGHT NEPTUNE / UNC1069 case study](campaign-analysis/unc1069-crypto-social-engineering-and-axios-2026.md)
- [Developer or supply-chain compromise detection specification](detections/developer-to-transaction-compromise.md)

## Prepared but not yet executed

### Windows identity correlation lab

The first hands-on validation package is ready:

```text
lab-plans/windows-identity-correlation/
├── README.md
├── run-lab.ps1
└── evidence-template.md

detections/sigma/
├── README.md
└── mr_password_reset_then_finance_group_add.yml
```

The lab will generate and correlate:

```text
Event 4724 — password reset
        ↓
Event 4728 — same account added to Finance-Admins-Lab
```

Open the [Windows Identity Correlation Lab](lab-plans/windows-identity-correlation/README.md) for the safe execution steps.

## Why manual execution is now required

The next missing evidence must come from the actual Windows Server lab:

- raw Windows Security events;
- event-field names and values;
- exported event CSV;
- chosen SIEM field mapping;
- generated alert;
- screenshots and tuning notes.

These cannot be truthfully created from public research alone.

## Next validation sequence

1. Run the safe PowerShell lab on the domain controller.
2. Confirm Events 4724 and 4728 in Event Viewer.
3. Review and redact the exported CSV.
4. Complete the [evidence template](lab-plans/windows-identity-correlation/evidence-template.md).
5. Convert or recreate the Sigma correlation in the selected SIEM.
6. Repeat the test and capture the alert.
7. Mark the detection as `Validated in lab` only after the result is confirmed.

## Current honest status

```text
Threat research                 Complete
Strategic assessment            Complete
Telemetry requirements          Complete
Detection specifications        Complete
Sigma design                    Complete
Windows lab package             Ready
Manual event generation         Pending
SIEM implementation             Pending
Detection validation            Pending
```
