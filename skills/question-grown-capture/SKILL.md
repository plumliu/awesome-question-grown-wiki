---
name: question-grown-capture
description: >
  File the current learning conversation, confusion, requested derivation, misconception,
  corrected factual error, or unresolved doubt into the question-grown LLM theory Obsidian
  wiki. Use when the user says to capture, save, file, organize, add to the wiki, or turn
  this into a question/correction page.
---

# Capture A Learning Confusion

You convert the user's current LLM theory learning moment into a small set of linked
Obsidian pages. You are not building a general knowledge base.

## Before Writing

1. Read `~/.obsidian-wiki/config`.
2. Read `$OBSIDIAN_VAULT_PATH/AGENTS.md`.
3. Read `hot.md`, `index.md`, `map.md`, `gaps.md`, and `review.md`.
4. Identify the triggering user question or corrected factual claim. If there is no concrete
   confusion and no assistant-corrected factual error, ask the user for the exact learning
   signal before writing.
5. If the user later says the corrected statement was a typo, slip, misspelling, or accidental
   wording issue, do not create a correction page for it.

## Math Formatting

Use LaTeX for all mathematical principles, formulas, and derivations. Inline formulas use
single dollar signs, such as `$p_\theta(y \mid x)$`. Display formulas use `$$` on their own
lines. Every derivation page must use LaTeX for equations and include intuition around the
formulas.

## CEQRC Workflow

1. Capture
   - Preserve the user's question in their own terms.
   - Preserve the user's corrected factual claim in their own terms when the trigger is a
     correction.
   - Preserve wrong or incomplete intuitions if they matter.
   - Decide page types: question, correction, derivation, misconception, bridge, minimal concept.
   - Default to `correction` for a one-off factual error. Do not upgrade it to
     `misconception` merely because the claim was wrong.

2. Explain
   - Write the smallest explanation that resolves or narrows the confusion.
   - For corrections, state the corrected fact and why the original claim was false.
   - Avoid broad survey sections.

3. Question
   - Add 2-4 review prompts to the question page when the trigger is a question.
   - Add 2-4 review prompts to the correction page when the trigger is a correction.
   - Prompts should test reconstruction and mental-model repair, not wording.

4. Refine
   - Assign `status: unresolved`, `partial`, `clarified`, or `needs-review`.
   - Add unresolved blockers to `gaps.md`.
   - If a correction exposes a deeper missing model, link or create a narrow misconception page.
   - Create or link a `misconception` only when the same error pattern appears again, or when
     the current correction clearly reveals a stable wrong model likely to recur.

5. Connect
   - Link to existing questions before creating concepts.
   - Create concepts only if multiple pages need a shared support node, or if the concept is
     required to make the current question understandable.
   - Link corrections to affected questions and misconceptions.

## Correction vs Misconception Boundary

Use this decision rule:

- If it can be written as "I just said X, but the correct fact is Y", create a `correction`.
- If it can be written as "I said X because I was carrying broader wrong model M", create or
  link a `misconception`.

Practical capture policy:

- Default to `correction`, because it is event-level and concrete.
- A `correction` can exist without any related `misconception`.
- A `misconception` should usually support multiple questions/corrections, or one especially
  important recurring error.
- If the user says the original wording was a typo, slip, misspelling, or accidental wording
  issue, do not create a correction; if one exists only as a draft, mark it withdrawn or
  remove it.

## Page Templates

### Question

```markdown
---
title: "Natural question title"
type: question
status: partial
created: YYYY-MM-DD
updated: YYYY-MM-DD
trigger:
  source: conversation
  user_question: "..."
concepts: []
derivations: []
related_questions: []
tags: [llm-theory]
summary: "..."
---

# Natural question title

## Triggering Question

## Why This Was Confusing

## Current Explanation

## Minimal Prerequisites

## Related Derivations

## Links to Concepts

## Status

## Review Prompts
```

### Derivation

```markdown
---
title: "..."
type: derivation
created: YYYY-MM-DD
updated: YYYY-MM-DD
trigger_question: "[[questions/...]]"
tags: [llm-theory, derivation]
summary: "..."
---

# Title

## Target Result

## Notation

## Assumptions

## Step-by-Step Derivation

## Intuition After Each Step

## Where Users Usually Get Lost

## Related Questions
```

### Correction

Use this when the user made a factual claim that the assistant corrected, and the user did
not later mark it as a typo/slip/mistyping.

```markdown
---
title: "Corrected factual claim"
type: correction
status: needs-review
created: YYYY-MM-DD
updated: YYYY-MM-DD
trigger:
  source: conversation
  user_claim: "..."
  assistant_correction: "..."
  typo_or_slip_disclaimed: false
affected_questions: []
related_misconceptions: []
concepts: []
tags: [llm-theory, correction]
summary: "..."
---

# Corrected factual claim

## Triggering Claim

## Correction

## Why The Original Claim Was False

## Corrected Model

## Related Questions

## Related Misconceptions

## Review Prompts
```

### Misconception

```markdown
---
title: "..."
type: misconception
created: YYYY-MM-DD
updated: YYYY-MM-DD
questions: []
tags: [llm-theory, misconception]
summary: "..."
---

# Title

## Initial Intuition

## Why It Felt Plausible

## Where It Breaks

## Corrected Model

## Questions Affected
```

## Required Maintenance

After writing pages:

- Update `index.md` with one-line summaries.
- Update `map.md` with question/correction-to-question, question/correction-to-concept, and
  correction-to-misconception edges.
- Update `gaps.md` with unresolved blockers.
- Add or update the question or correction in `review.md`.
- Append an operation to `log.md`.
- Rewrite `hot.md` to summarize the current learning frontier.

## Quality Gate

Before final response, verify:

- Every new concept has a "Used By Questions" section.
- Every new question has review prompts.
- Every new correction has `trigger.user_claim`, `trigger.assistant_correction`, and review prompts.
- Every derivation has notation and assumptions.
- No broad encyclopedia pages were created.
