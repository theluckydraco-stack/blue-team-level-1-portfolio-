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
| `T1656` | Impersonation | Yes | Yes | Research required | Research required | Recruiter, help-desk, supplier or executive impersonation can obtain trusted access without exploiting software | Employee reports, help-desk records, HR verification, identity investigations | Correlate external contact with password resets, new MFA devices, code execution or privileged access |
| `T1566.004` | Phishing: Spearphishing Voice | Research required | Yes | Research required | Research required | Voice-based attacks can bypass email controls and manipulate identity-recovery processes | Call recordings, tickets, identity changes and user reports | Detect privileged reset requests followed by new device or factor enrolment |
| `T1204.002` | User Execution: Malicious File | Yes | Research required | Research required | Research required | Developers and analysts may execute malicious job tests, repositories, documents or tools | EDR, process creation, shell history, container runtime, download and repository telemetry | Detect interpreters or containers launched from new and low-reputation project folders |
| `T1621` | Multi-Factor Authentication Request Generation | Research required | Yes | Research required | Research required | Repeated prompts can pressure users into authorising attacker access | IdP MFA, denied prompt, source device and location logs | Alert on prompt bursts followed by successful authentication or factor changes |
| `T1556.006` | Modify Authentication Process: Multi-Factor Authentication | Research required | Yes | Research required | Research required | Attacker-controlled factors can preserve access after password reset | Factor registration, removal, device enrolment and help-desk logs | Correlate new factor enrolment with reset tickets and privileged SaaS access |
| `T1539` | Steal Web Session Cookie | Yes | Research required | Research required | Research required | Session theft may bypass passwords and some MFA controls | IdP, browser, session-risk, device-binding and cloud audit logs | Alert on session reuse from new devices or networks without a corresponding authentication event |
| `T1078` | Valid Accounts | Yes | Yes | Research required | Yes | Stolen identities can blend into normal administrative and cloud activity | IdP, VPN, Active Directory, cloud audit, PAM and endpoint logs | Identify unusual geography, device, time, privilege use or service access for legitimate accounts |
| `T1098` | Account Manipulation | Research required | Yes | Research required | Research required | New roles, credentials, factors or application assignments can expand access across SSO-connected systems | Okta/Entra admin, IAM, factor and ticket logs | Detect self-assignment, unusual role grants and app access soon after recovery events |
| `T1552.001` | Unsecured Credentials: Credentials In Files | Yes | Research required | Research required | Research required | Developer endpoints and bastions may contain cloud keys, SSH keys and signing credentials | EDR file access, secret scanning, cloud key use, CLI and repository telemetry | Hunt for access to credential files followed by remote cloud or bastion activity |
| `T1213.002` | Data from Information Repositories: SharePoint | Research required | Yes | Research required | Research required | Collaboration platforms reveal sensitive data, active projects and internal access instructions | Microsoft 365 audit, search and file-access logs | Detect unusual searches for VPN, VDI, security, executive or administrator information |
| `T1530` | Data from Cloud Storage | Research required | Yes | Research required | Research required | SaaS data theft may not cross on-premises network sensors | SaaS audit, object access, API and DLP logs | Identify unusual bulk reads and downloads by recently changed identities |
| `T1567.002` | Exfiltration Over Web Service: Exfiltration to Cloud Storage | Research required | Yes | Research required | Yes | Legitimate cloud services can hide data theft inside expected encrypted traffic | Proxy, CASB, endpoint, SaaS integration, cloud-service and DLP logs | Detect new sync jobs or high-volume uploads to personal or rare cloud destinations |
| `T1606.002` | Forge Web Credentials: SAML Tokens | Research required | Yes | Research required | Research required | Stolen federation certificates can create persistent access across SaaS applications | ADFS certificate, token claim, IdP and service-provider logs | Correlate token use with absent or inconsistent IdP authentication events |
| `T1190` | Exploit Public-Facing Application | Research required | Research required | Yes | Yes | Internet-facing banking, payment, VPN and third-party systems can provide scalable access | WAF, application, vulnerability, reverse-proxy, EDR and authentication logs | Correlate exploitation attempts with child processes, new files, web shells or privileged logins |
| `T1505.003` | Server Software Component: Web Shell | Research required | Research required | Yes | Yes | Web shells can provide persistent access to exposed or third-party servers | Web access, file-integrity, process, EDR and application logs | Hunt for newly created server-side scripts and web-server processes spawning shells |
| `T1195.002` | Supply Chain Compromise: Compromise Software Supply Chain | Yes | Research required | Research required | Yes | A compromised provider, package or deployment process can expose many downstream financial organisations | Vendor-risk, CI/CD, package, code-signing, deployment, integrity and endpoint logs | Detect unauthorised build changes, new dependencies, code-signing anomalies and downstream execution |
| `T1550.002` | Use Alternate Authentication Material: Pass the Hash | Research required | Research required | Research required | Yes | Enables lateral movement through Windows environments without plaintext passwords | Windows authentication, EDR, domain-controller and lateral-movement telemetry | Hunt for abnormal NTLM use, remote service creation and privileged logons from unusual hosts |

## Evidence Basis

### DPRK mappings

The initial DPRK mappings are based on:

- FBI reporting on the 2024 DMM Bitcoin theft;
- Google Threat Intelligence reporting on UNC4899 cloud and cryptocurrency intrusions;
- MITRE ATT&CK reporting on APT38 where historical bank-focused context is required.

### Scattered Spider / UNC3944 mappings

The current mappings are based on:

- Mandiant incident-response reporting on help-desk, Okta, SaaS, ADFS and virtualisation abuse;
- MITRE ATT&CK's current Scattered Spider group and campaign mappings;
- the FBI and international-partner advisory for current TTP context.

The rows describe behaviours across source-defined families of activity. They do not mean that every campaign or public alias used each technique.

## Current Limitations

- CL0P mappings remain incomplete and will not be marked until its profile is researched.
- Some technique mappings are analytical translations of source-described behaviour rather than labels explicitly printed by the publisher.
- Shared techniques are useful for control coverage but cannot independently establish actor identity.
- ATT&CK changes over time, so technique names and identifiers will be checked against the current version before the final project is marked complete.
