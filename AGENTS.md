# Question-Grown Wiki Project Instructions

This project builds a trimmed, Codex-friendly Obsidian workflow for a personal
question-grown LLM theory learning wiki.

Use the local trimmed skills under `skills/`:

- `question-grown-wiki`
- `question-grown-capture`
- `question-grown-query`
- `question-grown-review`
- `question-grown-lint`

Do not use the generic Ar9av `wiki-*` workflow for the live vault. The Ar9av repo under
`upstream/obsidian-wiki/` is retained as a reference implementation only.

Only the trimmed `skills/question-grown-*` files should be discoverable as active Codex
skills for this project. Upstream reference profiles must not keep a live `SKILL.md` with
the same `name:` as a trimmed skill, because duplicate skill names make routing ambiguous.

The live vault is configured by `~/.obsidian-wiki/config`:

```text
OBSIDIAN_VAULT_PATH="/path/to/your/vault"
```

The wiki must grow from the user's concrete questions, confusions, factual errors corrected
by the assistant, misconceptions, formula derivation requests, and review attempts. Do not
create broad LLM theory survey pages unless the user explicitly asks for a survey.

Treat corrected factual user claims as first-class learning units. Do not record one if the
user later explicitly says the original statement was only a typo, slip, mistyping, or
accidental wording issue.

When updating this project, keep the installed Codex surface narrow. Avoid reinstalling the
full Ar9av skill set into `~/.codex/skills/`.
