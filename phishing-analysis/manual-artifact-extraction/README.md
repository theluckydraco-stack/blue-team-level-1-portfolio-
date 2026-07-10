# Manual Artifact Extraction

## Overview

In this lab, I manually extracted email, web, and file artifacts from two safe phishing email samples. I used an email client and a text editor rather than relying on an automated phishing-analysis platform.

## Objective

I aimed to identify and record the following artifacts:

- Sender and recipient addresses
- Subject line
- Email date and time
- Sending server IP address
- Sending server hostname
- Embedded URL and root domain
- Attachment filename
- MD5 and SHA256 file hashes

## Tools Used

- Mozilla Thunderbird
- Sublime Text
- DomainTools WHOIS
- Windows PowerShell

## Methodology

### 1. Raw email inspection

I opened each `.eml` file in Sublime Text and used the Find function to locate the `From`, `To`, `Subject`, `Date`, and `X-Sender-IP` fields.

### 2. Sending infrastructure lookup

I submitted each sending server IP address to DomainTools and used the reverse DNS result to identify the associated hostname.

### 3. Safe URL extraction

I opened the first email in Thunderbird, right-clicked the hyperlink, and copied the link location without opening it. I then separated the full URL from its root domain.

### 4. Attachment identification and hashing

I identified the attachment in the second email, saved it without opening it, and generated MD5 and SHA256 hashes with PowerShell.

```powershell
Get-FileHash ".\Apply Music Invoice 13313a.docx" -Algorithm MD5
Get-FileHash ".\Apply Music Invoice 13313a.docx" -Algorithm SHA256
```

## Findings

### Email One — Netflix impersonation

| Artifact | Value |
|---|---|
| Sender address | `security@netflixxuk.com` |
| Recipient address | `jake.wood@dicksonunited.co.uk` |
| Subject | `Netflix: Suspicious Account Activity` |
| Date and time | `3 May 2020 19:20:54` |
| Sending server IP | `54.240.5.4` |
| Reverse DNS hostname | `a5-4.smtp-out.eu-west-1.amazonses.com` |
| Full URL | `hxxps://www[.]thiswouldbeamalicioussite[.]com/index/2020/j411/NetflixLogin.php?` |
| Root domain | `thiswouldbeamalicioussite.com` |

The email used Netflix branding and an account-lock message to pressure the recipient into selecting a link. The visible sender domain, `netflixxuk.com`, differed from Netflix's legitimate domain. The embedded link also directed the recipient to an unrelated external domain.

### Email Two — Apple invoice impersonation

| Artifact | Value |
|---|---|
| Sender address | `elli0taaa@outlook.com` |
| Recipient address | `andrewadams112@hotmail.co.uk` |
| Subject | `Invoice No.: 3271653512` |
| Date and time | `24 May 2020 15:21:13` |
| Sending server IP | `40.92.89.55` |
| Reverse DNS hostname | `mail-db8eur05olkn2055.outbound.protection.outlook.com` |
| Attachment filename | `Apply Music Invoice 13313a.docx` |
| MD5 | `3A3A0C34660656BC74CDC6C87D734771` |
| SHA256 | `F05EA223EEEE0A41F9946071C1F9B9890FF8B196C9E4A78799CA710B2A5DCE128` |

The email used Apple-themed invoice content to create concern about an unfamiliar purchase and encouraged the recipient to inspect an attached Word document. The display name referenced Apple, but the actual sender used an Outlook address.

## Evidence

Screenshots document the following steps:

- Raw email header inspection
- Sending server IP extraction
- Reverse DNS lookup
- Safe hyperlink extraction
- Attachment identification
- MD5 and SHA256 hash generation

> Evidence images will be stored in the `images` directory for this project.

## Skills Demonstrated

- Manual `.eml` inspection
- Email header analysis
- Sender and recipient extraction
- Sending infrastructure identification
- Reverse DNS lookup
- Safe URL extraction
- Root-domain identification
- Attachment identification
- MD5 and SHA256 hash generation
- Indicator-of-compromise collection

## Outcome

I successfully extracted email, web, and file artifacts from two phishing email samples using manual methods. The lab demonstrated how I can collect useful indicators without opening suspicious links or executing attachments.

## Safety Note

The URLs in this report are defanged. No live malicious files are included in this repository.
