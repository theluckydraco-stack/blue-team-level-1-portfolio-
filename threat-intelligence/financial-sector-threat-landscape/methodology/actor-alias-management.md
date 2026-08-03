# Actor Alias Management

## The problem

Threat-intelligence providers do not observe the same incidents, infrastructure or victims. They may therefore assign different names to activity that only partly overlaps.

A new vendor name is not proof that every older label describes the same people, command structure or campaign.

## Project rule

I preserve the name used by the source at the time of publication and separately record later aliases.

```text
Source-time name
        +
Publisher
        +
Publication date
        +
Current alias and effective date
        +
Overlap caveat
```

## GTIG naming update — July 2026

Google Threat Intelligence Group began rolling out a unified two-word cryptonym system in July 2026. The second word communicates the category assigned by GTIG:

| GTIG category word | Category |
|---|---|
| `NEPTUNE` | North Korea |
| `CASTLE` | People's Republic of China |
| `RELIC` | Russia |
| `ION` | Iran |
| `COMET` | Cybercriminal activity |

The category word does not mean that every actor sharing it is one group. For example, separate `NEPTUNE` names represent separate North Korea-linked clusters tracked by GTIG.

## Relevant project mappings

| Previous GTIG or Mandiant name | Current GTIG name | Project treatment |
|---|---|---|
| `UNC1069`, `MASAN` | `MIDNIGHT NEPTUNE` | Use the old name for original 2026 reports and the new name for current GTIG references |
| `APT41` | `SPIRE CASTLE` | Keep APT41 where MITRE or historical sources use it; add SPIRE CASTLE as the current GTIG alias |
| `FIN11` | `RAZOR COMET` | Keep FIN11 for source-time Mandiant reporting; do not automatically merge it with every use of the CL0P extortion brand |

## Rules for reports and data

1. Do not silently replace historical names.
2. Record the publisher that created the name.
3. Record the date a new mapping became public.
4. Use aliases for search and correlation, not as automatic identity proof.
5. Preserve disagreements among MITRE, governments and vendors.
6. State confidence when claiming two labels overlap.
7. Separate an extortion brand from a tracked actor cluster when the evidence does not prove one fixed organisation.
8. Review aliases when the weekly threat watch identifies a naming change.

## Why this matters operationally

Poor alias handling can cause:

- duplicate incidents and watchlist entries;
- missed searches for an older name;
- inflated actor counts;
- incorrect attribution;
- accidental merging of unrelated infrastructure;
- misleading executive reporting.

The practical solution is an alias register that supports search while retaining source-specific meaning.

## Data file

The current machine-readable mappings are stored in:

[`data/actor-alias-register.csv`](../data/actor-alias-register.csv)

## Source

Google Threat Intelligence Group — Updated Cyber Threat Actor Naming System: https://cloud.google.com/blog/topics/threat-intelligence/updated-cyber-threat-actor-naming-system
