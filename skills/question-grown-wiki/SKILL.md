---
name: question-grown-wiki
description: >
  Router and operating contract for the user's personal question-grown LLM theory wiki.
  Use whenever the user mentions this wiki, LLM theory learning, doubt-driven notes,
  confusion-driven notes, correction-driven notes, question-grown wiki, or asks to
  file/query/review/lint learning questions or factual corrections in Obsidian.
---

# Question-Grown LLM Theory Wiki

This is a trimmed, specialized Codex skill set. It intentionally does not expose the
general-purpose `obsidian-wiki` skills. The wiki is for modern LLM theory learning and
grows only from the user's actual questions, confusions, wrong intuitions, derivation
requests, corrected factual claims, and review attempts.

## Config

Read `~/.obsidian-wiki/config` first. It must define:

```text
OBSIDIAN_VAULT_PATH="/path/to/your/vault"
OBSIDIAN_WIKI_PROFILE="question-grown-llm-theory"
```

Then use `$OBSIDIAN_VAULT_PATH` for all vault reads/writes, and read
`$OBSIDIAN_VAULT_PATH/AGENTS.md` before any write operation. Do not assume or expose a
machine-specific local path inside this skill.

## Skill Routing

- Use `question-grown-capture` when filing a conversation, confusion, derivation, or misconception.
- Use `question-grown-capture` when the assistant corrected a factual error in the user's
  statement, unless the user later explicitly says it was a typo, slip, or wording mistake.
- Use `question-grown-query` when answering from the wiki or exploring existing links.
- Use `question-grown-review` when quizzing, scheduling, or replaying question-based review.
- Use `question-grown-lint` when auditing schema, gaps, links, or encyclopedia drift.

## Non-Negotiable Rules

1. New pages require a trigger: either a concrete user question/confusion or a corrected
   factual claim made by the user.
2. Concepts exist only to support question/correction pages.
3. Derivations must state notation, assumptions, steps, and intuition.
4. Preserve useful wrong intuitions before correcting them.
5. Preserve corrected factual errors as `correction` pages unless the user later marks them
   as typo/slip/mistyping.
6. Reviews are scheduled around question and correction pages, not concepts.
7. Do not proactively ingest papers, web pages, or large topic areas for coverage.
8. Prefer narrower pages over broad surveys.
9. Update `index.md`, `map.md`, `gaps.md`, `review.md`, `log.md`, and `hot.md` after write operations.

## First-Class Learning Units

The wiki has two first-class learning units:

- `question`: something the user asked, doubted, failed to derive, or wanted clarified.
- `correction`: a factual error, mistaken attribution, incorrect formula, wrong terminology,
  or false premise stated by the user and corrected by the assistant.

Use `correction` when the learning signal is "I thought/said X, but X was false." Use
`misconception` when the error reveals a broader, reusable wrong mental model. Link them
when both are true.

Operational boundary:

- `correction` = corrected claim. It records a concrete event: "I just said X, but the
  correct fact is Y."
- `misconception` = repaired mental model. It records a reusable pattern: "I said X because
  I was carrying broader wrong model M."
- Default to creating a `correction` first, because it is more specific and less likely to
  drift into abstract theory coverage.
- Create or link a `misconception` only when the same error pattern appears again, or when a
  single correction clearly exposes a stable wrong model that is likely to recur.
- A `correction` may stand alone without a `misconception`.
- A `misconception` should usually serve multiple questions/corrections, or one especially
  important recurring error.

Do not record a correction if the user later says the original wording was a typo, slip,
misspelling, or accidental wording issue. In that case, leave no correction page or mark any
draft as withdrawn.

## Math Formatting Contract

Use LaTeX for all mathematical principles, equations, and derivations.

- Inline formulas must be wrapped in single dollar signs, e.g. `$QK^T / \sqrt{d_k}$`.
- Display formulas on their own line must be wrapped in double dollar signs:

```markdown
$$
\operatorname{Attention}(Q, K, V) = \operatorname{softmax}\left(\frac{QK^T}{\sqrt{d_k}}\right)V
$$
```

- Do not write mathematical derivations as plain text when LaTeX would be clearer.
- When explaining a derivation, pair each important formula with a short intuition sentence.

## Directory Contract

```text
questions/        # concrete learner confusions
corrections/      # corrected factual user claims, first-class learning units
concepts/         # minimal support concepts, always linked from questions/corrections
derivations/      # requested formula/proof walkthroughs
misconceptions/   # wrong intuitions and corrected models
bridges/          # relationships between question/correction pages
reviews/          # review session logs
sources/          # explicitly used sources only
_raw/             # pasted snippets awaiting processing
_meta/            # templates/taxonomy/maintenance
index.md          # page catalog
map.md            # confusion graph
gaps.md           # unresolved understanding gaps
review.md         # question/correction review queue
log.md            # chronological operations
hot.md            # recent learning frontier
```

## Page Status

Use exactly:

- `unresolved`: confusion remains open
- `partial`: workable but incomplete model
- `clarified`: coherent answer accepted by the learner
- `needs-review`: clarified but should be tested later

## Reference Projects

This local skill set was designed by adapting ideas from:

- `references/incremental-zettelkasten`: questions are the unit of review
- `references/zettelkasten`: Capture -> Explain -> Question -> Refine -> Connect
- `references/llm-knowledge-base`: gaps, review queues, and learning-layer maintenance
