# MISP Threat Intelligence Platform Lab

## Overview

In this BTL1 lab, I used a controlled MISP instance as a trainee Threat Intelligence Analyst to investigate ransomware, Turla activity, DDoS botnets and exploitation of Mitel MiVoice infrastructure.

The main value of the exercise was not simply finding answers inside MISP. It demonstrated how a Threat Intelligence Platform turns disconnected reports, indicators, malware information and ATT&CK mappings into structured intelligence that can support SOC triage, threat hunting, detection engineering, vulnerability response and executive reporting.

## Objective

I used MISP to practice:

- searching and filtering threat-intelligence events;
- pivoting from events to attributes, tags, galaxies and external references;
- extracting IOCs and malware characteristics;
- using MITRE ATT&CK context to understand adversary behaviour;
- enriching MISP data with external research;
- distinguishing directly actionable intelligence from high-volume background context;
- translating research findings into defensive actions.

## Tools and Sources

- MISP
- MITRE ATT&CK data embedded in MISP
- VirusTotal enrichment links provided through MISP
- Arctic Wolf Labs threat research
- Mitel security advisories
- public malware research referenced by MISP

The lab was completed in an isolated training environment. No live malicious files are included in this repository.

## Investigation 1: Ransomware Intelligence

I searched MISP for ransomware-related events and pivoted into specific LockBit and Babuk intelligence.

### LockBit

A recent LockBit event contained the domain:

```text
orangebronze[.]com
```

The event described it as Cobalt Strike command-and-control infrastructure.

Operationally, the important lesson is that an IOC is more useful when it carries context. A domain by itself is only an observable. Knowing that it was associated with C2 activity gives a SOC a reason to search DNS, proxy, firewall and endpoint telemetry for historical or current contact with the infrastructure.

The domain is defanged here because the repository is public.

### Babuk

The Babuk event contained a YARA rule that identified strings associated with the ransomware. One of the strings revealed the ransom-note filename:

```text
How To Restore Your Files.txt
```

This showed how CTI can contain more than network IOCs. YARA rules describe properties of files or memory that defenders can use to identify malware even when filenames, IP addresses or domains change.

Operationally, a SOC or malware analyst could use a validated YARA rule for threat hunting, malware triage or scanning collected files and memory. The rule should still be tested against benign data before production use because overly broad strings can generate false positives.

## Investigation 2: Turla and ATT&CK Context

I investigated MISP intelligence related to Turla, tracked by MITRE as G0010.

The ATT&CK Matrix for the investigated event showed highlighted techniques under the following high-level tactics:

- Persistence
- Privilege Escalation
- Collection

![MISP ATT&CK matrix showing highlighted Turla techniques](attack-matrix.jpg)

The event included behaviours such as Component Object Model Hijacking and Email Collection. I also pivoted through the Turla galaxy/tag relationship and found 16 MISP events carrying Turla-related context.

The oldest matching phishing event referenced the decoy document:

```text
Save the Date G20 Digital Economy Taskforce 23 24 October.pdf
```

### Operational meaning

This investigation demonstrated the difference between an IOC-centric view and a behaviour-centric view.

An IP address or hash may expire quickly. ATT&CK mappings help describe what the adversary is trying to achieve and how. That context can be used to:

- assess whether existing detections cover the observed techniques;
- identify required telemetry;
- create threat-hunting hypotheses;
- compare several campaigns attributed to the same actor;
- communicate attacker behaviour consistently between CTI, SOC and detection teams.

The galaxy/tag pivot was also important. Instead of treating each event as an isolated report, MISP allowed me to move from one event to other intelligence associated with the same actor.

## Investigation 3: DDoS and Botnet Intelligence

I investigated DDoS-related events, including booter infrastructure, CoalaBot and the Rhombus Linux botnet.

Filtering the relevant DDoS event showed 24 IP-address attributes.

A VirusTotal reference for CoalaBot identified the original filename:

```text
cla.exe
```

A filename alone is a weak detection indicator because attackers can rename binaries. It is more useful when combined with hashes, behavioural information, network destinations and malware-family context.

### Rhombus operational summary

The referenced Rhombus research described an ELF installer/dropper targeting Linux and IoT systems. The dropper extracts another ELF payload into `/tmp`, establishes persistence through a cron entry and executes the dropped bot client.

The bot client was reported to:

- listen locally on TCP/12645;
- call back to C2 at `209.126.69[.]167:2020`;
- receive command-and-control instructions;
- execute several DoS attack variations;
- support remote command execution;
- exchange encrypted configuration/command data.

The research also described persistence through:

```text
/etc/cron.hourly/0
```

Operationally, this gives defenders several independent hunting opportunities rather than only one IP block:

```text
Network telemetry
    -> outbound connection to known C2

Host telemetry
    -> suspicious ELF created under /tmp

Persistence telemetry
    -> unexpected cron.hourly entry

Process behaviour
    -> shell/remote-command execution from the bot process
```

This is an important defensive lesson: historical C2 infrastructure may become stale, but the combination of persistence, process, filesystem and network behaviours provides more resilient detection coverage.

Source used during the exercise: https://www.reddit.com/r/LinuxMalware/comments/fh3zar/memo_rhombus_an_elf_bot_installerdropper/

## Investigation 4: Mitel MiVoice and Lorenz Ransomware

The final investigation examined reporting that connected exploitation of Mitel MiVoice Connect infrastructure with Lorenz ransomware activity.

### Vulnerability

