# Financial SOC Detection Specifications

## Purpose

These are vendor-neutral detection designs derived from the threat-intelligence assessment.

They are not presented as production-ready queries. A real organisation must map the fields to its own log sources, tune the thresholds and validate each detection through controlled testing.

## Why I used specifications instead of untested SIEM queries

A query can look impressive while depending on logs that do not exist or fields that mean different things in another platform.

Each specification therefore records:

- the attacker behaviour;
- the financial assets at risk;
- required telemetry;
- correlation logic;
- expected legitimate activity;
- investigation and containment steps;
- validation requirements.

## Detection set

1. [Identity reset followed by SaaS exfiltration](identity-reset-to-saas-exfiltration.md)
2. [Public-facing application exploitation followed by a web shell](public-app-exploitation-to-web-shell.md)
3. [Suspicious support-agent customer-data access](support-insider-data-access.md)
4. [Payment-detail change and BEC correlation](payment-change-bec.md)
5. [DDoS traffic correlated with service degradation](ddos-service-degradation.md)

## Development workflow

```text
Threat intelligence
        ↓
Detection specification
        ↓
Data-source confirmation
        ↓
Platform query or Sigma rule
        ↓
Controlled test
        ↓
Tuning and deployment
        ↓
Periodic review
```

## Current limitations

- No production data was used.
- Thresholds are conceptual until a baseline is available.
- Product-specific field mappings are not included.
- The specifications describe defensive monitoring and are intended for authorised environments.
