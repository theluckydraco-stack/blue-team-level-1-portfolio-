# Detection Specification: Virtualisation and Recovery-Control Compromise

## Detection objective

Identify an attacker using privileged identity to take control of hypervisors, identity infrastructure or backup systems in order to expand access, disable recovery or increase extortion pressure.

## Threat basis

Scattered Spider / UNC3944 reporting documented access to VMware vCenter and ESXi environments and techniques used to reset local administrator credentials. Mandiant's wider 2026 findings also identify identity, virtualisation and recovery infrastructure as high-value targets because one control plane can affect many systems.

## Financial assets at risk

- virtual machines hosting banking and payment services;
- identity and authentication systems;
- backup repositories and recovery consoles;
- security management servers;
- databases and business applications;
- disaster-recovery environments.

## Required telemetry

- vCenter, ESXi and hypervisor audit logs;
- identity-provider and privileged-access logs;
- backup administration and deletion events;
- ISO or virtual-media attachment events;
- local and directory administrator changes;
- VM shutdown, snapshot, export and deletion activity;
- remote-management and console access;
- security-agent tampering and logging changes.

## Correlation logic

Alert when a recently changed or unusual privileged identity performs high-impact virtualisation or recovery actions.

```text
New or recovered privileged identity
        ↓
Hypervisor, backup or identity-console access
        ↓
Local administrator reset, virtual-media mount or role change
        ↓
VM shutdown, export, deletion or security impairment
```

Increase severity when:

- access follows a help-desk reset or new MFA factor;
- the identity has never administered the platform before;
- an unusual ISO or recovery tool is mounted;
- backup retention, immutability or deletion policy changes;
- many VMs are stopped or snapshots are deleted;
- logging, EDR or network controls are disabled;
- the activity precedes ransomware or extortion communication.

## Expected legitimate activity

- planned maintenance;
- disaster-recovery exercises;
- administrator password recovery;
- migration or decommissioning;
- backup testing;
- security-tool upgrades.

High-impact activity should have approved changes, named owners and a defined maintenance window.

## Investigation steps

1. Confirm the identity, device, source network and approval record.
2. Review recent password, MFA, role and session changes.
3. Identify mounted media, executed tools and changed local accounts.
4. Determine which VMs, backups and business services were affected.
5. Review security-agent, firewall and log-forwarding changes.
6. Search for data staging, exfiltration or ransomware preparation.
7. Verify that backup copies and recovery credentials remain trustworthy.

## Containment

- suspend unauthorised privileged sessions;
- isolate affected management planes where possible;
- protect backup and recovery systems from the compromised identity domain;
- rotate administrative and service credentials;
- preserve management-plane logs and configuration;
- validate clean recovery paths before restoring production systems.

## ATT&CK mapping

Relevant behaviours may include:

- `T1078` — Valid Accounts
- `T1098` — Account Manipulation
- `T1489` — Service Stop
- `T1490` — Inhibit System Recovery
- current ATT&CK **Defense Impairment** techniques where controls are directly weakened

## Validation plan

Use an isolated virtualisation lab. Perform approved test role changes, mount benign virtual media, stop a test VM and modify a non-production backup setting. Confirm that the detection captures the identity and business-service context.

## Review conditions

Review when:

- hypervisor or backup products change;
- management moves to cloud services;
- recovery architecture or identity boundaries change;
- a resilience test exposes missing logs;
- ATT&CK technique structure changes.
