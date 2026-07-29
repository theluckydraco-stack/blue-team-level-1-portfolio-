# Cobalt Group — Historical Eastern European Banking Threat

## Status

**Historical regional baseline complete**

## Reader Orientation

Cobalt Group is included because it is one of the clearest public examples of a cybercriminal operation built specifically around stealing money from financial institutions.

Terms used in this profile:

- **SWIFT:** a messaging network banks use to send payment instructions. Compromising a SWIFT-connected environment can allow an attacker to create or alter fraudulent transfer instructions.
- **Card processing:** the systems that authorise, route and record payment-card transactions.
- **Logical ATM attack:** remotely manipulating the software or systems controlling ATMs rather than physically breaking the machine.
- **Money mule:** a person or account used to receive, withdraw or move stolen funds.

## Executive Assessment

MITRE ATT&CK describes Cobalt Group as a financially motivated threat group that has primarily targeted financial institutions since at least 2016. Documented targets included ATM systems, card processing, payment systems and SWIFT-connected environments, with strong activity against banks in Eastern Europe, Central Asia and Southeast Asia.

The group is not ranked as a current 2023–2026 priority because the strongest public incident reporting is historical. It remains highly relevant as a behavioural case study because it shows how attackers move from one employee workstation into the specialised systems that actually move money.

The central lesson is:

```text
Phishing email to a bank employee
        ↓
Control of an internal workstation
        ↓
Discovery of payment and ATM systems
        ↓
Remote control of money-moving infrastructure
        ↓
Coordinated cash-out and laundering
```

## Identity and Alias Limitations

| Field | Current finding |
|---|---|
| MITRE ATT&CK ID | `G0080` |
| Associated names | GOLD KINGSWOOD, Cobalt Gang, Cobalt Spider |
| Broad motivation | Direct financial theft |
| Primary historical targets | Banks and other financial institutions |
| Main documented regions | Eastern Europe, Central Asia and Southeast Asia |
| Project role | Historical Eastern European banking comparison |

Public reporting sometimes connects Cobalt Group with Carbanak malware or the separately tracked Carbanak group. MITRE treats these as possible links rather than exact proof that every name, tool and operator represents one permanent organisation.

## Real-World Financial Impact

Europol reported in March 2018 that the criminal syndicate associated with Carbanak and Cobalt attacks had infiltrated more than 100 financial institutions in over 40 countries and caused cumulative losses exceeding EUR 1 billion. Europol stated that individual Cobalt-enabled robberies could reach approximately EUR 10 million.

Europol described three cash-out methods:

1. remotely instructing ATMs to dispense cash while collectors waited nearby;
2. using electronic-payment networks to transfer money to criminal accounts;
3. changing account-balance records so money mules could withdraw inflated balances.

The operation therefore depended on more than malware. It required technical operators, knowledge of banking systems, cash collectors, mule accounts and money-laundering infrastructure.

## Victim Selection and Business Logic

Cobalt Group did not target banks merely because they held valuable files. It targeted the systems and employees involved in moving money.

```text
Employee workstation
        ↓
Administrative access and network knowledge
        ↓
ATM, card-processing or payment system
        ↓
Fraudulent instruction
        ↓
Cash-out network
```

**My assessment:** the actor's success came from combining intrusion capability with an understanding of banking operations. The final theft often depended on recognising which systems authorised transactions, when staff were present, how ATM networks were controlled and how stolen funds could be collected.

**Confidence:** high for the documented attack model; moderate when assigning every Carbanak- or Cobalt-labelled incident to one exact membership structure.

## Typical Attack Path

MITRE and Europol reporting supports the following recurring model:

```text
Spearphishing attachment or link
        ↓
Employee executes malicious content
        ↓
PowerShell, JavaScript, macros or exploitation establish access
        ↓
Credential theft and internal network discovery
        ↓
Remote access and lateral movement using RDP, PsExec or similar tools
        ↓
Access to ATM, payment, card-processing or SWIFT-connected systems
        ↓
Fraudulent transfers, balance manipulation or remote ATM cash-out
```

The actor used both specialised malware and publicly available tools. That matters because ordinary administrative utilities can make malicious activity look similar to legitimate IT work.

## Selected MITRE ATT&CK Behaviours

