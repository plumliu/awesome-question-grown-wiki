---
name: question-grown-lint
description: >
  Audit the question-grown LLM theory wiki for schema drift, encyclopedia creep, orphan
  concepts, missing triggering questions/corrections, stale gaps, broken links, and
  unscheduled review units.
---

# Lint The Question-Grown Wiki

This linter protects the wiki from drifting into a generic knowledge base.

## Checks

1. Triggering question check
   - Every `questions/` page needs `trigger.user_question`.
   - Every `corrections/` page needs `trigger.user_claim`, `trigger.assistant_correction`,
     and `trigger.typo_or_slip_disclaimed: false`.
   - Every `concepts/`, `derivations/`, `misconceptions/`, and `bridges/` page must link
     to at least one question or correction page.

2. Concept support check
   - Flag concepts without a "Used By Questions" section.
   - Flag concepts that look like broad surveys rather than minimal support pages.

3. Review check
   - Every question page should appear in `review.md`.
   - Every question page should contain review prompts.
   - Every correction page should appear in `review.md` unless withdrawn.
   - Every correction page should contain review prompts that test the corrected fact.

4. Correction/misconception boundary check
   - Flag `misconceptions/` pages that only record one corrected factual claim and do not
     identify a broader reusable wrong mental model.
   - Flag `corrections/` pages that should link to an existing misconception because the
     same wrong model has appeared before.
   - Do not require every correction to have a related misconception.

5. Gap check
   - `gaps.md` entries should be understanding blockers, not missing encyclopedia topics.
   - Resolved gaps should link to the question/derivation that resolved them.

6. Link check
   - Detect broken wikilinks.
   - Detect orphan question/correction pages not listed in `map.md`.

7. Drift check
   - Flag directories or page types from generic second-brain schemas (`projects/`,
     `entities/`, broad `topics/`) unless explicitly justified.

8. Math formatting check
   - Flag mathematical principles, equations, or derivations not written in LaTeX.
   - Inline formulas should use `$...$`.
   - Display formulas should use `$$...$$` on their own lines.
   - Derivation pages should pair formulas with intuition.

## Output

Write a report to `reviews/YYYY-MM-DD-lint.md` and summarize:

- high-priority fixes
- encyclopedia drift
- orphaned concepts
- unscheduled questions/corrections
- stale unresolved gaps

If the user asks to fix issues, make narrow edits only. Do not rewrite the vault wholesale.
