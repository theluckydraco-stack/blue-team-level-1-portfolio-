# Silence — Historical Banking Operations

## Status

**Historical regional baseline complete**

## Reader Orientation

Silence is included because its campaigns show a different way to attack a bank: first learn how employees and banking systems operate, then imitate or manipulate those processes when the attackers understand them.

Terms used in this profile:

- **ATM control system:** software used by a bank to manage and monitor automated teller machines.
- **Card processing:** systems that authorise and record payment-card transactions.
- **Screen or video capture:** recording what an employee does on a computer so an attacker can learn workflows, applications and approval steps.
- **Lateral movement:** moving from the first compromised computer to other systems inside the organisation.

## Executive Assessment

MITRE ATT&CK describes Silence as a financially motivated actor that has targeted banks in Russia, Ukraine, Belarus, Azerbaijan, Poland, Kazakhstan and other countries since 2016. Documented targets included ATM environments, card-processing systems and the Russian Central Bank's Automated Workstation Client.

Silence is not ranked as a current 2023–2026 priority because its strongest detailed public reporting is historical. It remains important because it demonstrates **process reconnaissance**: attackers can watch employees, learn legitimate banking procedures and then reproduce those actions to steal money.

The central lesson is:

```text
Compromise an employee
        ↓
Observe how the bank works
        ↓
Steal credentials and map systems
        ↓
Reach ATM or payment infrastructure
        ↓
Perform the theft using knowledge of normal operations
```

## Identity and Alias Limitations

| Field | Current finding |
|---|---|
| MITRE ATT&CK ID | `G0091` |
| Associated name | Whisper Spider |
| First observed | June 2016 |
| Broad motivation | Direct financial theft |
| Main documented regions | Eastern Europe, post-Soviet states and later wider international targeting |
| Project role | Historical banking-process and regional comparison |

The name `Silence` refers to a research-defined activity cluster. It should not be treated as a proven legal organisation with a fixed membership list.

## Victimology and Financial Objective

MITRE lists Russia, Ukraine, Belarus, Azerbaijan, Poland and Kazakhstan among the main target locations. Kaspersky reported early attacks against mostly Russian banks, with infected organisations also identified in Malaysia and Armenia.

Group-IB later reported an expansion beyond the original regional focus. Its 2019 reporting described at least 16 newer bank campaigns, infections in more than 30 countries and confirmed theft increasing to approximately USD 4.2 million.

The public evidence supports a clear financial objective: gain persistent access to a bank, understand its internal systems and staff routines, then manipulate ATM or payment processes to obtain money.

## Distinctive Process-Reconnaissance Behaviour

Kaspersky reported that the attackers recorded the day-to-day activity on bank employees' computers to learn:

- which banking applications were used;
- how employees performed normal tasks;
- which systems controlled sensitive operations;
- what sequence of actions was required before money could be taken.

This is more than ordinary screen capture.

```text
Employee screen recording
        ↓
Knowledge of applications and procedures
        ↓
Understanding of trusted human workflow
        ↓
Ability to imitate authorised activity
```

**My assessment:** Silence treated human workflow as part of the target. The attackers did not only steal credentials; they learned what a legitimate operator would do after logging in.

**Confidence:** high for the documented observation behaviour; moderate when applying the same exact process to every Silence-labelled campaign.

## Typical Attack Path

```text
Spearphishing attachment
        ↓
Employee opens DOCX, CHM, LNK, ZIP or other malicious content
        ↓
PowerShell, JavaScript, VBS or a downloader establishes access
        ↓
Persistence and credential theft
        ↓
Network discovery and RDP or remote administration
        ↓
Screen and video capture of bank staff activity
        ↓
Access to ATM, card-processing or banking systems
        ↓
Fraudulent cash-out
```

Silence used both custom malware and modified public tools. MITRE documents PowerShell, PsExec-derived tools, Empire, RDP, RAdmin, Nmap and credential-dumping capability.

## Selected MITRE ATT&CK Behaviours

