# Digital Forensics

This section documents practical digital-forensics work completed during Blue Team Level 1 training. The emphasis is on **evidence acquisition, integrity, artifact interpretation, recovery, and defensible conclusions** rather than one GitHub page per course lab.

## Projects

| Project | Investigative Question | Status |
|---|---|---|
| [Forensic Evidence Acquisition and Recovery](forensic-evidence-acquisition-and-recovery/README.md) | How can an examiner acquire, verify, classify, and examine digital evidence, then recover deleted content while preserving the limits of each method? | **Published** |
| Windows Endpoint Artifact Reconstruction | Can Windows endpoint artifacts reconstruct suspicious file activity, execution context, browser activity, deletion events, and account/session context? | **Evidence collection in progress** |
| Memory-Based Incident Triage | What did volatile memory reveal about processes, connections, and suspicious execution? | **Planned after Volatility labs** |
| Disk Investigation and Timeline Reconstruction | Can a disk image support a multi-artifact reconstruction of user and system activity? | **Planned after Autopsy lab** |

## Current Digital Forensics Workflow

```text
Acquire evidence
      ↓
Verify integrity
      ↓
Identify filesystem / evidence structure
      ↓
Extract relevant artifacts
      ↓
Recover deleted or non-obvious content
      ↓
Correlate across sources
      ↓
Document what the evidence supports
      ↓
Record limitations and next actions
```

## Portfolio Policy

Individual BTL1 labs are not published one-for-one.

Related exercises are first retained in a private evidence log with tool output, screenshots, paths, hashes, limitations, and operational interpretation. They are only converted into portfolio projects when the combined evidence supports a coherent investigative question and an original, defensible narrative.

Course solutions, raw assessment content, credentials, and proprietary training material are not reproduced here.
