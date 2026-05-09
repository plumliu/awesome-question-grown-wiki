# Question-Grown Wiki Design Notes

This local setup keeps `Ar9av/obsidian-wiki` as a reference implementation, but the
installed Codex surface is a trimmed skill set under `skills/`. The goal is to avoid
generic second-brain behavior and keep the vault question-grown.

Reference ideas:

- `references/incremental-zettelkasten`: questions are the unit of review.
- `references/zettelkasten`: CEQRC workflow, Capture -> Explain -> Question -> Refine -> Connect.
- `references/llm-knowledge-base`: gaps, review queues, and learning-layer maintenance.

First-class learning units:

- `question`: a user-raised doubt, confusion, derivation request, or review failure.
- `correction`: a factual user claim corrected by the assistant, unless the user later says
  the original wording was a typo, slip, or mistyping.

`misconception` remains a support page for reusable wrong mental models. A correction can
link to a misconception when a one-off factual error reveals a deeper pattern.

Operational boundary:

- `correction` records an event-level corrected claim: "I just said X, but the correct fact
  is Y."
- `misconception` records a reusable wrong model: "I said X because I was carrying broader
  wrong model M."
- Default to `correction`. Create/link `misconception` after repetition, or when a single
  correction clearly exposes a stable recurring model.
- A correction can stand alone; a misconception should usually support multiple
  questions/corrections or one especially important recurring error.

Local directories:

```text
skills/                           # trimmed skills installed into Codex
upstream/obsidian-wiki/           # reference framework, not exposed by default
references/incremental-zettelkasten/
references/zettelkasten/
references/llm-knowledge-base/
vault/                            # initial Obsidian vault
```

The active skill namespace must stay unambiguous. The canonical `question-grown-wiki` skill
is `skills/question-grown-wiki/SKILL.md`; any upstream profile with the same name should be
kept as a reference document, not a discoverable `SKILL.md`.

Install with:

```bash
bash scripts/install_codex_skills.sh
```

Use `question-grown-capture`, `question-grown-query`, `question-grown-review`, and
`question-grown-lint` for day-to-day work.
