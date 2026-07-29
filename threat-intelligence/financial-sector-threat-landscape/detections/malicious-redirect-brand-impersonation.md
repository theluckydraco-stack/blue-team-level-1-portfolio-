# Detection Specification: Malicious Redirect Chain and Financial Brand Impersonation

## Detection objective

Identify users or customers being redirected through suspicious infrastructure to fake financial login pages, fraudulent support sites or malicious downloads.

## Threat basis

The FBI's 2026 warning on malicious traffic distribution systems described phishing links, search-engine poisoning, fraudulent advertisements and compromised websites selectively redirecting users to phishing pages or malware.

## Financial assets at risk

- employee and customer credentials;
- online banking and cryptocurrency accounts;
- customer-support sessions;
- payment and investment accounts;
- endpoints used for financial operations.

## Required telemetry

- secure web gateway, proxy and DNS logs;
- browser and endpoint telemetry;
- email and messaging URLs;
- search-ad or referrer information where available;
- redirect-chain and HTTP response data;
- certificate and registrable-domain information;
- credential-submission and account-risk events;
- downloaded-file and process-creation telemetry;
- brand-abuse and customer reports.

## Correlation logic

Alert when a user reaches a login, payment or software-download page through a suspicious multi-domain redirect chain and later shows credential or endpoint compromise indicators.

```text
Email, advertisement or compromised website
        ↓
Rare or newly observed redirect domain
        ↓
Financial brand login or download page on unrelated domain
        ↓
Credential submission, download or account anomaly
```

Increase severity when:

- the final registrable domain is not owned or approved by the impersonated brand;
- several unrelated redirectors are used;
- the site changes content by country, device or user agent;
- the browser downloads an executable, script or archive;
- credentials are followed by a new account session or MFA change;
- several customers report the same advertisement, search result or support number.

## Expected legitimate activity

- approved marketing and tracking links;
- payment processors and identity providers;
- content-delivery networks;
- authorised URL shorteners;
- supplier or affiliate redirects.

Maintain an approved-domain and partner inventory rather than blocking all redirects.

## Investigation steps

1. Preserve the original message, search result or advertisement.
2. Record the complete initial URL, path and query string.
3. Reconstruct the redirect chain in an approved isolated environment.
4. Compare registrable domains, certificates, page content and submission endpoints.
5. Review endpoint processes and downloaded files.
6. Check the user's or customer's account activity after the visit.
7. Search for other users who received the same URL or redirector.
8. Review RDAP registration context without treating privacy redaction as proof of maliciousness.

## Containment

- block confirmed malicious domains, URLs or advertisements with appropriate scope;
- remove delivered phishing messages;
- reset affected credentials and revoke sessions;
- quarantine malicious downloads;
- notify brand-protection, fraud and customer-support teams;
- submit abuse reports to relevant providers;
- preserve raw indicators securely and defang only the report copy.

## ATT&CK mapping

- `T1566.002` — Phishing: Spearphishing Link
- `T1189` — Drive-by Compromise
- `T1656` — Impersonation
- `T1204.002` — User Execution: Malicious File, when a download is executed

## Validation plan

Create an authorised internal redirect chain leading to a harmless imitation page clearly marked as a test. Confirm that proxy, browser and identity telemetry can reconstruct the full path. Do not imitate a real financial brand outside an authorised training environment.

## Review conditions

Review when:

- approved marketing and payment partners change;
- browser isolation or proxy products change;
- a new TDS campaign is reported;
- customers report a previously unseen search-ad or support-site fraud pattern;
- URL-analysis services produce conflicting results due to selective delivery.
