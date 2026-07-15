# Phishing Response Challenge

## Overview

In this lab, I manually triaged five email samples to identify malicious messages, collect email, web, and file artifacts, assess the intent of each message, and recommend defensive actions. I identified Emails 1 and 3 as malicious. The remaining messages were classified as spam, scams, or marketing content rather than malware-delivery or credential-harvesting emails.

## Objective

I aimed to:

- Distinguish malicious phishing from spam and unwanted marketing email
- Inspect email headers and raw `.eml` content
- Identify sender, recipient, subject, date, sending IP, and reverse DNS information
- Extract suspicious URLs without visiting them
- Identify malicious attachment names and SHA256 hashes
- Use reputation services to assess collected artifacts
- Recommend proportionate containment, blocking, and hunting actions

## Tools Used

- Mozilla Thunderbird
- Sublime Text
- DomainTools WHOIS / reverse DNS
- VirusTotal

## Methodology

### 1. Email triage

I reviewed all five messages in Thunderbird and assessed sender identity, branding, recipient targeting, language, urgency, calls to action, links, attachments, and overall intent.

### 2. Header and source inspection

I opened the malicious `.eml` files in Sublime Text and searched for the `From`, `To`, `Subject`, `Date`, sending-IP, and routing fields. I used the address inside angle brackets as the actual sender address rather than relying on the display name.

### 3. Web artifact extraction

For the Amazon-themed email, I copied the hyperlink destination without opening it and recorded the complete URL. The URL is defanged in this public report.

### 4. File artifact analysis

For the NHS-themed email, I identified the original attachment name and its supplied SHA256 hash. I searched the hash in VirusTotal rather than executing the file.

## Triage Results

| Email | Classification | Rationale |
|---|---|---|
| 1 | **Malicious phishing** | Amazon impersonation, unrelated sender infrastructure, generic greeting, urgency, poor wording, and a link to a likely credential-harvesting site |
| 2 | Spam / scam | Lottery-themed social engineering requesting personal information, but no malicious attachment or confirmed malicious hyperlink was identified |
| 3 | **Malicious phishing** | NHS impersonation from Gmail, generic greeting, urgency, and a disguised executable attachment |
| 4 | Newsletter / marketing spam | Branded marketing content with multiple links but no confirmed malicious behavior identified during triage |
| 5 | Unwanted cryptocurrency marketing / spam | Misleading marketing language and an unusual Reply-To identity, but no confirmed malicious payload identified during triage |

# Malicious Email 1 — Amazon Impersonation

## Assessment

I determined that this message was a credential-phishing email impersonating Amazon. The display name attempted to resemble an Amazon address, but the actual sender was `QPE77756@mun.ca`. The message used an unfamiliar-purchase theme to create concern and directed the recipient to a refund form hosted on an unrelated domain.

The URL included the recipient's email address as a parameter. This may have been intended to prepopulate a fraudulent login or refund page and make the page appear more credible. This is an analytical assessment based on the URL structure; the live page was not opened.

## Email Artifacts

| Artifact | Value |
|---|---|
| Actual sender address | `QPE77756@mun.ca` |
| Display name | `auto-confirm.info-amazon.co.uk` |
| Recipient | `jack.tractive@abcindustries.co.uk` |
| Subject | `Your Amazon.co.uk order of "ION Audio Turntable.."` |
| Reply-To | `None` |
| Date header | `Wed, 19 Apr 2017 12:35:58 +0000` |
| Sending server IP | `68.114.190.29` |
| Reverse DNS hostname | `mtaout004-public.msg.strl.va.charter.net` |

## Web Artifacts

| Artifact | Value |
|---|---|
| Full URL | `hxxp://id820update[.]refundsys59[.]co[.]uk/invoice103amz/index.php?email=jack[.]tractive@abcindustries[.]co[.]uk` |
| Root domain | `refundsys59.co.uk` |

## Analysis Activities and Results

- I compared the Amazon-themed display name with the actual address in angle brackets and identified a clear sender mismatch.
- I identified inconsistent formatting, generic addressing, awkward language, and an urgent refund call to action.
- I safely extracted the link destination from the email rather than opening it.
- I identified that the destination domain was unrelated to Amazon.
- I assessed the message intent as credential theft or collection of sensitive account information through a fraudulent refund page.

## Recommended Defensive Measures

### Email artifacts

- Search the mail environment for other messages matching the exact sender address, subject, message ID, URL, or similar Amazon-themed content.
- Quarantine or purge confirmed copies from employee mailboxes.
- Block the exact sender address if it has no legitimate business use, but do **not** block the entire `mun.ca` domain solely because one address was abused.
- Add the sender address and campaign characteristics to email-security detections.

