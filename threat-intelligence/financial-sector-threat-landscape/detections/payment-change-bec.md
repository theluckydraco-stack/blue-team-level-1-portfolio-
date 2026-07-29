# Detection Specification: Payment-Detail Change and BEC Correlation

## Detection objective

Identify a possible business email compromise or supplier-impersonation fraud in which a payment request, beneficiary or bank-account change is supported by suspicious email or identity activity.

## Threat basis

BEC succeeds when an attacker manipulates a trusted business conversation and an authorised employee completes a legitimate payment process using false information.

## Financial assets at risk

- supplier and payroll payments;
- treasury and wire-transfer processes;
- customer refunds;
- merger, acquisition and legal payments;
- virtual-asset transfers;
- supplier master data.

## Required telemetry

- complete email headers and mail-gateway verdicts;
- mailbox sign-ins, devices, sessions and OAuth grants;
- inbox and forwarding-rule changes;
- supplier-master and beneficiary changes;
- payment requests, amounts, operators and approvals;
- purchase orders and invoice history;
- trusted supplier-contact records;
- destination-account and fraud-risk information.

## Correlation logic

Create a high-priority alert when a new or changed beneficiary is followed by a material payment and one or more email or identity anomalies.

```text
New beneficiary or bank-detail change
        +
Email-domain, mailbox or conversation anomaly
        +
Urgent or unusual payment
        =
Possible BEC payment diversion
```

Increase severity when:

- the request uses a new lookalike domain;
- a legitimate mailbox recently signed in from a new device or location;
- forwarding rules or OAuth grants were recently created;
- payment details changed without independent supplier verification;
- the amount, currency, country or timing differs from historical behaviour;
- the payment bypasses normal separation of duties;
- the destination is linked to a high-risk bank, payment processor or virtual-asset service.

## Expected legitimate activity

- supplier bank changes;
- new vendors;
- urgent legal or operational payments;
- acquisitions or confidential projects;
- approved payment-process exceptions.

The investigation must verify these through a trusted channel and documented approval.

## Investigation steps

1. Pause the payment if operationally possible.
2. Contact the supplier or requester using a trusted directory or previously verified number.
3. preserve the original message and full headers.
4. Review mailbox sign-ins, rules, OAuth grants and deleted messages.
5. Compare the invoice, purchase order, beneficiary and historical payment pattern.
6. Identify other messages, suppliers or payments involving the same account or domain.
7. Check whether the destination account has fraud or mule indicators.

## Containment and recovery

- contact the originating bank immediately to request recall, reversal or freezing;
- revoke compromised sessions and remove malicious rules or grants;
- reset affected accounts and review connected applications;
- stop related payments and supplier changes;
- notify fraud, finance, legal and law enforcement according to policy;
- preserve transaction identifiers and communications.

## ATT&CK mapping

Possible mappings include:

- `T1566` — Phishing
- `T1656` — Impersonation
- `T1078` — Valid Accounts
- `T1098` — Account Manipulation
- `T1114` — Email Collection

The fraudulent transfer itself may be better represented in fraud and payment systems than in ATT&CK.

## Validation plan

Use a test supplier and laboratory mailbox to perform an approved beneficiary change, create a benign external email-domain variation and generate a test payment below production thresholds. Confirm that the correlation identifies the sequence without affecting real payments.

## Review conditions

Review when:

- payment or procurement workflows change;
- a new payment processor is adopted;
- supplier-verification policy changes;
- new BEC intelligence identifies a different payment-diversion method;
- false positives show legitimate high-risk processes not represented in the rule.
