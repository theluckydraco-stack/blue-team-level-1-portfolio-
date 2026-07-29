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
2. [Device-code OAuth token abuse](device-code-oauth-token-abuse.md)
3. [Public-facing application exploitation followed by a web shell](public-app-exploitation-to-web-shell.md)
4. [Suspicious support-agent customer-data access](support-insider-data-access.md)
5. [Payment-detail change and BEC correlation](payment-change-bec.md)
6. [Voice or video impersonation followed by a high-risk payment](voice-deepfake-payment-request.md)
7. [Developer compromise leading to transaction manipulation](developer-to-transaction-compromise.md)
8. [Malicious redirect chain and financial brand impersonation](malicious-redirect-brand-impersonation.md)
9. [Bulk data collection followed by cloud exfiltration](bulk-data-to-cloud-exfiltration.md)
10. [Virtualisation and recovery-control compromise](virtualisation-and-recovery-control.md)
11. [Payment-system reconnaissance and operator imitation](payment-system-operator-imitation.md)
12. [DDoS traffic correlated with service degradation](ddos-service-degradation.md)

## Coverage areas

The specifications cover:

```text
Identity recovery and session tokens
Cloud and SaaS access
Public application exploitation
Third-party and support access
Developer and CI/CD compromise
Payment and beneficiary changes
Voice, video and brand impersonation
Redirect-based phishing delivery
Data collection and exfiltration
Virtualisation and recovery systems
ATM, SWIFT and payment-operator activity
DDoS and business-service availability
```

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
- ATT&CK mappings organise behaviour but do not replace fraud, payment and business-process context.
