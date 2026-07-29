# Experimental Sigma Rules

## Purpose

This folder contains portable rule designs created from the project's vendor-neutral detection specifications.

Sigma is a generic rule format, not a SIEM. A rule must be converted, mapped and tested for the target platform.

## Current rule

- [`mr_password_reset_then_finance_group_add.yml`](mr_password_reset_then_finance_group_add.yml)

The rule correlates:

```text
Windows Event 4724
Password reset attempt
        ↓ within 30 minutes
Windows Event 4728
Same account added to Finance-Admins-Lab
```

## Why it is experimental

- The rule has not been executed against the user's SIEM.
- `TargetSid` and `MemberSid` may be renamed or parsed differently by the selected backend.
- Some conversion backends may not fully support Sigma `temporal_ordered` correlation.
- The `Finance-Admins-Lab` group is a controlled lab group, not a production group.
- A real financial organisation would add help-desk, identity and asset context.

## Validation workflow

1. Run the controlled Windows identity correlation lab.
2. Confirm Event 4724 and Event 4728 fields in the raw XML.
3. Confirm how the SIEM parses the account SID and group name.
4. Convert or recreate the correlation for the target backend.
5. Execute the test sequence.
6. Review the alert and false positives.
7. Record the validated field mapping and final query.

## Modern Sigma note

The older Sigma pipe and `near` correlation style is obsolete. The current specification uses dedicated correlation rules such as `temporal` and `temporal_ordered`.

## Safety

The rules and lab are intended for authorised defensive environments. No real privileged group or production account should be used for the portfolio test.

## Source

- Sigma Correlation Rules Specification: https://sigmahq.io/sigma-specification/specification/sigma-correlation-rules-specification.html
