# Detection Specification: Voice or Video Impersonation Followed by a High-Risk Payment

## Detection objective

Identify a possible executive, bank or supplier impersonation attempt in which a voice or video interaction is used to pressure an employee or customer into making a high-risk financial action.

## Threat basis

The FBI has documented criminal use of AI-generated text, audio, images and video to make financial fraud more believable. Europol has also highlighted caller-ID spoofing as a major enabler of cross-border financial fraud.

## Financial assets at risk

- treasury and supplier payments;
- customer accounts;
- payroll and refunds;
- virtual-asset transfers;
- high-value or confidential transactions;
- account recovery and OTP processes.

## Required telemetry

- call metadata and recordings where authorised;
- video-meeting invitations and participant records;
- caller-ID and telephony-provider information;
- payment requests, beneficiaries, amounts and approvals;
- trusted contact and callback records;
- email, messaging and identity telemetry;
- customer fraud reports;
- account and transaction-risk signals.

## Correlation logic

Alert when a high-risk payment or account action follows an unusual voice or video request that bypasses normal verification.

```text
Unexpected voice or video request
        +
New beneficiary, urgent payment or OTP request
        +
Missing independent verification
        =
Possible impersonation fraud
```

Increase severity when:

- the caller ID displays a trusted bank, supplier or executive number but the call route is unusual;
- the request demands secrecy or immediate action;
- the beneficiary or wallet is new;
- the claimed requester is travelling, unavailable or using a new communication channel;
- the meeting or call was not scheduled through the normal corporate system;
- the employee is asked to ignore established approval controls;
- the same persona contacts several employees or customers.

## Expected legitimate activity

- urgent treasury or legal payments;
- executive travel and alternate communications;
- customer account-recovery calls;
- supplier changes;
- emergency operational actions.

Legitimate urgency must still follow trusted verification and approval rules.

## Investigation steps

1. Pause the transaction or account change where possible.
2. Verify the claimed person using a trusted directory or known contact channel.
3. Preserve the call, meeting, message and transaction records.
4. Review caller route, meeting creation and participant details.
5. Confirm beneficiary creation, approval and historical pattern.
6. Identify other targets contacted by the same number, account or persona.
7. Review whether customer or employee data was used to make the impersonation convincing.

## Containment and recovery

- stop or recall the payment;
- block known fraudulent communication channels where proportionate;
- reset or protect affected accounts;
- warn other targeted users without distributing sensitive media unnecessarily;
- notify fraud, legal, communications and law enforcement according to policy;
- update trusted-contact and approval procedures.

## ATT&CK mapping

- `T1656` — Impersonation
- `T1566.004` — Phishing: Spearphishing Voice
- `T1078` — Valid Accounts, when a compromised account supports the request

The financial transaction and social-engineering decision require fraud and business-process context beyond ATT&CK.

## Validation plan

Run a controlled tabletop or simulation using a clearly authorised synthetic message. Submit a non-production payment request to a test beneficiary and confirm that staff use the trusted verification channel and that the relevant telemetry is preserved.

## Review conditions

Review when:

- payment approval or telephony platforms change;
- deepfake and caller-ID abuse reporting changes;
- a real incident reveals a new verification bypass;
- false positives identify legitimate emergency processes that need stronger documentation.
