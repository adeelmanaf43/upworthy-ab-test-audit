# Data sources

## File

- Name: `upworthy-archive-exploratory-packages-03.12.2020.csv`
- Where: https://osf.io/jd64p/ → Files → `upworthy-archive-datasets` folder
- OSF modified date: 2021-05-03
- Size: 14.3 MB
- Downloaded on: 2026-10-20
- Stored locally in `data-raw/` (git-ignored; not committed to this repo)

## What's in it

- Rows: 22,666 Tests: 4,873 (average ≈ 4.65 versions per test)
- These counts match the maintainers' published numbers for the exploratory dataset.
- One row means: one version (a "package") of an article inside one test.
  It records the headline and image shown to visitors, how many visitors
  were randomly assigned to it (impressions), and how many of them clicked
  (clicks). Other text fields (excerpt, lede, share text) are stored but,
  according to the maintainers, were not shown to visitors in the tests.

## Columns we will use

(meaning taken from the maintainers' "About the Archive" page, in my own words)

- clickability_test_id: the test this version belongs to. Visitors were
  randomly assigned among versions that share the same test ID.
- headline: the headline text being tested.
- eyecatcher_id: ID of the image shown with the headline. Versions with the
  same ID used the same image. Image files are not included.
- impressions: number of visitors assigned to this version. A test's total
  visitors = sum of impressions across its versions.
- clicks: number of those visitors who clicked. Click rate (CTR) =
  clicks / impressions.
- winner: TRUE if editors chose this version to use on the site after the
  test. This is an editorial decision, not a statistical result.
- created_at: when the version was created. Timezone unknown.

## Known issues

- Randomization problem: between 25 June 2013 and 10 January 2014, a
  misconfigured web cache most likely showed one version at a time instead
  of randomizing each visitor. The maintainers estimate this affects about
  22% of tests in the full archive and advise leaving tests from this
  period out of cause-and-effect analysis.
- problem column: the documentation says a 0/1 `problem` column was added
  in 2024 (the same page also calls it `randomization_imbalace_risk`).
  The OSF files are dated May 2021 and do not contain it. We will rebuild
  it from dates: 1 if a test falls between 25 June 2013 and
  10 January 2014, otherwise 0.
- significance column: the maintainers say it is NOT a statistical
  significance value, and former staff could not recover how it was
  calculated. We will not use it.
- Some tests vary only fields visitors never saw. Example: test
  `546d88fb84ad38b2ce000024` has 4 versions with identical headline and
  image (only share text and slug differ), yet one was marked winner.
  These behave like A/A tests.

## Licence and citation

- Licence: Creative Commons Attribution 4.0 International (CC BY 4.0).
  Reuse and publishing are allowed with attribution.
- Cite: Matias, J. N., Munger, K., Aubin Le Quere, M., & Ebersole, C.
  (2021). The Upworthy Research Archive, a time series of 32,487
  experiments in U.S. media. Scientific Data, 8, 195.
  https://doi.org/10.1038/s41597-021-00934-7
- Also cite the 2024 Author Correction (randomization issue):
  https://doi.org/10.1038/s41597-024-03600-w

## Open questions

1. Which date defines a test's date for the problem window? Plan: the
   earliest created_at among its versions. Because the timezone is
   unknown, tests created on or near 25 June 2013 or 10 January 2014 are
   borderline.
2. How did Upworthy split visitors between versions? Equal shares? We
   need this before checking whether impressions are balanced.
3. Should tests where all versions share the same headline (like the
   Walmart test) be excluded from the "what makes a headline win"
   analysis?
4. The confirmatory file is downloadable on OSF, but the About page says
   it is shared with researchers whose analysis plans are peer reviewed.
   Can we use it as our holdout, and how should we credit it?
