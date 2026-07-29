# DORA Operational Alignment

## Purpose

The Digital Operational Resilience Act (DORA) is an EU regulation for the financial sector that has applied since 17 January 2025.

This section does not claim that the portfolio is a legal compliance assessment. It shows how the threat-intelligence findings support operational questions that DORA makes important for financial organisations.

## The problem DORA addresses

Financial services depend on technology and third parties. A serious incident at a cloud provider, software vendor, identity platform or payment processor can interrupt several financial organisations at once.

```text
Shared ICT provider or platform
        ↓
Failure or compromise
        ↓
Several dependent financial services affected
        ↓
Potential sector-wide operational impact
```

DORA requires financial entities to treat digital operational resilience as a management and business-service responsibility rather than only an IT security task.

## 1. ICT risk management

### Project connection

The actor and campaign profiles identify the systems that repeatedly create material risk:

- cloud identity and SSO;
- SaaS applications;
- internet-facing MFT and ERP products;
- virtualisation and recovery infrastructure;
- payment and wallet workflows;
- developer and supplier access;
- customer-support platforms.

### Concrete operational questions

- Who owns each system and business service?
- Which identities can administer it?
- Which logs exist and how long are they retained?
- What would happen if the system were unavailable or untrustworthy?
- Which compensating controls exist when patching is not immediate?

## 2. ICT incident management and reporting

### Project connection

The campaign studies show that an incident may first appear as:

- an extortion email;
- a supplier notification;
- a help-desk reset;
- a customer fraud report;
- a DDoS outage;
- suspicious blockchain movement;
- a web-shell alert.

### Concrete operational questions

- What is the first known malicious event?
- Which critical or important business service is affected?
- What customer, transaction, availability or confidentiality impact occurred?
- Which third parties and regulators require notification?
- Can the organisation produce an accurate timeline from retained evidence?

## 3. Digital operational resilience testing

### Project connection

The detection specifications provide scenarios that can be tested safely:

- support-assisted identity takeover;
- SaaS data theft after MFA recovery;
- public-application exploitation followed by a web shell;
- supplier-held data exposure;
- DDoS degradation of customer services;
- payment diversion after mailbox compromise.

### Concrete operational questions

- Did the control prevent the action?
- Did the logs reach the SIEM?
- Did the alert contain enough context?
- Did teams escalate correctly?
- Did the critical service continue or recover within the expected period?
- Were supplier and regulator contacts available?

## 4. ICT third-party risk

### Project connection

MOVEit, Oracle EBS, the DMM Bitcoin wallet-provider compromise and the Coinbase support-insider case demonstrate different third-party paths:

```text
Vulnerable supplier software
Trusted developer access
Outsourced support access
Cloud or SaaS dependency
```

DORA states that financial entities remain responsible for ICT risk even when services are outsourced. It also requires attention to contractual arrangements, critical functions and concentration risk.

### Concrete operational questions

- Which suppliers support critical or important functions?
- What data and credentials can each supplier access?
- Which fourth parties or subcontractors are involved?
- Can the supplier provide timely logs and incident evidence?
- What are the contractual notification and audit rights?
- Is there a tested exit or continuity strategy?

In November 2025, the European Supervisory Authorities designated the first critical ICT third-party providers under the DORA oversight framework. The designation process considered systemic importance, support for critical functions and substitutability.

## 5. Information sharing

DORA permits financial entities to share cyber-threat information and intelligence within trusted communities when confidentiality, personal data and competition requirements are respected.

### Project connection

The project already records:

- source and confidence;
- observable facts and assessments;
- ATT&CK behaviours;
- TLP considerations;
- alias limitations;
- defensive relevance.

These are the elements required to share intelligence without turning it into an unqualified blocklist.

## Evidence package for a material incident

A financial organisation should be able to assemble:

```text
Incident timeline
Affected business service
Technical and business impact
Users, customers and third parties affected
Initial access and attacker behaviour
Containment and recovery actions
Decision and approval records
Supplier communications
Regulatory and law-enforcement references
Lessons and corrective actions
```

## Leadership takeaway

DORA does not make threat intelligence valuable because a report mentions an actor name. Threat intelligence is valuable when it helps management understand dependencies, test resilience, prioritise controls and make defensible incident decisions.

## Sources

- EUR-Lex — Regulation (EU) 2022/2554: https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX%3A32022R2554
- EUR-Lex — DORA summary and application date: https://eur-lex.europa.eu/legal-content/EN/LSU/?uri=CELEX%3A32022R2554
- European Banking Authority — Critical ICT third-party provider designations: https://www.eba.europa.eu/publications-and-media/press-releases/european-supervisory-authorities-designate-critical-ict-third-party-providers-under-digital