| Technique ID | Technique | Observed behaviour | Financial-sector importance | Required telemetry |
|---|---|---|---|---|
| `T1566.001` | Spearphishing Attachment | Malicious DOCX, CHM, LNK and ZIP attachments | Email remains the entry point into trusted internal banking networks | Email gateway, sandbox, endpoint and process logs |
| `T1218.001` | System Binary Proxy Execution: Compiled HTML File | Weaponised CHM files used to execute malicious content | Signed Windows components can be abused to make execution appear legitimate | Process creation, file provenance and command-line telemetry |
| `T1059.001` | PowerShell | PowerShell used to download and execute payloads | Script execution can blend with administration | PowerShell Script Block Logging, AMSI and EDR |
| `T1003.001` | OS Credential Dumping: LSASS Memory | A Mimikatz-based utility used to extract credentials | Stolen bank credentials enable access to privileged systems | EDR, LSASS access and credential-protection logs |
| `T1078` | Valid Accounts | Compromised accounts used to access additional systems | Valid accounts can make attacker actions resemble employee activity | Active Directory, VPN, IdP, RDP and application logs |
| `T1021.001` | Remote Services: RDP | RDP used for lateral movement | Remote sessions can reach administration and banking systems | RDP authentication, session and source-host logs |
| `T1113` | Screen Capture | Screenshots collected from victim systems | Reveals sensitive data, applications and employee procedures | EDR screen-capture indicators, process and file-creation logs |
| `T1125` | Video Capture | Employee activity recorded to observe day-to-day work | Allows attackers to learn operational procedures before theft | EDR, suspicious recording processes, file growth and outbound transfer logs |
| `T1072` | Software Deployment Tools | RAdmin used to control workstations and ATMs | Legitimate remote-management software can provide direct operational control | Remote-management inventory, session, service and network logs |
| `T1018` | Remote System Discovery | Nmap used to map the network and identify hosts | Attackers must locate ATM, payment and administration systems | Network-flow, EDR and scanning alerts |

## Detection and Threat-Hunting Priorities

1. CHM, LNK, archive or document attachments followed by script or command execution.
2. PowerShell launched by Office, HTML Help or unusual user processes.
3. LSASS access, credential dumping and unexpected use of Empire- or PsExec-like tooling.
4. RDP or remote-administration sessions from ordinary employee workstations.
5. Screen-recording or video-capture activity on systems used for financial operations.
6. Nmap or similar network scanning inside bank networks.
7. RAdmin or other remote-control tools interacting with ATM or payment systems.
8. Unusual transaction or ATM activity following a period of quiet internal reconnaissance.

The distinctive hunt hypothesis is:

> Did an attacker spend days or weeks learning how staff operate before the financial event occurred?

That question requires longer log retention than a search focused only on the final cash-out date.

## Defensive Priorities

- Filter and sandbox high-risk attachment formats, including CHM and LNK files.
- Enable PowerShell, process, RDP and remote-administration logging.
- Restrict screen-recording and remote-control software on financial workstations.
- Segment ATM and card-processing systems from employee networks.
- Use privileged-access workstations for sensitive banking administration.
- Monitor access patterns to financial applications, not only successful login events.
- Apply dual control to high-risk operational actions.
- Correlate cyber telemetry with ATM, card, fraud and physical cash-out evidence.
- Retain logs long enough to detect prolonged observation and reconnaissance.

## Leadership Implications

- **Attackers may study the organisation before stealing:** a quiet period can be active preparation rather than inactivity.
- **Employee workflow is sensitive information:** recorded screens and procedures can reveal how to bypass controls without exploiting more software.
- **Valid access can still be malicious:** the attacker may use real credentials and imitate normal operator actions.
- **Financial controls must resist knowledgeable insiders:** a criminal who has watched staff may understand approval processes almost as well as an employee.

## Current-Relevance Limitation

MITRE's Silence profile remains maintained, but its detailed public sources primarily describe activity from 2016–2019. I did not find strong authoritative public evidence showing that Silence should be ranked above the project's current 2023–2026 actor and attack-model profiles.

I therefore retain Silence as a historical Eastern European banking comparison and a durable lesson in process reconnaissance, not as a claim about the most active present-day threat.

## Sources

1. MITRE ATT&CK — Silence: https://attack.mitre.org/groups/G0091/
2. Kaspersky Securelist — Silence: a new Trojan attacking financial organizations: https://securelist.com/the-silence/83009/
3. Group-IB — Silence 2.0: Going Global: https://www.group-ib.com/resources/research-hub/silence-2-0-going-global/
4. Group-IB — Damage from Silence operations increases fivefold: https://www.group-ib.com/media-center/press-releases/silence-attacks/
