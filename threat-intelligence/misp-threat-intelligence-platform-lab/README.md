# MISP Threat Intelligence Platform Lab

## Why I built this project

This BTL1 lab was not documented as a list of quiz answers. I used it to answer a more operational question:

> **Given a security question or possible incident, how do I use a Threat Intelligence Platform to locate relevant intelligence, pivot through related evidence, validate it against external sources, and convert it into defensive action?**

I used a controlled MISP instance to investigate ransomware, Turla activity, DDoS botnets, and exploitation of Mitel MiVoice infrastructure.

The purpose of the project is to show the workflow a Threat Intelligence Analyst or SOC analyst could follow when an investigation begins with an incomplete question such as:

- "We saw a domain associated with LockBit. What does it mean and what should we search internally?"
- "This campaign is attributed to Turla. What behaviours should our detection team care about?"
- "A Linux host may be part of a DDoS botnet. What indicators and host behaviours can we hunt for?"
- "We run MiVoice. A ransomware report says it was exploited. Are we exposed, and what evidence of compromise should we look for?"

The key lesson was that MISP is useful when it helps move from **question -> intelligence -> validation -> defensive decision**.

## Investigation workflow

I followed the same basic method across the four tasks:

```text
Security question / incident lead
            |
            v
        Search MISP
            |
            v
   Identify relevant event
            |
            v
Filter attributes and context
            |
      +-----+------+
      |            |
     IOCs         TTPs
      |            |
      v            v
External refs   ATT&CK / Galaxies
      |            |
      +-----+------+
            |
            v
 Validate and add context
            |
            v
 Ask what defenders can do
            |
   +--------+---------+
   |        |         |
  Hunt    Detect    Remediate
 SIEM/EDR  Rules    Patch/Block
```

MISP supplied the structured intelligence and relationships. External reporting supplied the deeper technical context needed to understand what the indicators actually meant.

## Tools and sources

- MISP
- MITRE ATT&CK data embedded in MISP
- VirusTotal enrichment links provided through MISP
- Arctic Wolf Labs threat research
- Mitel security advisories
- CISA Known Exploited Vulnerabilities information
- public malware research referenced by MISP

The lab was completed in an isolated training environment. No live malicious files are stored in this repository.

---

# Investigation 1: Ransomware intelligence

## Security question

The organisation is concerned about ransomware. If a SOC receives ransomware-related threat intelligence, what information in MISP can be converted into an internal hunt or detection opportunity?

## How I used MISP

I searched MISP for ransomware-related events and then narrowed the investigation to LockBit and Babuk.

For LockBit, I moved from the event into its network attributes. For Babuk, I examined the event's malware-detection content rather than focusing only on IP addresses or domains.

## LockBit finding

The event contained the domain:

```text
orangebronze[.]com
```

MISP described the domain as Cobalt Strike command-and-control infrastructure.

### Operational meaning

A domain alone is only an observable. The C2 context changes what a defender can do with it.

If this intelligence were relevant to an active incident, I would use it to search:

- DNS logs for systems that resolved the domain;
- proxy/firewall telemetry for connections to the infrastructure;
- EDR telemetry for the process responsible for the connection;
- historical SIEM data to determine whether the activity pre-dated the alert.

The workflow becomes:

```text
MISP IOC
orangebronze[.]com
        |
        v
Context: Cobalt Strike C2
        |
        v
Search internal DNS / proxy / EDR
        |
        v
Identify affected host and user
        |
        v
Escalate to incident investigation if observed
```

This demonstrates the difference between simply possessing an IOC and **operationalising** it.

## Babuk finding

The Babuk event contained a YARA rule with strings associated with the ransomware. One of those strings revealed the ransom-note filename:

```text
How To Restore Your Files.txt
```

### Operational meaning

The important finding was not the filename itself. It was that threat intelligence can contain **detection logic**, not only IPs, domains and hashes.

A validated YARA rule could support:

- malware triage;
- file-system hunting;
- memory or forensic scanning;
- retrospective searches against collected samples.

The rule would still need to be tested against benign data before production use because broad strings can create false positives.

This was the first clear example in the lab of intelligence becoming a detection capability rather than remaining a static report.

---

# Investigation 2: Turla and ATT&CK context

## Security question

If an investigation is linked to a known threat actor, how can MISP help move from the actor name to behaviours that the SOC can actually hunt or detect?

## How I used MISP

I investigated an event associated with Turla, tracked by MITRE as G0010.

I used the ATT&CK Matrix to understand the behaviours represented in the event, then pivoted through the Turla Galaxy/tag relationship to find other events associated with the same actor.

The ATT&CK Matrix highlighted techniques under:

