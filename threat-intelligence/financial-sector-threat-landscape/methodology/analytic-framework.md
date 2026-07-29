# Analytic Framework

## Purpose

This framework prevents the project from becoming either a technical IOC list or an unsupported geopolitical narrative. It connects technical evidence to actor objectives and business implications while preserving uncertainty.

## The Connection Ladder

For every important incident or campaign, I will work through six levels.

### 1. Technical observation

What was directly observed?

Examples:

- A vulnerable public-facing application was exploited.
- A web shell was created.
- A cloud-storage service was used for exfiltration.
- A help desk reset an attacker's MFA device.

### 2. Victim and asset context

What was targeted, and why might that asset matter?

Examples:

- Hotel reservation records can reveal travel plans and associated individuals.
- Telecom call records can support surveillance and relationship mapping.
- SaaS identity systems can provide access to many connected applications.
- Managed file-transfer products can contain data from many downstream organisations.

### 3. Campaign context

Was the activity isolated, or did it match a wider pattern involving similar targets, timing, infrastructure, tools or procedures?

### 4. Source assessment

What does the publisher assess about motivation, sponsorship or attribution? This must be attributed to the source rather than presented as an independently proven fact.

### 5. My assessment

What conclusion is supported when the evidence is considered together? The assessment must include confidence and alternative explanations.

### 6. Decision relevance

What should a SOC, threat-intelligence team, risk owner or executive understand or do differently?

## Evidence Labels

Each important statement will be labelled conceptually as one of the following:

- **Observed fact:** Directly reported technical or victim evidence.
- **Official allegation or attribution:** A government or law-enforcement statement, preserved with its legal status.
- **Publisher assessment:** A judgement made by the reporting intelligence organisation.
- **My assessment:** The conclusion developed for this project.
- **Intelligence gap:** Information required to improve the judgement.

## Confidence Scale

### High confidence

Multiple reliable sources or strong direct evidence support the judgement, and credible alternatives are limited.

### Moderate confidence

The judgement is supported by credible evidence, but important gaps or plausible alternatives remain.

### Low confidence

The evidence is limited, indirect, contested or heavily dependent on assumptions.

Confidence describes the quality of the judgement, not the severity of the threat.

## Attribution Safeguards

- Shared malware or ATT&CK techniques do not prove common ownership.
- Infrastructure location does not prove an attacker's nationality.
- A victim's geopolitical relevance does not by itself prove state tasking.
- Vendor aliases may overlap only partially.
- Publicly charged individuals must not be described as convicted unless a reliable source confirms conviction.
- Intelligence reporting may connect activity to a government interest without establishing the exact command chain.

## Strategic Context Questions

For each actor or campaign, I will ask:

1. Why was this victim or asset valuable?
2. Why might the activity have occurred at that time?
3. Did the targeting align with an economic, diplomatic, military, political or criminal objective?
4. Were specific people, organisations, events or dependencies involved?
5. What alternative explanation could fit the evidence?
6. What does the connection change for defenders or decision-makers?

## Technical Translation Questions

For every selected ATT&CK technique:

1. What observable behaviour would exist?
2. Which logs or telemetry would record it?
3. What legitimate activity might look similar?
4. What supporting evidence would increase confidence?
5. What containment, escalation or hardening action should follow?

## Required Actor-Profile Sections

Each profile will contain:

1. Executive assessment
2. Identity and alias limitations
3. Motivation and strategic context
4. Victimology and timing
5. Real-world connections
6. Significant campaigns
7. Selected ATT&CK behaviours
8. Detection and hunting opportunities
9. Business and leadership implications
10. Alternative hypotheses, intelligence gaps and confidence
11. Sources

## Output Standard

The finished project must allow a technical reader to understand how the intrusion worked and a non-technical reader to understand why it mattered.