### Web artifacts

- Block the full URL and root domain at the secure web gateway, proxy, DNS-filtering service, and other relevant controls.
- Search proxy, DNS, firewall, browser, and EDR telemetry for access to the URL or domain.
- Identify users who clicked the link and determine whether credentials or other information were submitted.
- Reset affected credentials, revoke active sessions, and enforce MFA where compromise is suspected.

### File artifacts

- No file artifact was identified in this email.

# Malicious Email 3 — NHS COVID-19 Impersonation

## Assessment

I determined that this message was a malware-delivery phishing email impersonating the United Kingdom's National Health Service. It was sent from a Gmail address, used a generic greeting, offered a limited COVID-19 testing kit, created urgency, and instructed the recipient to open an attachment.

The original attachment used a double extension, `.pdf.exe`, to make a Windows executable appear to be a PDF. The email gateway had removed the original attachment and replaced it with a safe text notification containing the original filename and SHA256 hash.

## Email Artifacts

| Artifact | Value |
|---|---|
| Sender address | `FSDFAS2423N23K@gmail.com` |
| Recipient | `matthew.beaman@abcindustries.co.uk` |
| Subject | `COVID19 - GET TESTED NOW!` |
| Reply-To | `None` |
| Date header | `Fri, 12 Jun 2020 21:23:00 +0100` |
| Sending server IP | `209.85.160.173` |
| Reverse DNS hostname | `mail-qt1-f173.google.com` |

## File Artifacts

| Artifact | Value |
|---|---|
| Original filename | `COVID19-Testing-Kit-2020.pdf.exe` |
| File type indicated by extension | Windows executable (`.exe`) disguised with a PDF-style double extension |
| SHA256 | `8B2E701E91101955C73865589A4C72999AEABC11043F712E05FDB1C17C4AB19A` |

## Analysis Activities and Results

- I identified a mismatch between the claimed NHS identity and the Gmail sending address.
- I identified a generic greeting, scarcity, urgency, and an instruction to open the attachment.
- I inspected the safe replacement text file and recovered the original attachment name and SHA256 value.
- I identified the `.pdf.exe` double extension as an attempt to disguise an executable as a document.
- I searched the SHA256 in VirusTotal. At the time of the lab, **60 of 71 security vendors** detected the file as malicious.
- VirusTotal categorized the sample as a trojan/spyware-related threat and showed family labels including `zbot`, `foreign`, and `netloader`.

## Recommended Defensive Measures

### Email artifacts

- Search for and purge other messages matching the sender address, subject, original filename, SHA256 hash, or similar NHS/COVID-19 themes.
- Block the exact Gmail sender address, but do **not** block `gmail.com` or Google's shared mail-server IP address because this would affect legitimate Gmail traffic.
- Report the abusive Gmail account through the appropriate provider process.
- Preserve the original `.eml` file and relevant gateway logs for investigation.

### File artifacts

- Add the SHA256 hash to EDR, antivirus, email-gateway, and other supported blocklists.
- Search endpoint and security telemetry for the SHA256, original filename, and related execution events.
- Quarantine the file wherever it is found and isolate affected endpoints if execution is suspected.
- Review process creation, persistence, network connections, credential-access activity, and other EDR telemetry on affected hosts.
- Block executable attachments that use misleading double extensions where business requirements permit.
- Submit unknown variants to an approved sandbox from an isolated analysis environment rather than opening them on an analyst workstation.

## Skills Demonstrated

- Phishing email triage and classification
- Differentiation between phishing, scams, spam, and marketing email
- Manual `.eml` and header inspection
- Sender and recipient artifact extraction
- Sending IP and reverse DNS identification
- Safe URL extraction and root-domain identification
- Malicious attachment identification
- Double-extension analysis
- SHA256 reputation analysis with VirusTotal
- Indicator-of-compromise collection
- Evidence-based defensive recommendations
- Phishing incident reporting

## Outcome

I identified Emails 1 and 3 as malicious, documented their email, web, and file artifacts, assessed their likely intent, and proposed targeted defensive actions. The exercise reinforced the importance of using multiple indicators rather than classifying an email from appearance alone. It also demonstrated why broad blocks against shared services such as Gmail or Google mail-server IPs can create significant false positives and business disruption.

## Safety Note

The URL in this report is defanged. No live malicious attachment is included in this repository. The investigation was completed using controlled BTL1 laboratory material.