- Persistence
- Privilege Escalation
- Collection

![MISP ATT&CK matrix showing highlighted Turla techniques](attack-matrix.jpg)

The event included behaviours such as Component Object Model Hijacking and Email Collection.

I then used the Turla relationship to identify 16 associated MISP events and opened the oldest matching phishing event. That event referenced the decoy document:

```text
Save the Date G20 Digital Economy Taskforce 23 24 October.pdf
```

## Operational meaning

This investigation showed why CTI should not stop at attribution.

Knowing that an event is "Turla" does not by itself give the SOC a detection. ATT&CK context helps translate actor intelligence into behaviour that defenders can assess.

For each mapped technique, a detection team can ask:

```text
Do we collect the telemetry required to see this behaviour?
                |
                v
Do we already have a detection for it?
                |
        +-------+-------+
        |               |
       Yes              No
        |               |
Validate coverage   Build / tune detection
```

The Galaxy pivot also demonstrated why MISP is more useful than an isolated PDF or IOC list. I could move from one event to a wider body of intelligence related to the same actor and compare activity across campaigns.

This supports:

- threat-hunting hypotheses;
- ATT&CK coverage reviews;
- detection engineering;
- campaign comparison;
- incident scoping.

---

# Investigation 3: DDoS and botnet intelligence

## Security question

If a company is concerned that one of its systems may have been compromised and turned into a DDoS bot, what intelligence can help confirm or disprove that hypothesis?

## How I used MISP

I investigated DDoS-related events covering booter infrastructure, CoalaBot and the Rhombus Linux botnet.

Filtering the relevant DDoS event showed 24 IP-address attributes.

A VirusTotal reference for CoalaBot identified the original filename:

```text
cla.exe
```

The filename is useful context, but it is a weak standalone indicator because an attacker can rename a binary. It becomes more useful when combined with hashes, network destinations and behavioural evidence.

## Rhombus finding

The Rhombus research referenced by MISP described an ELF installer/dropper targeting Linux and IoT systems.

The reported bot behaviour included:

- dropping/executing another ELF payload;
- persistence through a cron entry;
- listening locally on TCP/12645;
- callback to C2 at `209.126.69[.]167:2020`;
- receiving command-and-control instructions;
- several DoS attack variations;
- remote command execution.

The reported persistence location was:

```text
/etc/cron.hourly/0
```

Source used during the exercise:
https://www.reddit.com/r/LinuxMalware/comments/fh3zar/memo_rhombus_an_elf_bot_installerdropper/

## Operational meaning

If the security question is "Is this Linux host infected with Rhombus?", a mature hunt should not rely on one historical C2 address.

The intelligence creates several independent hypotheses:

```text
Network
  -> outbound connection to known C2

Filesystem
  -> unexpected ELF payload under /tmp

Persistence
  -> suspicious /etc/cron.hourly/0 entry

Process/network behaviour
  -> listener on TCP/12645

Execution
  -> shell or remote-command activity associated with the bot
```

A historical IP may become stale. A combination of filesystem, persistence, process and network evidence gives the defender more resilient coverage.

This is the practical difference between **IOC matching** and **behaviour-informed detection**.

---

# Investigation 4: Mitel MiVoice and Lorenz ransomware

## Security question

This was the investigation that most closely resembled a real incident-response intelligence request:

> **"We use MiVoice and reporting says it has been abused in ransomware attacks. Are we affected, what should we patch, and what evidence would tell us exploitation has already occurred?"**

## How I used MISP

I searched for MiVoice-related events.

An important observation was that the event with fewer attributes gave me the relevant vulnerability and external reference faster than the much larger event. I then used the larger event for broader ATT&CK, malware and campaign context.

That became a useful lesson in intelligence triage: the largest event is not automatically the most useful event for the question being asked.

## Vulnerability finding

The exploited vulnerability was:

```text
CVE-2022-29499
```

The affected MiVoice Connect versions included:

```text
19.2 SP3 and earlier
```

including earlier 14.2 releases.

Mitel subsequently released MiVoice Connect R19.3 to remediate the vulnerability.

## Persistence finding

The Arctic Wolf report linked from MISP described a webshell used for persistence:

```text
Filename: pdf_import_export.php
Path: /vhelp/pdf/en/
SHA256: 07838ac8fd5a59bb741aae0cf3abf48296677be7ac0864c4f124c2e168c0af94
```

The webshell accepted a command through a POST request and decoded the supplied value from three layers of Base64 before execution.

The report described attackers returning roughly a month after the initial compromise, interacting with the webshell, establishing reverse-shell/tunnelling activity with Chisel and moving further into the victim environment.

