# Payment Fraud and Business Email Compromise

## The problem

A financial loss does not always require malware to modify a banking system.

An attacker may simply persuade an authorised employee to make the transfer.

**Business email compromise (BEC)** is a fraud model in which criminals impersonate or compromise a trusted business identity and use that trust to redirect a legitimate payment, change beneficiary details or obtain sensitive information.

```text
Trusted email or business identity
        ↓
False invoice, payee change or urgent payment request
        ↓
Authorised employee follows a legitimate payment process
        ↓
Money reaches an attacker-controlled account
```

The payment platform may work exactly as designed. The deception happens before the payment is authorised.

## Why this belongs in a financial-sector threat landscape

BEC connects the phishing skills covered in BTL1 directly to fraud operations.

BTL1 teaches me to examine:

- the visible sender and Reply-To address;
- the sending infrastructure and authentication results;
- malicious URLs and attachments;
- the message body and social-engineering objective;
- affected recipients and defensive actions.

That is necessary, but a financial investigation must continue into the business process:

- Was a supplier bank account changed?
- Was a new beneficiary created?
- Who approved the payment?
- Was an existing email conversation hijacked?
- Where did the funds go?
- Can the transfer still be recalled or frozen?

## Scale and current relevance

The FBI's Internet Crime Complaint Center reported that BEC-related complaints and financial filings recorded approximately USD 55.5 billion in exposed losses between October 2013 and December 2023. The FBI also reported that the fraud continued to evolve through third-party payment processors, peer-to-peer payment services and cryptocurrency exchanges.

This is not a single threat-actor profile. It is a repeatable fraud model used by many criminal groups.

## Common attack paths

### 1. Lookalike-domain impersonation

The attacker registers a domain resembling a supplier or executive domain and sends a fraudulent payment request.

### 2. Compromised legitimate mailbox

The attacker gains access to a real mailbox, studies existing conversations and sends a payment request inside a genuine thread.

This is harder to detect because SPF, DKIM and DMARC may pass when the legitimate account is used.

### 3. Mailbox-rule persistence

The attacker creates inbox or forwarding rules to hide replies, monitor conversations or redirect security notifications.

### 4. Supplier-account change

The attacker changes the bank account on an invoice or impersonates a supplier asking that future payments use a new beneficiary.

### 5. Executive or legal urgency

The attacker impersonates a senior leader, lawyer or deal adviser and pressures an employee to bypass normal review.

## Evidence to collect

### Email and identity evidence

- original `.eml` or `.msg` file;
- complete headers and trusted mail-gateway results;
- sender, Reply-To, Return-Path and Message-ID;
- SPF, DKIM and DMARC results;
- mailbox sign-ins, devices and locations;
- OAuth application grants and session-token activity;
- forwarding and inbox-rule creation;
- mailbox delegation and role changes;
- deleted or hidden messages.

### Payment evidence

- payee and bank-account changes;
- beneficiary-creation time and operator;
- payment amount and approval chain;
- device, session and location used for approval;
- invoice and purchase-order history;
- supplier master-data changes;
- destination bank, payment processor or wallet;
- recall, freeze and law-enforcement reference numbers.

## Detection ideas

### Payment change plus email anomaly

Alert when a supplier bank-account change occurs soon after:

- a new external domain appears in the email thread;
- a mailbox signs in from a new device or location;
- a forwarding rule is created;
- the normal supplier contact details change;
- the request bypasses the usual procurement workflow.

### New beneficiary plus urgency

Prioritise payments to a newly created beneficiary when the request contains urgency, secrecy or unusual executive involvement.

### Mailbox compromise indicators

Detect:

- new forwarding rules to external addresses;
- impossible-travel or unfamiliar-device sign-ins;
- consent to unusual OAuth applications;
- mass mailbox searches;
- deletion of security notifications;
- unusual access to finance, invoice or supplier conversations.

## Response priorities

1. Contact the originating financial institution immediately and request recall, reversal or freezing where possible.
2. Preserve the email, payment and identity evidence.
3. Revoke sessions, reset credentials and remove malicious mailbox rules.
4. Verify supplier details through a trusted contact channel already held by the organisation.
5. Identify related payments, beneficiaries and affected mailboxes.
6. Notify fraud, finance, legal and law enforcement according to policy.
7. Review whether the attacker also obtained customer or employee data.

Time matters because funds may be transferred through several accounts or converted to virtual assets shortly after receipt.

## Control lessons

- DMARC reduces some forms of direct domain spoofing but does not stop a compromised legitimate mailbox.
- MFA reduces password-only compromise but does not solve session theft, malicious OAuth grants or weak account recovery.
- A telephone callback is only useful when the number comes from a trusted directory or established contract, not from the suspicious message.
- High-risk payee changes should require independent verification and separation of duties.
- Email security, identity security and payment-fraud monitoring should share evidence.

## Modern parallels and updates

- BEC is increasingly an **identity and transaction-correlation problem**, not only an email-filtering problem.
- Generative AI can improve language quality, impersonation and voice synthesis, so poor grammar is no longer a reliable warning sign.
- Modern controls should combine mailbox telemetry, cloud identity, supplier-master data and payment events.
- The BTL1 artifact-extraction method remains useful, but the investigation must follow the attacker from the email into the payment process.

## Sources

- FBI IC3 — Business Email Compromise: The USD 55 Billion Scam: https://www.ic3.gov/PSA/2024/PSA240911
- FBI IC3 — Business Email Compromise guidance: https://www.ic3.gov/CrimeInfo/BEC
