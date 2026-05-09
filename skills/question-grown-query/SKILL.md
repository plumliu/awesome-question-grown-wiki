---
name: question-grown-query
description: >
  Answer questions by reading the personal question-grown LLM theory wiki. Use when the
  user asks what the wiki knows, asks about prior confusions, asks how two doubts connect,
  asks about prior corrections, or asks whether a topic already exists in the wiki.
---

# Query The Question-Grown Wiki

Answer from the learner's own question-grown wiki, not from a universal theory corpus.

## Retrieval Order

1. Read `~/.obsidian-wiki/config` and `$OBSIDIAN_VAULT_PATH/AGENTS.md`.
2. Read `hot.md`, `map.md`, and `index.md`.
3. Prefer `questions/` and `corrections/` pages over `concepts/` pages.
4. Use `gaps.md` to identify unresolved points.
5. Read concept or derivation pages only when linked from relevant questions/corrections.

## Answering Rules

- State when the wiki has no user-grown question or correction about the topic.
- Cite pages using Obsidian wikilinks, for example `[[questions/foo]]`.
- Distinguish "the wiki says" from general model knowledge.
- If answering with general knowledge beyond the wiki, label it as outside-wiki context and ask
  whether to file the current confusion.
- Do not create pages during a query unless the user explicitly asks to file the result.
- Use LaTeX for mathematical principles, formulas, and derivations. Inline formulas use `$...$`;
  display formulas use `$$...$$` on their own lines.

## Query Types

- Existing confusion: summarize the question page and its current status.
- Existing correction: summarize the original user claim, the assistant correction, and any
  linked question/misconception pages.
- Relationship query: read relevant bridge pages and linked questions.
- Derivation query: read derivation pages and linked question/correction pages.
- Gap query: inspect `gaps.md` and related question statuses.
- Review readiness: inspect `review.md` and status fields.

## Output Shape

Use a compact answer:

```markdown
Based on the wiki:

...

Pages consulted: [[...]], [[...]]
Gaps: ...
```