MISP's Lorenz ransomware Galaxy described the group as active since at least February 2021.

## Operational meaning

The most important defensive conclusion was that **patching and compromise assessment are different tasks**.

If an organisation discovers that it runs a vulnerable MiVoice version, the first action is to remediate the vulnerability. But if exploitation may already have occurred, patching alone does not prove the environment is clean.

A defensive workflow would be:

```text
Do we run MiVoice Connect?
        |
        v
Is the deployed version vulnerable?
        |
       Yes
        |
        v
Patch / remediate
        |
        v
Assume historical exploitation is possible
        |
        v
Search for persistence artifacts
        |
        +--> pdf_import_export.php
        +--> reported SHA256
        +--> /vhelp/pdf/en/
        |
        v
Inspect historical network activity
        |
        +--> reverse shells
        +--> Chisel / tunnelling
        +--> unusual outbound connections
        |
        v
Hunt for post-compromise activity
        |
        +--> credential access
        +--> lateral movement
        +--> data transfer
        +--> encryption activity
```

The MiVoice appliance was an initial foothold and pivot point, not the attacker's final objective.

Sources:

- Arctic Wolf: https://arcticwolf.com/resources/blog/lorenz-ransomware-chiseling-in/
- Mitel advisory: https://www.mitel.com/support/security-advisories/mitel-product-security-advisory-22-0002
- CISA KEV: https://www.cisa.gov/known-exploited-vulnerabilities-catalog

---

# Analyst observation: more attributes did not mean better intelligence

During the MiVoice investigation, the smaller event led to the answer faster than the larger event.

The larger event contained extensive ATT&CK mappings, malware relationships, tags and other context. That context was valuable later, but it was not the fastest route to answering the immediate question about the vulnerability and affected versions.

This changed how I think about TIP data:

```text
More indicators != more useful intelligence

Useful intelligence =
relevance + context + confidence + timeliness + actionability
```

A CTI analyst should not optimise for the largest event or the largest number of feeds. The objective is to find the evidence that best answers the current intelligence requirement and then add only the context needed to make a decision.

---

# What MISP contributed operationally

This lab helped me understand MISP as an intelligence workbench rather than an IOC database.

| MISP capability | What it meant during an investigation |
|---|---|
| Events | Gave me a campaign/report/incident context to investigate |
| Attributes | Exposed individual observables such as domains, hashes, filenames and IPs |
| Filtering | Reduced large events to the subset relevant to the current question |
| Tags | Added classification and handling context |
| Galaxies | Let me pivot through structured knowledge about actors and malware |
| ATT&CK Matrix | Converted report content into adversary behaviours that detection teams can reason about |
| External references | Took me from structured MISP data to the original technical research |
| Correlation | Connected related intelligence across events |
| Enrichment | Added reputation, malware or infrastructure context from other systems |

The operational chain I took from the lab is:

```text
Security question
      |
      v
Locate intelligence in MISP
      |
      v
Filter and pivot relationships
      |
      v
Validate with original reporting
      |
      v
Extract IOC + behaviour + context
      |
      v
Translate into a defensive decision
      |
 +----+---------+---------+
 |              |         |
Hunt          Detect    Remediate
SIEM/EDR      Rules     Patch/Block
```

That is the central point of this portfolio entry.

---

# Skills demonstrated

- MISP event and attribute investigation
- threat-intelligence search and filtering
- IOC extraction and defanging
- MISP Galaxy and tag pivoting
- MITRE ATT&CK interpretation
- external-source validation and enrichment
- YARA-rule interpretation
- malware and botnet research
- vulnerability-intelligence analysis
- C2 and persistence identification
- ransomware intrusion analysis
- intelligence triage and signal-to-noise assessment
- translating CTI into SIEM/EDR hunts
- identifying detection requirements from attacker behaviour
- translating vulnerability intelligence into remediation and compromise-assessment actions

# Outcome

The lab demonstrated how I would use a TIP during a real security investigation: start with a concrete security question, locate the most relevant intelligence, pivot through its relationships, validate the evidence against original reporting, and determine what defenders should do next.

The output of CTI is therefore not the MISP event itself and not a list of twelve lab answers. The useful output is a changed defensive decision: **what to hunt, what to detect, what to patch, what to block, what to investigate, or what to report to management.**

This is also the model I plan to carry into my financial-sector threat-informed detection work, where MISP can act as the CTI input layer for ATT&CK mapping, telemetry selection and validated SIEM detection development.

## Safety note

All investigation activity was performed in the controlled BTL1 training environment or against public threat-intelligence reporting. Malicious domains and IP addresses are defanged where appropriate, no credentials are published, and no malware samples are stored in this repository.