The exploited vulnerability was:

```text
CVE-2022-29499
```

Mitel states that the Service Appliance component of MiVoice Connect was vulnerable to remote code execution and lists MiVoice Connect 19.2 SP3 and earlier as affected, including earlier 14.2 versions.

CISA later added CVE-2022-29499 to the Known Exploited Vulnerabilities catalog and records that it is known to have been used in ransomware campaigns.

### Persistence artifact

Arctic Wolf reported a webshell used for persistence:

```text
Filename: pdf_import_export.php
SHA256: 07838ac8fd5a59bb741aae0cf3abf48296677be7ac0864c4f124c2e168c0af94
Path: /vhelp/pdf/en/
```

The webshell accepted a command supplied in a POST request and decoded it from three layers of Base64 before execution.

Arctic Wolf assessed with medium confidence that the webshell was placed during the original exploitation. The attackers then returned roughly a month later, interacted with the webshell, established reverse-shell/tunnelling activity with Chisel and pivoted further into the victim network. The investigation also documented FileZilla for exfiltration and BitLocker/Lorenz ransomware for encryption activity.

MISP's Lorenz ransomware galaxy described the group as active since at least February 2021.

### Operational meaning

This case demonstrates why security teams must monitor internet-facing and edge appliances as part of the enterprise attack surface.

The MiVoice appliance was not the final objective. It provided the initial foothold and a pivot point into the wider environment.

A defensive response would therefore include several layers:

- identify vulnerable MiVoice versions and patch/remediate them;
- search appliances for the reported webshell path, filename and hash;
- inspect historical network telemetry for suspicious reverse-shell or tunnelling activity;
- hunt for Chisel and related pivoting behaviour internally;
- investigate unusual credential access and lateral movement after appliance compromise;
- monitor data-transfer activity and encryption behaviour;
- avoid assuming that patching alone is sufficient if exploitation may already have occurred.

Sources:

- Arctic Wolf: https://arcticwolf.com/resources/blog/lorenz-ransomware-chiseling-in/
- Mitel advisory: https://www.mitel.com/support/security-advisories/mitel-product-security-advisory-22-0002
- CISA KEV: https://www.cisa.gov/known-exploited-vulnerabilities-catalog

## Analyst Observation: More Attributes Did Not Mean Better Intelligence

During the MiVoice investigation, I found that the event with fewer attributes surfaced the information I needed faster than the much larger event.

This was one of the most useful lessons from the lab.

A large intelligence event can contain extensive ATT&CK mappings, malware families, infrastructure, tags and relationships, but that does not automatically make it the best starting point for a specific question. The smaller event had a higher signal-to-noise ratio for the immediate investigation because it exposed the relevant reference and vulnerability information more directly.

Operationally, CTI analysts should optimize for relevance and decision value rather than raw data volume:

```text
More indicators != more useful intelligence

Useful intelligence = relevance + context + confidence + timeliness
```

This is also why a mature TIP should support filtering, tagging, scoring, correlation and analyst judgment instead of simply accumulating as many feeds and attributes as possible.

## What MISP Was Doing Operationally

This lab helped me understand MISP as an intelligence workbench rather than an IOC database.

| MISP capability | Operational purpose |
|---|---|
| Events | Group related intelligence into an investigation/campaign/report context |
| Attributes | Store individual observables such as domains, hashes, filenames and IPs |
| Tags | Add classification, source and handling context |
| Galaxies | Represent structured knowledge about actors, malware and ATT&CK concepts |
| ATT&CK Matrix | Translate event data into adversary behaviours and detection priorities |
| External references | Pivot from structured CTI into the underlying research/report |
| Filtering | Reduce noise and locate the subset relevant to the analyst's question |
| Correlation | Connect the same or related intelligence across multiple events |
| Enrichment | Add reputation, malware or infrastructure context from external systems |

The workflow can be summarized as:

```text
Management question / intelligence requirement
                    |
                    v
              Search MISP
                    |
          Filter and pivot context
                    |
        +-----------+-----------+
        |                       |
      IOCs                    TTPs
        |                       |
        v                       v
 SIEM / EDR hunts       ATT&CK / detections
        |                       |
        +-----------+-----------+
                    |
                    v
             Defensive action
```

## Skills Demonstrated

- MISP event and attribute investigation
- threat-intelligence search and filtering
- IOC extraction and defanging
- MISP Galaxy and tag pivoting
- MITRE ATT&CK interpretation
- external-source enrichment
- YARA-rule interpretation
- malware and botnet research
- vulnerability-intelligence analysis
- C2 and persistence identification
- ransomware intrusion analysis
- intelligence triage and signal-to-noise assessment
- translating CTI into detection and response opportunities

## Outcome

The lab demonstrated how a TIP can connect strategic questions such as ransomware risk or service availability to tactical evidence such as domains, hashes, malware behaviours, vulnerabilities and C2 infrastructure.

The strongest lesson was that threat intelligence is valuable only when it changes a defensive decision. The useful output was not simply a list of answers: it was the ability to move from MISP data to a hunt, detection requirement, remediation action or management assessment.

This lab also provides practical MISP experience that can later feed into my financial-sector threat-informed detection work, where MISP can act as the CTI input layer for ATT&CK mapping and validated SIEM detection development.

## Safety Note

All investigation activity was performed in the controlled BTL1 training environment or against public threat-intelligence reporting. Malicious domains and IP addresses are defanged where appropriate, no credentials are published, and no malware samples are stored in this repository.
