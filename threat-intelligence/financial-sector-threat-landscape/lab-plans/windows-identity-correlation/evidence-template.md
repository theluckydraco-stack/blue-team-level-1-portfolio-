# Windows Identity Correlation Lab Evidence

## Validation status

- [ ] Lab objects created
- [ ] Event 4724 generated
- [ ] Event 4728 generated
- [ ] Events exported
- [ ] SIEM fields mapped
- [ ] Correlation implemented
- [ ] Alert generated
- [ ] False positives reviewed
- [ ] Screenshots added

## Objective

I tested whether a password reset followed by addition of the same account to a finance-privileged lab group could be detected as one ordered sequence.

## Lab environment

| Component | Value |
|---|---|
| Domain controller | `<REDACTED_OR_LAB_HOST>` |
| Windows Server version | `<VERSION>` |
| Client | `<VERSION_OR_NOT_USED>` |
| Domain | `<LAB_DOMAIN>` |
| SIEM | `<SIEM_OR_EVENT_VIEWER_ONLY>` |
| Test account | `finsoc.test` |
| Test group | `Finance-Admins-Lab` |
| Test date | `<YYYY-MM-DD>` |

## Simulated behaviour

```text
Password reset for finsoc.test
        ↓
Addition to Finance-Admins-Lab
        ↓
Optional test logon
```

## Raw evidence

### Event 4724

| Field | Observed value |
|---|---|
| TimeCreated | |
| Computer | |
| SubjectUserName | |
| SubjectDomainName | |
| TargetUserName | |
| TargetDomainName | |
| TargetSid | |

Screenshot:

```markdown
![Event 4724](images/event-4724-password-reset.png)
```

### Event 4728

| Field | Observed value |
|---|---|
| TimeCreated | |
| Computer | |
| SubjectUserName | |
| MemberName | |
| MemberSid | |
| TargetUserName / GroupName | |

Screenshot:

```markdown
![Event 4728](images/event-4728-group-add.png)
```

## SIEM field mapping

| Windows XML field | SIEM field | Verified? |
|---|---|---|
| TargetSid | | |
| MemberSid | | |
| TargetUserName | | |
| SubjectUserName | | |
| EventID | | |
| TimeCreated | | |

## Detection logic used

```text
Event 4724 for account SID X
        ↓ within 30 minutes
Event 4728 where MemberSid = X
and group = Finance-Admins-Lab
```

Platform query or rule:

```text
<ADD_VALIDATED_QUERY_OR_REFERENCE>
```

## Expected result

One high-priority alert should identify:

- the account that was reset;
- the administrator who performed the reset;
- the group receiving the account;
- the time between both actions;
- the host that recorded the events.

## Actual result

```text
<WORKED / PARTIALLY_WORKED / DID_NOT_WORK>
```

## Investigation notes

- Was the activity approved?
- Was the operator expected?
- Did the account log on after the change?
- Was any sensitive application accessed?
- What additional data would increase confidence?

## False positives and tuning

| Legitimate scenario | Tuning decision |
|---|---|
| Approved help-desk recovery | |
| Employee role change | |
| Lab or administrative test | |
| Emergency access restoration | |

## Limitations

- Local Active Directory does not reproduce cloud MFA registration.
- The lab group is not a production privileged group.
- The Sigma rule remains experimental until the target backend is verified.
- No real customer, employee or financial data was used.

## Final status

- [ ] Not working
- [ ] Partially working
- [ ] Validated in lab
- [ ] Production validation required
