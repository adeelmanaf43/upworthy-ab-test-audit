# Analysis plan — Part 1

Written before looking at any results. Version 1 — 2026-10-23

## Questions

- Q1: How many apparent A/B test winners still have credible statistical support?
- Q2: Which headline features go with higher click-through, comparing
  versions within the same test?

## Unit and metrics

- Unit: a test (experiment) and its versions. One row in stg_packages = one version.
- CTR of a version = clicks / impressions.
- A difference between two versions is reported both as:
  - percentage points (pp): CTR_B − CTR_A
  - relative lift: (CTR_B − CTR_A) / CTR_A, shown in %

## Which tests count

| Rule                                                                                 | Decision                                                                                         | Reason                                                                                                                                                                           |
| ------------------------------------------------------------------------------------ | ------------------------------------------------------------------------------------------------ | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Problem period (25 Jun 2013 – 10 Jan 2014, both dates included)                      | Leave out any test with at least one version created in this period.                             | Visitors were likely not randomly assigned, so comparisons are unfair. The maintainers advise excluding these for cause-and-effect analysis.                                     |
| Test date                                                                            | Check every version's created_at. One version inside the period is enough to leave the test out. | A test touching the faulty period at either end should not count as clean. The timezone of created_at is unknown, so tests near the boundary dates will be counted and reported. |
| Versions with 0 impressions                                                          | Leave the version out.                                                                           | CTR would be 0 ÷ 0 and cannot be calculated.                                                                                                                                     |
| Minimum versions per test                                                            | At least 2 versions after the rules above.                                                       | Nothing can be compared with only one version. All 4,873 tests start with at least 2.                                                                                            |
| Tests where all versions looked identical to visitors (same headline and same image) | Q1: keep, and also report them separately. Q1 is also reported with them removed.                | Editors still declared winners in these tests, so they are part of the record and show what luck alone produces.                                                                 |
| Tests where the headline is the same in every version                                | Q2: leave out.                                                                                   | There is no headline difference to learn from.                                                                                                                                   |

## What "winner" means

1. Editors' pick: the version where editor_winner is TRUE.
2. Top observed: the version with the highest CTR within its test.
   Ties: all tied versions count as top, and the number of ties is reported.
3. Statistically supported: defined in Part 2.

## Decided in Part 2

- Statistical test and cut-off for "statistically supported"
- How to handle checking thousands of tests at once
- Smallest difference that matters in practice
- How to handle Q2 tests where the image also changes
- Holdout data for confirming results
