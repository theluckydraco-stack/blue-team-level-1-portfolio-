# Reader Guide

This project is written for both technical and non-technical readers. The following terms appear throughout the assessment.

## Threat actor and activity cluster

A **threat actor** is a person or group responsible for harmful cyber activity. An **activity cluster** is a set of related incidents tracked by researchers under a working name. Different security companies may use different names for partly overlapping activity, so the names are not treated as exact legal identities.

## Actor family

An **actor family** is a broad grouping used when several source-specific labels describe related operations. For example, public reporting on North Korean financial theft uses names such as APT38, TraderTraitor and UNC4899. I preserve the label used by each source instead of assuming they are identical.

## Extortion brand

An **extortion brand** is a public name used to threaten victims and publish stolen data. The brand may be used by changing operators or affiliates. `CL0P` is therefore treated as a brand and campaign label where appropriate, not automatically as one fixed team.

## Cloud identity

**Cloud identity** is the account, authentication and permission system used to access cloud and online services. Examples include Microsoft Entra ID and Okta. Compromising one identity can provide access to many connected applications.

## SaaS

**Software as a Service (SaaS)** is software accessed online and operated by a provider, such as Microsoft 365, Salesforce or Workday. Activity can occur entirely between cloud services, so traditional network monitoring may not see it.

## SSO and MFA

**Single sign-on (SSO)** lets one identity access several applications. **Multi-factor authentication (MFA)** requires an additional proof of identity, such as a security key or authenticator. Weak account-recovery processes can undermine both controls.

## Session token

A **session token** is a temporary digital credential showing that a user has already authenticated. If an attacker steals a valid token, they may be able to access a service without re-entering the password or completing MFA.

## Third-party and supply-chain risk

A **third party** is a supplier, service provider or technology partner trusted by the organisation. A **supply-chain compromise** uses that trusted relationship to reach downstream customers. The direct victim may be a vendor whose systems hold or process data for many financial organisations.

## Concentration risk

**Concentration risk** exists when many important business services or organisations depend on the same provider, product or platform. One failure or compromise can therefore create impact across several customers at the same time.

## Managed file transfer

A **managed file transfer (MFT)** platform is enterprise software used to exchange large or sensitive files with customers and partners. Compromising one MFT server can expose data belonging to many organisations.

## Enterprise resource planning

An **enterprise resource planning (ERP)** platform supports central business processes such as finance, procurement, payroll, suppliers and reporting. Oracle E-Business Suite is an ERP platform. A compromise may therefore expose both operational systems and high-value business records.

## Business email compromise

**Business email compromise (BEC)** is a fraud model in which an attacker impersonates or compromises a trusted business identity and uses that trust to redirect a payment, change supplier details or obtain sensitive information.

## Insider risk

**Insider risk** is the possibility that trusted access is misused intentionally, negligently, accidentally or after an account is compromised. It includes employees, contractors and outsourced support personnel.

## DDoS

A **distributed denial-of-service (DDoS) attack** uses traffic from many systems or services to make a target unavailable or slow. In finance, it can interrupt online banking, payment APIs, customer authentication or trading services.

## Zero-day vulnerability

A **zero-day** is a software vulnerability exploited before a defensive patch is publicly available. Organisations may have little or no warning before active attacks begin.

## Web shell

A **web shell** is a malicious script placed on a web server that lets an attacker run commands or retrieve data remotely. It can resemble a normal application file and provide persistent access after the original vulnerability is patched.

## MITRE ATT&CK

**MITRE ATT&CK** is a public knowledge base that gives common names and identifiers to observed attacker behaviours. It helps defenders compare incidents, identify required logs and test detection coverage. Technique overlap does not prove that two incidents were caused by the same actor.

## Indicator and observable

An **observable** is something seen during an investigation, such as a domain, file hash or account. An **indicator** is an observable assessed as meaningfully associated with malicious activity. Not every artifact should automatically be treated as an IOC.

## Telemetry and threat hunting

**Telemetry** is the security-relevant data produced by systems, including identity, endpoint, application, cloud and network logs. **Threat hunting** is the proactive search for suspicious behaviour that may not have generated an alert.

## Detection specification

A **detection specification** describes the behaviour to identify, required data, correlation logic, expected false positives, investigation steps and validation method. It is broader than a single SIEM query.

## SIEM and Sigma

A **security information and event management (SIEM)** platform collects and analyses security logs. **Sigma** is a generic detection-rule format that can be converted into queries for different SIEM platforms, but the rule still requires field mapping, tuning and testing.

## MISP

**MISP** is an open-source threat-intelligence and sharing platform. It can store indicators, reports, ATT&CK behaviours, relationships, analyst opinions and sharing restrictions.

## STIX and TAXII

**STIX** is a structured model for representing cyber-threat information. **TAXII** is a protocol for exchanging CTI, including STIX content, between systems.

## RDAP and WHOIS

**RDAP** is the current structured protocol for accessing domain-registration data. For generic top-level domains, it became the definitive source in January 2025 in place of sunsetted WHOIS services.

## TLP

The **Traffic Light Protocol (TLP)** states who may receive information. TLP 2.0 uses `TLP:RED`, `TLP:AMBER`, `TLP:GREEN` and `TLP:CLEAR`. `TLP:WHITE` is deprecated.

## DORA

The **Digital Operational Resilience Act (DORA)** is an EU regulation applying to the financial sector since 17 January 2025. It addresses ICT risk management, incidents, resilience testing, third-party risk and information sharing.

## Confidence

Confidence describes how strongly the available evidence supports an assessment:

- **High:** strong direct evidence or several reliable sources with few credible alternatives.
- **Moderate:** credible evidence exists, but important gaps or alternative explanations remain.
- **Low:** evidence is limited, indirect or disputed.

Confidence does not describe how severe the threat is.
