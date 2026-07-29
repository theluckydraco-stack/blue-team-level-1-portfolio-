# Common ATT&CK Techniques

## Purpose

This file will compare the behaviours shared across APT41, Cobalt Group, Silence, and APT38. The final selection will focus on techniques that create practical detection or threat-hunting opportunities for a financial-sector SOC.

## Selection Rules

A technique will be included when it meets at least one of these conditions:

- It is documented across multiple selected actors.
- It is strongly relevant to financial-sector systems or identity infrastructure.
- It provides a clear detection or threat-hunting opportunity.
- It helps explain an important attack path from initial access to impact or exfiltration.

## Working Table

| Technique ID | Technique | APT41 | Cobalt Group | Silence | APT38 | Financial-sector significance | Required telemetry | Detection or hunt idea |
|---|---|---:|---:|---:|---:|---|---|---|
| `T1190` | Exploit Public-Facing Application | Yes | Research required | Research required | Research required | Internet-facing banking, payment, VPN, and third-party systems can provide initial access | WAF, application, vulnerability, reverse-proxy, EDR, and authentication logs | Correlate exploitation attempts with unusual child processes, new files, web shells, or privileged logins |
| `T1505.003` | Server Software Component: Web Shell | Yes | Research required | Research required | Research required | Web shells can provide persistent access to exposed servers | Web access, file-integrity, process, EDR, and application logs | Hunt for newly created server-side scripts, rare web requests, and web-server processes spawning shells |
| `T1078` | Valid Accounts | Yes | Research required | Research required | Research required | Stolen accounts can bypass perimeter controls and blend with normal activity | IdP, VPN, Active Directory, cloud sign-in, PAM, and endpoint logs | Identify unusual geography, device, time, privilege use, or impossible travel for valid accounts |
| `T1550.002` | Use Alternate Authentication Material: Pass the Hash | Yes | Research required | Research required | Research required | Enables lateral movement through Windows environments without plaintext passwords | Windows authentication, EDR, domain-controller, and lateral-movement telemetry | Hunt for abnormal NTLM use, remote service creation, and privileged logons from unusual hosts |
| `T1567.002` | Exfiltration Over Web Service: Exfiltration to Cloud Storage | Yes | Research required | Research required | Research required | Legitimate cloud services can hide data theft inside expected encrypted traffic | Proxy, CASB, endpoint, cloud-service, and DLP logs | Detect unusual archive creation followed by high-volume uploads to personal or rare cloud destinations |

## Current Limitations

The table currently contains only the initial APT41 mapping. A technique will not be marked for another actor until an authoritative source documents the procedure. Shared ATT&CK techniques will support comparison, but they will not be used as standalone proof of attribution.
