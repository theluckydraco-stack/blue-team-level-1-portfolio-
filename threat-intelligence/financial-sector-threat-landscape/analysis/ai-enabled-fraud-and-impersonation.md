# AI-Enabled Fraud and Impersonation

## The problem

Traditional phishing advice often tells users to look for bad spelling, unnatural language or obvious visual mistakes.

Generative AI reduces the cost of producing believable text, voices, images, videos and identities. This does not create a completely new crime. It makes familiar fraud and social-engineering methods faster, cheaper and more convincing.

```text
Existing fraud method
        +
AI-generated language, voice, image or video
        =
More scalable and believable impersonation
```

## Current evidence

The FBI warned in December 2024 that criminals were using generative AI to facilitate financial fraud at greater scale and improve the believability of schemes.

The FBI described uses including:

- believable phishing and social-engineering text;
- translated messages with fewer language errors;
- fake social-media profiles and identification documents;
- AI-generated audio used to impersonate relatives or obtain bank-account access;
- real-time or recorded video impersonating executives or authority figures;
- fraudulent investment websites and promotional content.

FS-ISAC's 2025 financial-sector reporting also identified GenAI-enabled scams, deepfake executive impersonation and fraudulent outsourced IT workers as concerns for financial firms.

Europol reported in October 2025 that caller ID spoofing was contributing to substantial financial fraud, with phone calls and text messages representing a large portion of reported cases. Caller ID can display a trusted bank or company number even when the caller is not connected to that organisation.

## Why finance is exposed

Financial decisions frequently depend on trust in:

- executives and treasury staff;
- customers and account holders;
- bank or payment-provider support staff;
- suppliers and legal advisers;
- remote developers and contractors;
- identity documents and video onboarding;
- voice-based customer verification.

AI can strengthen the false identity presented to each of these processes.

## Realistic attack paths

### Executive payment fraud

```text
Public executive video and voice samples
        ↓
Synthetic voice or video meeting
        ↓
Urgent confidential payment request
        ↓
Employee bypasses normal verification
```

### Customer account takeover

```text
Stolen customer information
        ↓
Spoofed bank telephone number
        ↓
AI-assisted caller impersonates bank staff
        ↓
Customer reveals OTP or authorises transfer
```

### False remote worker

```text
Fabricated identity and professional history
        ↓
AI-assisted interview and documentation
        ↓
Remote contractor gains legitimate access
        ↓
Data theft, extortion or state revenue generation
```

### Synthetic identity and onboarding fraud

```text
Stolen or generated identity data
        ↓
Fake documents, images or video
        ↓
Account or credit relationship opened
        ↓
Fraud, mule activity or laundering
```

## Evidence to collect

- call metadata and recordings where permitted;
- caller-ID and telecommunications-provider information;
- video-meeting records and invitations;
- payment request and approval history;
- identity-verification and onboarding results;
- document metadata and submission source;
- trusted contact and callback records;
- account, device, session and transaction telemetry;
- customer reports and destination-account information;
- fraud-model outputs and manual-review notes.

## Detection and control approach

### Do not rely on detecting AI content alone

AI-detection tools may be uncertain and can create false confidence. The stronger control is to verify the **transaction and identity process**.

### Use trusted-channel verification

- call back using a number already stored in a trusted directory;
- require a second authorised approver for high-risk transactions;
- prevent an urgent meeting from replacing documented approval;
- verify supplier and beneficiary changes independently;
- use phishing-resistant authentication for workforce access;
- apply liveness, document and device checks during customer onboarding.

### Correlate behaviour

Increase risk when:

- a voice or video request is followed by an unusual payment;
- the beneficiary is new;
- the request bypasses normal workflow;
- the caller ID is trusted but the call route or context is unusual;
- a new remote worker uses shared infrastructure, inconsistent identity details or unexplained remote-control arrangements.

## SOC and fraud response

1. Preserve the message, recording, video, document and transaction evidence.
2. Verify the claimed person through an established channel.
3. Pause or recall the transaction where possible.
4. Review account, device and identity changes.
5. Identify other employees or customers contacted by the same persona.
6. Share indicators and fraud patterns with approved financial-sector and law-enforcement partners.
7. Avoid publicly labelling media as AI-generated unless the evidence supports that conclusion.

## Strategic assessment

**My assessment:** AI increases the efficiency and credibility of social engineering, but the underlying defensive problem remains weak identity proof and weak transaction verification. Financial institutions should therefore strengthen business processes rather than waiting for a perfect deepfake detector.

**Confidence:** high that official sources report criminal use of generative AI and caller-ID spoofing for fraud; moderate regarding the exact proportion of successful financial fraud caused specifically by AI because public reporting and classification remain incomplete.

## Modern update to BTL1 learning

BTL1 phishing analysis correctly focuses on artifacts and social-engineering language. Current practice must add:

- voice and video impersonation;
- caller-ID spoofing;
- synthetic identities and documents;
- remote-worker verification;
- payment and account-opening telemetry;
- trusted-channel verification.

Poor grammar should be treated as one clue, not a required sign of phishing.

## Sources

- FBI IC3 — Criminals Use Generative Artificial Intelligence to Facilitate Financial Fraud: https://www.ic3.gov/PSA/2024/PSA241203
- FS-ISAC — Navigating Cyber 2025: https://www.fsisac.com/navigatingcyber2025
- Europol — Position Paper on Caller ID Spoofing: https://www.europol.europa.eu/publications-events/publications/position-paper-caller-id-spoofing
