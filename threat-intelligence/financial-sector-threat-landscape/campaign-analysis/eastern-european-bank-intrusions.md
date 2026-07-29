# Historical Eastern European Bank Intrusions

## Purpose

This comparison explains how Cobalt Group and Silence moved from an ordinary employee compromise into the specialised systems that operate a bank.

These actors are historical comparisons rather than the project's highest current priorities. Their value is that they make one principle concrete:

> A bank is not protected merely because the payment system itself was not directly exposed to the internet. An attacker may enter through email, learn the environment and reach the money-moving process from inside.

## Concepts

- **SWIFT-connected environment:** systems used to prepare or send financial-transfer messages through the SWIFT network.
- **ATM logical attack:** remotely manipulating ATM software or its management systems instead of physically damaging the machine.
- **Cash-out:** converting unauthorised digital access into money through ATM dispensing, fraudulent transfers, account manipulation or money mules.
- **Process reconnaissance:** observing staff and systems to learn how legitimate financial operations are performed.

## Comparison

| Question | Cobalt Group | Silence |
|---|---|---|
| Primary objective | Direct theft from banks and financial systems | Direct theft after learning bank operations |
| Common initial access | Spearphishing attachments and links | Spearphishing attachments, including DOCX, CHM, LNK and ZIP files |
| Internal activity | Credential theft, network discovery, remote administration and lateral movement | Credential theft, network discovery, RDP, screen capture and video recording |
| Financial systems targeted | ATM control, card processing, electronic payment and SWIFT-connected systems | ATM, card-processing and banking workstation environments |
| Distinctive behaviour | Coordinated manipulation of money-moving systems and cash-out networks | Watching employee activity to understand legitimate procedures before theft |
| Wider criminal support | Cash collectors, mule accounts and laundering infrastructure | Cash-out participants and operational support inferred from theft activity |
| Strongest public reporting period | Mainly 2016–2020 | Mainly 2016–2019 |

## Shared Attack Path

```text
Phishing email reaches a bank employee
        ↓
Malicious content runs on an ordinary workstation
        ↓
Credentials are stolen and the internal network is mapped
        ↓
The attacker uses legitimate remote-access methods
        ↓
ATM, card, payment or banking systems are identified
        ↓
The attacker performs or imitates an authorised financial action
        ↓
Money is collected, transferred or laundered
```

The important point is that the first compromised user may not work directly with SWIFT or ATMs. The workstation is valuable because it provides a trusted position inside the organisation.

## What Cobalt Group Adds to the Picture

Europol described a syndicate associated with Carbanak and Cobalt attacks that reached more than 100 financial institutions in over 40 countries and caused losses exceeding EUR 1 billion. The reported cash-out methods included remote ATM dispensing, fraudulent electronic transfers and account-balance manipulation.

This demonstrates a complete criminal operation:

```text
Technical intrusion
        +
Knowledge of bank infrastructure
        +
Fraudulent financial instruction
        +
Cash collectors and money mules
        +
Money laundering
```

A SOC that investigates only the malware may miss the wider fraud network and the financial evidence that confirms the attacker's objective.

## What Silence Adds to the Picture

Kaspersky reported that Silence recorded employee activity to learn how bank staff used applications and performed daily operations.

This makes the threat comparable to a criminal secretly watching a cashier for several days before attempting to imitate the cashier's actions.

```text
Screen and video capture
        ↓
Knowledge of normal employee behaviour
        ↓
Ability to choose the correct application and sequence
        ↓
Malicious activity that resembles authorised work
```

This is why behaviour baselines, dual control and transaction verification matter. A valid account performing a familiar sequence can still be controlled by an attacker.

## Financial-Sector Detection Priorities

### Email and endpoint

- Office, CHM or archive files followed by PowerShell, command shells or scripts.
- Credential-dumping access to LSASS.
- Nmap, PsExec, Empire, Cobalt Strike or similar tools on employee systems.
- Unapproved TeamViewer, Ammyy Admin, RAdmin or other remote-control software.

### Identity and movement

- RDP sessions from user workstations to administration or payment segments.
- Privileged logins from new hosts or outside approved maintenance periods.
- Repeated failed access followed by successful use of a privileged account.

### Banking applications and transactions

- ATM commands outside approved operational windows.
- Changes to account balances or transaction records without a matching business request.
- Unusual SWIFT or payment instructions, beneficiary changes or approval-path deviations.
- Large or coordinated ATM cash withdrawals following internal security anomalies.

### Process reconnaissance

- Screen- or video-recording software on sensitive workstations.
- Long periods of internal discovery before the financial event.
- Repeated access to procedures, manuals, network diagrams or staff activity without a clear business reason.

## Controls That Address Both Models

1. Segment employee, administration, payment, ATM, card-processing and SWIFT environments.
2. Require privileged access through hardened administrative workstations and recorded sessions.
3. Apply dual control to high-risk payments, ATM management and balance changes.
4. Restrict and inventory remote-administration tools.
5. Correlate email, endpoint, identity, application, transaction, ATM and anti-money-laundering data.
6. Retain logs long enough to identify reconnaissance that occurred before the theft.
7. Test whether an attacker on a normal employee workstation can reach money-moving systems.
8. Design fraud controls to detect an attacker who understands normal employee procedures.

## Relevance to the Current Project

Cobalt Group and Silence do not displace the project's higher-priority 2023–2026 profiles. The strongest public reporting for both is older, while DPRK financial theft, identity-led SaaS compromise and enterprise-software mass exploitation have clearer recent evidence.

Their continuing value is behavioural:

- Cobalt Group shows the complete path from phishing to organised cash-out.
- Silence shows why observing employees and business processes can be as valuable as stealing passwords.
- Both show that cyber defence and fraud defence must operate as one investigation capability.

## Sources

1. MITRE ATT&CK — Cobalt Group: https://attack.mitre.org/groups/G0080/
2. Europol — Mastermind behind EUR 1 billion cyber bank robbery arrested in Spain: https://www.europol.europa.eu/media-press/newsroom/news/mastermind-behind-eur-1-billion-cyber-bank-robbery-arrested-in-spain
3. MITRE ATT&CK — Silence: https://attack.mitre.org/groups/G0091/
4. Kaspersky Securelist — Silence: a new Trojan attacking financial organizations: https://securelist.com/the-silence/83009/
5. Group-IB — Silence 2.0: Going Global: https://www.group-ib.com/resources/research-hub/silence-2-0-going-global/
