# Common ATT&CK Techniques

## Purpose

This file compares behaviours across the project's relevance-based actor set: DPRK financial-theft activity, Scattered Spider / UNC3944, CL0P-related third-party exploitation and APT41. Cobalt Group and Silence will be added later as historical Eastern European comparators.

The goal is not to prove attribution from ATT&CK overlap. The goal is to identify behaviours that create practical detection, threat-hunting and control-validation opportunities for a financial-sector SOC.

## Selection Rules

A technique is retained when it meets at least one condition:

- it is documented across multiple selected actors;
- it affects high-value financial, identity, cloud or third-party systems;
- it provides a clear detection or hunting opportunity;
- it helps explain an important attack path from initial access to theft, exfiltration or impact;
- the mapping is supported by an authoritative or primary source.

## Working Table

| Technique ID | Technique | DPRK financial theft | Scattered Spider / UNC3944 | CL0P-related activity | APT41 | Financial-sector significance | Required telemetry | Detection or hunt idea |
|---|---|---:|---:|---:|---:|---|---|---|
| `T1656` | Impersonation | Yes | Research required | Research required | Research required | Recruiter, help-desk, supplier or executive impersonation can obtain trusted access without exploiting software | Employee reports, help-desk records, HR verification, identity investigations | Correlate external contact with password resets, new MFA devices, code execution or privileged access |
| `T1204.002` | User Execution: Malicious File | Yes | Research required | Research required | Research required | Developers and analysts may execute malicious job tests, repositories, documents or tools | EDR, process creation, shell history, container runtime, download and repository telemetry | Detect interpreters or containers launched from new and low-reputation project folders |
| `T1539` | Steal Web Session Cookie | Yes | Research required | Research required | Research required | Session theft may bypass passwords and some MFA controls | IdP, browser, session-risk, device-binding and cloud audit logs | Alert on session reuse from new devices or networks without a corresponding authentication event |
| `T1078` | Valid Accounts | Yes | Research required | Research required | Yes | Stolen identities can blend into normal administrative and cloud activity | IdP, VPN, Active Directory, cloud audit, PAM and endpoint logs | Identify unusual geography, device, time, privilege use or service access for legitimate accounts |
| `T1552.001` | Unsecured Credentials: Credentials In Files | Yes | Research required | Research required | Research required | Developer endpoints and bastions may contain cloud keys, SSH keys and signing credentials | EDR file access, secret scanning, cloud key use, CLI and repository telemetry | Hunt for access to credential files followed by remote cloud or bastion activity |
| `T1190` | Exploit Public-Facing Application | Research required | Research required | Yes | Yes | Internet-facing banking, payment, VPN and third-party systems can provide scalable access | WAF, application, vulnerability, reverse-proxy, EDR and authentication logs | Correlate exploitation attempts with child processes, new files, web shells or privileged logins |
| `T1505.003` | Server Software Component: Web Shell | Research required | Research required | Yes | Yes | Web shells can provide persistent access to exposed or third-party servers | Web access, file-integrity, process, EDR and application logs | Hunt for newly created server-side scripts and web-server processes spawning shells |
| `T1195.002` | Supply Chain Compromise: Compromise Software Supply Chain | Yes | Research required | Research required | Yes | A compromised provider, package or deployment process can expose many downstream financial organisations | Vendor-risk, CI/CD, package, code-signing, deployment, integrity and endpoint logs | Detect unauthorised build changes, new dependencies, code-signing anomalies and downstream execution |
| `T1567.002` | Exfiltration Over Web Service: Exfiltration to Cloud Storage | Research required | Research required | Research required | Yes | Legitimate cloud services can hide data theft inside expected encrypted traffic | Proxy, CASB, endpoint, cloud-service and DLP logs | Detect unusual archive creation followed by high-volume uploads to personal or rare cloud destinations |
| `T1550.002` | Use Alternate Authentication Material: Pass the Hash | Research required | Research required | Research required | Yes | Enables lateral movement through Windows environments without plaintext passwords | Windows authentication, EDR, domain-controller and lateral-movement telemetry | Hunt for abnormal NTLM use, remote service creation and privileged logons from unusual hosts |

## Current DPRK Evidence Basis

The initial DPRK mappings are based on:

- FBI reporting on the 2024 DMM Bitcoin theft;
- Google Threat Intelligence reporting on UNC4899 cloud and cryptocurrency intrusions;
- MITRE ATT&CK reporting on APT38 where historical bank-focused context is required.

The rows describe behaviour across a source-defined family of activity. They do not mean that every APT38, TraderTraitor, UNC4899 or IT-worker operation used the same technique.

## Current Limitations

- Scattered Spider and CL0P mappings remain incomplete and will not be marked until their profiles are researched.
- Some technique mappings are analytical translations of source-described behaviour rather than labels explicitly printed by the publisher.
- Shared techniques are useful for control coverage but cannot independently establish actor identity.
- ATT&CK changes over time, so technique names and identifiers will be checked against the current version before the final project is marked complete.
