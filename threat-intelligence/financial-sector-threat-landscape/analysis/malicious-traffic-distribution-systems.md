# Malicious Traffic Distribution Systems and Financial Phishing

## The problem

A phishing link does not always send every visitor directly to the same malicious page.

Attackers can use a **traffic distribution system (TDS)** to decide where each visitor is sent. The decision may depend on location, device, browser, referrer, time or whether the visitor appears to be a security scanner.

```text
Phishing email, malicious advertisement or compromised website
        ↓
Traffic distribution system
        ↓
Selected victims → fake financial login or malware
Security scanners → harmless or unrelated page
```

This selective redirection can make a malicious campaign harder to reproduce and investigate.

## Current relevance

In June 2026, the FBI warned that criminals were using malicious TDS infrastructure to redirect users toward fraudulent websites, phishing pages and malware associated with ransomware and financial scams.

The FBI described entry paths including:

- phishing links;
- search-engine optimisation poisoning;
- fraudulent advertisements that imitate legitimate services;
- compromised legitimate websites;
- malicious or deceptive application downloads.

This directly extends the BTL1 URL-analysis lesson. Copying the visible link and checking one destination may not reveal the full redirect chain or the page shown to the original victim.

## Why finance is exposed

Customers and employees frequently search for:

- bank login pages;
- cryptocurrency exchanges;
- tax and payment portals;
- payroll services;
- investment platforms;
- software downloads;
- customer-support numbers.

A malicious advertisement or compromised site can place the attacker between the user and the trusted service.

## Attack path

```text
Victim searches for financial service or clicks an email link
        ↓
Attacker-controlled advertisement or compromised page
        ↓
TDS profiles the visitor
        ↓
Victim receives brand-impersonation login page or malicious download
        ↓
Credentials, payment details or endpoint access stolen
```

## Investigative implications

### Preserve the complete URL

Record the full original URL, including path and query string. Do not reduce the evidence to only the root domain.

### Record the browsing context

The destination may change based on:

- source IP and country;
- user agent and device type;
- referrer;
- cookies;
- time;
- search term or advertisement campaign;
- prior visits.

### Capture the redirect chain safely

Use an approved isolated analysis service or controlled browser environment. Do not repeatedly browse the link from a production workstation.

### Compare multiple perspectives

A URL reputation service, sandbox and victim browser may each receive a different destination. Differences are evidence, not necessarily an analyst mistake.

## Evidence to collect

- original email, message, advertisement or search result;
- complete and defanged URL;
- redirect chain and timestamps;
- HTTP status codes and response headers;
- DNS resolutions and certificate details;
- browser user agent, referrer and cookies where authorised;
- page screenshots and source code;
- credential or file-submission destination;
- endpoint process and network activity;
- customer or employee account activity after the visit.

## Detection and hunting opportunities

- identify newly observed redirect domains in email and proxy logs;
- detect chains involving several unrelated domains before a financial login page;
- alert when users reach a login page from a paid advertisement or unusual referrer;
- correlate browser access with credential submission and later account anomalies;
- identify downloaded files launched shortly after ad or search-engine traffic;
- monitor domains that return different content to scanners and employees;
- compare brand names, certificate subjects and registrable domains.

## Defensive priorities

- use protective DNS, web filtering and browser isolation for high-risk workflows;
- restrict unapproved software installation;
- monitor search-ad and brand-impersonation abuse;
- publish trusted customer-support and login channels clearly;
- use phishing-resistant authentication;
- protect customer sessions and detect unusual post-login behaviour;
- share confirmed redirect infrastructure with approved partners using context and expiry dates.

## Modern parallels and updates

### RDAP, not only WHOIS

For gTLD registration research, RDAP is the current standard. Registration age and registrar data provide context but do not prove maliciousness.

### Full-chain analysis

Modern URL analysis should examine:

```text
Initial URL
Redirectors
Final landing page
Submission or download endpoint
Post-compromise activity
```

### Brand protection and fraud intelligence

The campaign may affect customers who never enter the organisation's network. SOC, fraud, brand-protection and customer-support teams therefore need a shared response.

### Selective delivery

A harmless result from one automated scanner does not prove that the original link was safe. TDS infrastructure can deliver different content to different visitors.

## Strategic assessment

**My assessment:** malicious TDS infrastructure turns a single phishing URL into a decision system that separates targets from researchers. Financial organisations should preserve victim context and investigate the entire redirect and account-compromise chain rather than treating URL reputation as a final verdict.

**Confidence:** high that the FBI described malicious TDS use in 2026; moderate regarding the prevalence of each targeting rule because individual campaign configurations are rarely public.

## Source

- FBI IC3 — Cyber Criminals Redirecting Users to Fraudulent Websites with Malicious Traffic Distribution Systems: https://www.ic3.gov/PSA/2026/PSA260618
