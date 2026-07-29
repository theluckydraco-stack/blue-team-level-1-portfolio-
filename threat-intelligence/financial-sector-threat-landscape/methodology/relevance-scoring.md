# Relevance Scoring Method

## Why I created this method

The project should not rank an actor first merely because it appeared first in a training exercise or has a famous name.

The central question is:

> How relevant is this actor or attack model to digital financial services during the selected period?

I use a simple weighted scoring aid to make that judgement visible and repeatable.

The score does not replace analyst judgement. It prevents the ranking from becoming an unexplained personal opinion.

## Scoring criteria

### 1. Current activity — 0 to 5, weighted twice

| Score | Meaning |
|---:|---|
| 5 | Strong public evidence of activity during 2025–2026 |
| 4 | Strong evidence during 2023–2024 with later relevance |
| 3 | Some current indications but limited detail |
| 2 | Mainly 2021–2022 evidence |
| 1 | Strongest evidence is older than 2021 |
| 0 | No credible activity evidence found |

Current activity receives double weight because the project focuses on 2023–2026.

### 2. Direct financial-sector relevance — 0 to 5, weighted twice

| Score | Meaning |
|---:|---|
| 5 | Financial institutions or financial infrastructure are primary targets |
| 4 | Repeated financial-sector targeting is well documented |
| 3 | Finance is one of several meaningful target sectors |
| 2 | Limited or indirect finance targeting |
| 1 | Mainly transferable techniques with little direct finance evidence |
| 0 | No credible financial relevance |

This also receives double weight because sector relevance is the project's main purpose.

### 3. Documented financial or operational impact — 0 to 5

This considers direct theft, extortion, customer harm, service disruption or systemic exposure.

### 4. Modern attack-surface relevance — 0 to 5

This measures relevance to:

- cloud identity and SaaS;
- third parties and suppliers;
- cryptocurrency and Web3;
- enterprise platforms;
- virtualisation and recovery;
- payment and transaction workflows.

### 5. European relevance — 0 to 3

| Score | Meaning |
|---:|---|
| 3 | Direct European targeting, victims or regulatory relevance |
| 2 | Global activity with clear European applicability |
| 1 | Limited public European connection |
| 0 | No meaningful European relevance identified |

### 6. Source quality — 0 to 2

| Score | Meaning |
|---:|---|
| 2 | Government, MITRE, vendor incident response or several reliable sources |
| 1 | Credible but limited or indirect reporting |
| 0 | Weak, unsupported or unverifiable sourcing |

## Formula

```text
Total score =
(Current activity × 2)
+ (Direct financial relevance × 2)
+ Documented impact
+ Modern attack-surface relevance
+ European relevance
+ Source quality
```

Maximum score: `35`

## Interpretation

| Score | Project use |
|---:|---|
| 30–35 | Primary current profile |
| 24–29 | Important profile or attack model |
| 18–23 | Secondary comparison |
| 12–17 | Historical or specialist context |
| 0–11 | Exclude unless a specific intelligence requirement justifies inclusion |

These bands are a project decision aid, not an industry standard.

## Current results

The full scores are stored in [`data/relevance-scoring.csv`](../data/relevance-scoring.csv).

The result supports the current order:

1. DPRK financial-theft activity
2. Scattered Spider / UNC3944
3. CL0P-branded mass exploitation
4. APT41 as a secondary comparison
5. Cobalt Group and Silence as historical banking comparators

Cobalt Group and Silence score strongly for direct banking relevance but lose priority because their strongest detailed public evidence is older than the project's current period.

## Safeguards against false precision

- A one-point difference does not prove that one actor is objectively more dangerous.
- Public reporting is incomplete and biased toward detected or disclosed incidents.
- Actor names may overlap or change.
- A local organisation's technology and geography may change the ranking.
- The weekly threat watch can revise scores when credible new evidence appears.

## Review trigger

Re-score a profile when:

- a new campaign affects financial organisations;
- a government or major research source changes attribution;
- a previously historical actor resumes current activity;
- the project's geography or sector scope changes;
- new evidence changes the assessed business impact.
