# Detection Specification: Payment-System Reconnaissance and Operator Imitation

## Detection objective

Identify an attacker observing legitimate financial procedures, stealing valid credentials and then attempting to imitate an authorised operator inside ATM, card-processing, SWIFT or payment systems.

## Threat basis

Historical reporting on Silence described video recording of bank employees to learn applications and procedures. Cobalt and Carbanak-associated operations demonstrated movement from employee compromise into payment systems, fraudulent transfers and remote ATM cash-out.

The behaviour remains relevant because a modern attacker may use legitimate credentials and follow the correct operating sequence, making the activity look authorised.

## Financial assets at risk

- SWIFT and payment messaging;
- ATM management and cash-out systems;
- card-processing environments;
- treasury and settlement systems;
- account balances and beneficiary records;
- operator workstations and remote administration.

## Required telemetry

- EDR process, screen-capture and remote-access events;
- authentication, privileged access and session recording;
- payment-application commands and transaction audit logs;
- beneficiary, amount, timing and destination information;
- ATM administration and cash-dispense commands;
- SWIFT security and message records;
- fraud, AML and mule-account intelligence;
- operator schedules, roles and approved change records.

## Correlation logic

Alert when an identity or workstation shows reconnaissance of payment procedures followed by unusual transaction or administration activity.

```text
Screen recording, process discovery or payment documentation access
        ↓
Valid or stolen operator identity
        ↓
Unusual payment, ATM or balance action
        ↓
New destination, mule account or cash-out pattern
```

Increase severity when:

- the operator account is used from a new host or outside the normal shift;
- remote-access tools or screen capture precede the activity;
- transaction sequences are technically valid but financially unusual;
- account balances are changed before withdrawal;
- ATM commands occur across several locations;
- a new beneficiary or destination is followed by rapid cash-out;
- the technical activity aligns with known mule or laundering indicators.

## Expected legitimate activity

- training and quality assurance;
- approved remote support;
- treasury and settlement operations;
- ATM testing and maintenance;
- payment corrections and reconciliation;
- fraud-investigation access.

Legitimate activity should have named operators, approved purpose and traceable business records.

## Investigation steps

1. Verify the operator, device, shift and approved task.
2. Review preceding process discovery, screen recording and remote access.
3. Compare the transaction sequence with the operator's normal activity.
4. Trace beneficiaries, wallets, ATMs and cash-out locations.
5. Review related credential use and lateral movement.
6. Identify other transactions using the same destination or procedure.
7. Coordinate with payment operations, fraud, AML, ATM and law enforcement teams.

## Containment

- suspend affected operator sessions and credentials;
- stop or recall transactions where possible;
- block or monitor destination accounts and wallets according to policy;
- isolate compromised workstations;
- preserve payment, endpoint and authentication evidence;
- review the integrity of payment applications and administrator accounts.

## ATT&CK mapping

Relevant behaviours may include:

- `T1113` — Screen Capture
- `T1057` — Process Discovery
- `T1087` — Account Discovery
- `T1078` — Valid Accounts
- `T1021` — Remote Services

The final fraudulent payment or ATM action requires financial-application and fraud context beyond ATT&CK.

## Validation plan

Use a payment-system simulator or non-production workflow. Record a benign test session, use a laboratory operator account and submit an approved test transaction with a new beneficiary. Confirm that the detection distinguishes the sequence from normal operations.

## Review conditions

Review when:

- payment platforms or SWIFT controls change;
- ATM management moves to a new provider;
- fraud models identify new cash-out patterns;
- an incident shows that valid activity was not captured by current logging;
- operator roles or training workflows change.
