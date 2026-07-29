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

## Third-party and supply-chain risk

A **third party** is a supplier, service provider or technology partner trusted by the organisation. A **supply-chain compromise** uses that trusted relationship to reach downstream customers. The direct victim may be a vendor whose systems hold or process data for many financial organisations.

## Managed file transfer

A **managed file transfer (MFT)** platform is enterprise software used to exchange large or sensitive files with customers and partners. Compromising one MFT server can expose data belonging to many organisations.

## Enterprise resource planning

An **enterprise resource planning (ERP)** platform supports central business processes such as finance, procurement, payroll, suppliers and reporting. Oracle E-Business Suite is an ERP platform. A compromise may therefore expose both operational systems and high-value business records.

## Zero-day vulnerability

A **zero-day** is a software vulnerability exploited before a defensive patch is publicly available. Organisations may have little or no warning before active attacks begin.

## Web shell

A **web shell** is a malicious script placed on a web server that lets an attacker run commands or retrieve data remotely. It can resemble a normal application file and provide persistent access after the original vulnerability is patched.

## MITRE ATT&CK

**MITRE ATT&CK** is a public knowledge base that gives common names and identifiers to observed attacker behaviours. It helps defenders compare incidents, identify required logs and test detection coverage. Technique overlap does not prove that two incidents were caused by the same actor.

## Telemetry and threat hunting

**Telemetry** is the security-relevant data produced by systems, including identity, endpoint, application, cloud and network logs. **Threat hunting** is the proactive search for suspicious behaviour that may not have generated an alert.

## Confidence

Confidence describes how strongly the available evidence supports an assessment:

- **High:** strong direct evidence or several reliable sources with few credible alternatives.
- **Moderate:** credible evidence exists, but important gaps or alternative explanations remain.
- **Low:** evidence is limited, indirect or disputed.

Confidence does not describe how severe the threat is.