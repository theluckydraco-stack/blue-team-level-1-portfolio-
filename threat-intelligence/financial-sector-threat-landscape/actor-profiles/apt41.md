# APT41 Actor Profile

## Status

**Research in progress**

## Intelligence Relevance

APT41 is the starting point for this project because it is the actor assigned in the BTL1 threat-actor research activity. The purpose of this profile is not to copy every technique or malware family associated with the group. It is to identify the behaviours and campaigns that matter to a financial-sector SOC.

## Verified Baseline

| Field | Current finding |
|---|---|
| MITRE ATT&CK ID | `G0096` |
| Common associated names | Wicked Panda, Brass Typhoon, BARIUM |
| Activity observed since | At least 2012 |
| Broad assessment | China-linked state-sponsored espionage activity with separately documented financially motivated operations |
| Documented sectors | Includes finance, healthcare, telecommunications, technology, education, retail, gaming, and others |
| Current confidence | High confidence that the public APT41 cluster has documented espionage and financial activity; lower confidence should be used when mapping individual incidents or aliases without source-specific evidence |

## Research Questions

### 1. Identity and naming

- Which aliases are explicitly associated with APT41 by each source?
- Do the sources describe complete overlap or only partial overlap?
- Has the source changed its actor-naming convention?

### 2. Motivation

- Which campaigns are assessed as state-sponsored espionage?
- Which activities are assessed as financially motivated?
- Is the financial activity described as state-directed, tolerated, or conducted for personal gain?

### 3. Targeting

- Which financial organisations or financial processes have been targeted?
- Which countries and regions are documented?
- Is the evidence specific to European or Eastern European financial services, or only to finance globally?

### 4. Significant campaigns

Record at least three campaigns that explain how APT41 operates. At least one should be recent, one should demonstrate exploitation of public-facing infrastructure, and one should demonstrate the dual espionage/financial character.

| Campaign | Period | Target or sector | Initial access | Objective | Significant activity | Source | Confidence |
|---|---|---|---|---|---|---|---|
| APT41 DUST | 2023–2024 | Multiple global sectors | To be confirmed from source | Long-term access and data theft | Web shells, DUSTPAN/DUSTTRAP, BEACON, cloud-based exfiltration | MITRE and Mandiant | High |
| Global exploitation campaign | Jan–Mar 2020 | Included banking and finance | Exploitation of public-facing Citrix, Cisco, and Zoho systems | Broad access acquisition | Rapid exploitation of recently disclosed vulnerabilities | Mandiant | High |
| Dual espionage and cybercrime activity | Historical | Multiple sectors including finance and gaming | To be researched | Espionage and financial gain | To be researched | Mandiant | High |

## Financial-Sector Relevance

### Confirmed relevance

- MITRE lists finance among the sectors targeted by APT41.
- Mandiant documented banking and finance among the sectors targeted during the 2020 global exploitation campaign.

### Questions still requiring evidence

- Which specific financial institutions, payment systems, or financial processes have been publicly linked to APT41?
- Which activity has direct European or Eastern European relevance?
- Is APT41 a primary financial-sector threat in the selected geography, or mainly a comparison actor?

## Selected ATT&CK Techniques

Only techniques that help explain financial-sector risk or provide useful detection opportunities will be retained in the final profile.

| Technique ID | Technique | Observed procedure | Why it matters to a financial SOC | Required telemetry | Source |
|---|---|---|---|---|---|
| `T1190` | Exploit Public-Facing Application | APT41 has exploited vulnerable internet-facing applications, including Exchange, Citrix, Zoho, Log4j-affected applications, and other web applications | Internet-facing financial services and third-party systems are high-value entry points | WAF, reverse-proxy, application, vulnerability-management, EDR, and authentication logs | MITRE |
| `T1505.003` | Server Software Component: Web Shell | APT41 has deployed web shells for persistence and command execution | Web shells can provide quiet, long-term access to exposed servers | Web-server file changes, process creation, web access, EDR, and integrity-monitoring logs | MITRE |
| `T1078` | Valid Accounts | APT41 has used compromised credentials to access additional systems | Valid accounts can blend with normal employee or administrator activity | Identity-provider, VPN, Active Directory, cloud sign-in, and privileged-access logs | MITRE |
| `T1550.002` | Use Alternate Authentication Material: Pass the Hash | APT41 has used captured password hashes for lateral movement | Financial networks often contain privileged Windows infrastructure and segmented systems | Windows authentication, EDR, lateral-movement, and privileged-account telemetry | MITRE |
| `T1567.002` | Exfiltration Over Web Service: Exfiltration to Cloud Storage | APT41 DUST exfiltrated collected information to OneDrive | Legitimate cloud services may allow data theft to resemble normal traffic | Cloud access security, proxy, endpoint, Microsoft 365, and data-loss-prevention logs | MITRE |

## Detection and Threat-Hunting Questions

For each selected technique, the final report must answer:

1. What observable behaviour would exist?
2. Which data source records it?
3. What normal administrative behaviour could look similar?
4. What additional evidence would increase confidence?
5. What containment or escalation action should follow?

## Intelligence Gaps

- The degree to which public aliases overlap is source-dependent.
- Public reporting does not necessarily expose all victims or campaigns.
- APT41's relevance to Eastern European financial institutions needs to be compared with actors that have stronger direct regional targeting.
- Similar tools and techniques are used by many actors, so ATT&CK overlap alone cannot prove attribution.

## Authoritative Starting Sources

1. MITRE ATT&CK — APT41: https://attack.mitre.org/groups/G0096/
2. Mandiant — APT41: A Dual Espionage and Cyber Crime Operation: https://cloud.google.com/blog/topics/threat-intelligence/apt41-dual-espionage-and-cyber-crime-operation
3. Mandiant — This Is Not a Test: APT41 Initiates Global Intrusion Campaign Using Multiple Exploits: https://cloud.google.com/blog/topics/threat-intelligence/apt41-initiates-global-intrusion-campaign-using-multiple-exploits
4. Mandiant — APT41 Has Arisen From the DUST: https://cloud.google.com/blog/topics/threat-intelligence/apt41-arisen-from-dust
5. Mandiant — Does This Look Infected? APT41 Targeting U.S. State Governments: https://cloud.google.com/blog/topics/threat-intelligence/apt41-us-state-governments/
