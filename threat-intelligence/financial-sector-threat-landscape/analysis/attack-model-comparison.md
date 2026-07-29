# Financial Attack-Model Comparison

## Why compare attack models instead of only actors?

Actor names can change, overlap or disappear from public reporting. The underlying attack path often remains relevant.

For example, a bank may never be targeted by the exact group called Scattered Spider, but it can still be compromised through the same weak help-desk recovery process.

The project therefore compares **what the attacker must accomplish**, not only who the source believes performed the incident.

## Comparison

| Attack model | Entry point | Trust abused | Financial objective or impact | Representative cases | Highest-value evidence |
|---|---|---|---|---|---|
| Direct virtual-asset theft | Developer, wallet, cloud or transaction system | Transaction approval and signing infrastructure | Steal cryptocurrency and launder it | DMM Bitcoin, Bybit, UNC4899 | Developer endpoint, cloud, wallet, transaction and blockchain data |
| Identity-recovery takeover | Help desk, password reset or MFA recovery | Employee identity and SSO | Reach SaaS, cloud, customer data and extortion targets | Scattered Spider / UNC3944 | Ticket, call, MFA, token, role and SaaS audit logs |
| Device-code token phishing | Phishing message and legitimate verification page | User authorisation and OAuth tokens | Read email/files, enable BEC or steal data | Kali365 | Device-code sign-in, token issuance and Microsoft 365 audit |
| Public-application mass exploitation | Internet-facing MFT, ERP, VPN or edge product | Trusted enterprise application | Data theft, extortion, persistence and downstream exposure | MOVEit, Oracle EBS, APT41 | WAF, application, file integrity, EDR, database and cloud logs |
| Open-source software supply-chain compromise | Maintainer or package-publishing account | Trusted package and build process | Compromise developers, CI/CD and downstream applications | Axios / UNC1069 | Repository, package, lockfile, pipeline, provenance and developer EDR |
| Support-insider access abuse | Employee or outsourced support access | Legitimate customer-service permissions | Obtain data for social engineering, fraud and extortion | Coinbase 2025 | Case assignment, record access, DLP, endpoint and fraud reports |
| Business email compromise | Spoofed or compromised mailbox | Supplier, executive or business conversation | Redirect authorised payments | FBI BEC model | Full email, mailbox identity, supplier master, beneficiary and payment events |
| AI-assisted voice or video fraud | Phone, meeting or synthetic identity | Human trust in voice, image and caller ID | Payment, account recovery or onboarding fraud | FBI AI warning, Europol caller-ID reporting | Call, meeting, trusted contact, identity and transaction evidence |
| Payment-operator imitation | Phishing, remote access and process reconnaissance | Legitimate operator workflow | Fraudulent transfers, ATM cash-out or balance manipulation | Cobalt Group, Silence | Endpoint, session recording, payment, ATM, SWIFT, fraud and AML logs |
| Cloud-to-cloud data theft | Valid identity, token or SaaS integration | Approved cloud applications and encrypted traffic | Extortion, customer harm and strategic collection | UNC3944, APT41 DUST | SaaS API, object access, sync, DLP, identity and data-classification logs |
| Malicious redirect and brand impersonation | Email, search result, advertisement or compromised website | Brand recognition and selective redirection | Credential theft, customer fraud or malware delivery | FBI TDS 2026 | Original URL, redirect chain, browser, DNS, proxy and account activity |
| DDoS and service disruption | Internet-facing service or supplier | Dependence on continuous availability | Interrupt payments, authentication, trading and customer trust | FS-ISAC/Akamai sector reporting | Traffic, service health, transaction success and provider telemetry |
| Strategic espionage | Public applications, supply chain or valid accounts | Trusted access to business and partner information | Economic, diplomatic or surveillance intelligence | APT41 | Victimology, timing, data accessed, actor procedures and strategic context |

## What repeats across the models?

```text
Trusted person
Trusted identity
Trusted software
Trusted supplier
Trusted transaction
Trusted service availability
```

The attack succeeds when the organisation accepts that trust without enough independent evidence or cannot see how it is being used.

## Cross-model defensive priorities

### Identity context

Record who authenticated, how they recovered access, which device or token was used and what business system was reached.

### Business-process context

Connect technical actions to payments, beneficiaries, customer support, supplier data, transaction approval and critical-service health.

### Supplier and software context

Know which provider, package and application supports each important financial service and which credentials or data cross that boundary.

### Long-lived evidence

Retain enough application, identity, cloud and transaction history to investigate activity that began before the first alert, breach notification or extortion message.

### Validation

Test whether the required data exists and whether one understandable alert can reconstruct the attack path.

## Main conclusion

The actor profiles answer:

> Who has publicly used this behaviour?

The attack-model comparison answers the more durable question:

> Could this behaviour succeed against our financial environment, and would we see it?

## Supporting dataset

The machine-readable comparison is available in [`data/attack-model-comparison.csv`](../data/attack-model-comparison.csv).