| Technique ID | Technique | Observed behaviour | Financial-sector importance | Required telemetry |
|---|---|---|---|---|
| `T1566.001` | Spearphishing Attachment | Malicious documents and archives sent to bank employees | One user action can provide the first foothold inside a trusted financial network | Email gateway, attachment sandbox, endpoint and process logs |
| `T1204.002` | User Execution: Malicious File | Victims were persuaded to open files or enable content | The attack relies on normal employee behaviour | Endpoint process creation, Office child processes and user reports |
| `T1059.001` | PowerShell | PowerShell used to download or execute later stages | Scripting can blend with administration and automate compromise | PowerShell Script Block Logging, AMSI and EDR telemetry |
| `T1003.001` | OS Credential Dumping: LSASS Memory | Public tools such as Mimikatz were used to obtain credentials | Stolen credentials enable access to privileged banking systems | EDR, LSASS access, credential-protection and domain-controller logs |
| `T1021.001` | Remote Services: RDP | RDP used for lateral movement | Attackers can operate internal systems through legitimate remote access | RDP authentication, source-host, session and privileged-logon logs |
| `T1219` | Remote Access Tools | Ammyy Admin and TeamViewer used for remote control | Unapproved remote tools can provide persistent operator access | Software inventory, network, process and remote-support logs |
| `T1046` | Network Service Discovery | Network scanning used to map the environment | Attackers must locate payment, ATM and administration systems | Network-flow, EDR, firewall and scanning alerts |
| `T1195.002` | Compromise Software Supply Chain | Legitimate browser updates were reportedly compromised in one campaign | A trusted update path can expose additional financial victims | Software integrity, update, vendor-risk and endpoint logs |

## Detection and Threat-Hunting Priorities

1. Email attachments followed by Office applications spawning PowerShell, command shells or script interpreters.
2. Credential-dumping behaviour on employee or administrator workstations.
3. New RDP, PsExec, WinRM or remote-support activity between user networks and payment infrastructure.
4. Network scanning from ordinary workstations toward ATM, card-processing, SWIFT or database segments.
5. Unusual changes to ATM commands, payment instructions, account balances or settlement workflows.
6. Administrative access outside approved maintenance windows.
7. Coordinated technical anomalies followed by unusual cash withdrawals, mule-account activity or payment reversals.

A cyber alert should therefore be correlated with fraud and transaction evidence. An attacker may be technically visible in the SOC before the financial loss becomes visible to the fraud team—or the fraud anomaly may be the first sign of the intrusion.

## Defensive Priorities

- Segment ATM, payment, card-processing and SWIFT-connected systems from employee networks.
- Require privileged access through controlled administrative paths with strong authentication and session recording.
- Block or tightly control unapproved remote-access tools.
- Monitor Office-to-script execution and PowerShell behaviour.
- Apply dual control and independent verification to high-risk payment or ATM-management actions.
- Correlate SOC, fraud, payment, ATM and anti-money-laundering monitoring.
- Test whether compromise of one employee workstation can reach money-moving systems.
- Preserve application and transaction logs long enough to reconstruct the complete fraud chain.

## Leadership Implications

- **The target is the business process, not only the computer:** the attacker ultimately wants the system that authorises or releases money.
- **Cybercrime can require a physical network:** remote operators may depend on cash collectors, mule accounts and laundering specialists.
- **Segmentation limits financial impact:** an infected office workstation should not provide a path to ATM or payment control.
- **Fraud and cyber teams need one investigation picture:** technical compromise and suspicious transactions are parts of the same incident.

## Current-Relevance Limitation

MITRE's Cobalt Group page remains maintained, but the strongest public evidence cited for the group's core banking campaigns is concentrated in the 2016–2020 period. I did not find equally strong authoritative public reporting that justifies placing Cobalt Group above the project's current 2023–2026 profiles.

I therefore use Cobalt Group to explain a durable bank-specific attack model, not to claim that it is currently the most active threat to European finance.

## Sources

1. MITRE ATT&CK — Cobalt Group: https://attack.mitre.org/groups/G0080/
2. Europol — Mastermind behind EUR 1 billion cyber bank robbery arrested in Spain: https://www.europol.europa.eu/media-press/newsroom/news/mastermind-behind-eur-1-billion-cyber-bank-robbery-arrested-in-spain
3. Group-IB — Cobalt: Logical Attacks on ATMs: https://www.group-ib.com/resources/research-hub/cobalt-logical-attacks-on-atms/
