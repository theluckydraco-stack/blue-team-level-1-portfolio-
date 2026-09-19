# Security Information and Event Management (SIEM)

This section documents practical SIEM and security-monitoring work completed during Blue Team Level 1 training. The emphasis is on **telemetry, correlation, detection logic, investigation, and evidence-supported conclusions** rather than reproducing course exercises one-for-one.

## Projects

| Project | Investigative Question | Status |
|---|---|---|
| [Windows Security Event Account-Activity Investigation](windows-event-log-account-activity-investigation/README.md) | Can Windows Security events reconstruct account creation, privilege changes, group membership, and subsequent logon activity? | **Published** |
| Splunk Security Investigations | How can centralized logs be searched, correlated, and pivoted to scope suspicious activity? | **Planned as Splunk labs are completed** |
| Detection and Correlation Rules | How can repeated investigative patterns be converted into reusable SIEM detections? | **Planned after Sigma/correlation work** |

## Current SIEM Workflow

```text
Telemetry generated
→ collected centrally
→ parsed / normalized
→ searched and correlated
→ suspicious pattern identified
→ analyst validates the evidence
→ scope and next actions documented
```

## Portfolio Policy

Individual BTL1 labs are not published one-for-one.

A lab is converted into a portfolio project only when it demonstrates a transferable analyst workflow: a clear investigative question, evidence sources, method, findings, pivots, limitations, and justified next actions.

Course question/answer pages, credentials, and proprietary assessment material are not reproduced.
