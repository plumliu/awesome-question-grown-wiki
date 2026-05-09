---
name: question-grown-review
description: >
  Run or maintain question/correction-based review for the LLM theory wiki. Use when the
  user asks to review, quiz, test understanding, rehearse a derivation, revisit open
  questions, revisit corrected factual errors, or schedule follow-up learning prompts.
---

# Question-Based Review

The unit of review is a question page or correction page. Concepts are hidden support
structures whose mastery is inferred through answers to questions and corrected-claim
reconstruction.

## Before Review

1. Read `~/.obsidian-wiki/config` and `$OBSIDIAN_VAULT_PATH/AGENTS.md`.
2. Read `review.md`, `gaps.md`, `map.md`, and `hot.md`.
3. Select due questions/corrections, or use the user's requested topic to select learning
   unit pages.

## Review Protocol

For each question or correction:

1. Ask a reconstruction prompt without showing the answer.
2. Let the user answer.
3. Compare against the relevant question/derivation/concept pages.
4. Give feedback on:
   - what mental model worked
   - what was missing
   - whether the old misconception resurfaced
   - whether the old factual error resurfaced
   - what connected question this now touches
5. Ask the user to rate the attempt: `again`, `hard`, `good`, or `easy`.
6. Update `review.md` and, if useful, append a note under `reviews/YYYY-MM-DD.md`.

Use LaTeX when reviewing mathematical content. Inline formulas use `$...$`; display formulas
use `$$...$$` on their own lines. If a review exposes a formula or derivation gap, write the
corrected math in LaTeX.

## Scheduling

Use simple intervals:

- `again`: tomorrow
- `hard`: 2 days
- `good`: 5 days
- `easy`: 14 days

Keep the schedule lightweight. The important artifact is the evolving question/correction
page, not a perfect spaced-repetition algorithm.

## Writebacks

For correction pages, the review prompt should ask the user to reconstruct:

- the original false claim
- the corrected fact
- why the false claim fails
- how it connects to a question or misconception

If review reveals new confusion:

- Update the existing question status to `partial` or `unresolved`.
- Add a blocker to `gaps.md`.
- Add a bridge if the answer connects two existing questions.
- Update `hot.md`.

If review reveals a correction was only a typo/slip:

- Mark the correction as withdrawn or delete it if it has no useful links.
- Remove it from `review.md`.
- Add a short note to `log.md`.

Do not create broad new concept pages during review unless a missing concept is directly
blocking the reviewed question/correction.
