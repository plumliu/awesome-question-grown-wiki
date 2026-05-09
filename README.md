# Question-Grown Wiki

English | [中文](README-zh.md)

Stop being a mere knowledge hoarder.

Forge your "confusions" and "mental blocks" into a private, personalized Large Language
Model (LLM) theory masterclass.

`question-grown-wiki` is a minimalist skill set built specifically for Codex + Obsidian.
It was born to combat one single thing: the illusion of competence when learning modern
LLM theory.

We've all been there: bookmarking countless Transformer breakdowns, writing tens of
thousands of words in beautifully formatted notes, only to draw a complete blank when faced
with a concrete problem or formula derivation. That's because traditional "second brains"
easily degrade into digital dumpsters.

This project does the exact opposite. It's not an encyclopedia; it is a stress-tester for
understanding. Your Wiki shouldn't house grandiose concepts copy-pasted from the web. Every
single page must grow from your genuine pain points: things you truly didn't understand,
actually got wrong, or failed to derive.

## Core Philosophy: Growing from Friction

In this system, there are no all-encompassing "study plans," only surgical strikes on
specific problems. The system defines three core learning units:

### Question: Your Confusions

The real questions you've asked, doubted, failed to derive, or wanted clarified.

Example:

```text
Why do we divide by sqrt(d_k) when calculating Attention here?
```

### Correction: Your Digital Mistake Ledger

Factual errors you made that were instantly corrected by the AI. This is vastly more useful
than broad notes.

Example:

```text
I thought KV Cache stored model weights, but the AI corrected me that it stores the states of preceding tokens.
```

### Misconception: Deep-Rooted Flaws

When a specific Correction or Question resurfaces repeatedly, it exposes a more deep-seated,
flawed mental model in your head.

Example:

```text
I constantly confuse parallel computation during training with autoregressive generation during inference.
```

The design baseline is simple: default to creating a `Correction` first. Don't rush to
elevate it. Only generalize it into a `Misconception` when similar errors repeat, or a single
error clearly exposes a stable, flawed model. If it was just a typo, a slip of the tongue, or
a misspelling, simply don't record it.

## What It Does For You

This skill set enforces a very narrow, yet extremely strict Obsidian maintenance contract
for Codex:

- Rejects encyclopedias: any `concept` page must serve a real `question` or `correction`.
  Concepts without connections have no place in the vault.
- Human-readable math: all formula derivations must not only have strict formatting and clear
  assumptions, but also include intuition. Understanding the common sense behind the formula
  matters more than memorizing symbols.
- Dynamic learning frontier: Codex continuously curates `gaps.md`, `review.md`, `map.md`,
  `hot.md`, and `index.md`, keeping your blind spots, review queues, and current focus areas
  highly visible.
- Preserves the scene of the crime: it doesn't just save the "correct answer"; it preserves
  why you were wrong, where you went wrong, and how to spot the same mistake next time.

The ultimate goal isn't to give you more notes, but to leave you with fewer confusions and
misconceptions.

## The 5 Default Skills

The entire product intentionally exercises restraint, offering only five actions:

```text
question-grown-wiki      # The Manager: routes requests and enforces the master contract
question-grown-capture   # The Crime Scene Recorder: slices and files your current conversations, doubts, or corrections
question-grown-query     # The Archive Diver: finds answers strictly from your personal Wiki
question-grown-review    # The Inquisitor: quizzes and schedules reviews based on your doubts and mistakes
question-grown-lint      # The Weed Killer: cleans up broken links and weeds out encyclopedia drift
```

## How to Start

### 1. Installation

Clone this repository, then run:

```bash
bash scripts/install_codex_skills.sh
```

The script registers the trimmed skills into `~/.codex/skills` and generates a local
configuration file:

```text
~/.obsidian-wiki/config
```

### 2. Configure Your Vault

Open the configuration file and point the path to your Obsidian vault:

```text
OBSIDIAN_VAULT_PATH="/path/to/your/vault"
OBSIDIAN_WIKI_PROFILE="question-grown-llm-theory"
```

Then, open `$OBSIDIAN_VAULT_PATH` with Obsidian, and you are ready to go.

## How to Talk to It

Don't treat it like a regular note-taking tool. Treat it as your strictest LLM theory TA.
Just tell Codex directly:

```text
File my confusion about speculative decoding acceptance probability into the wiki.
Save that factual correction about the draft-token notation into a correction page.
Use question-grown-review to quiz me on this week's confusions.
Connect this beam-search mistake with the token-selection confusion I logged earlier.
Run question-grown-lint on my vault and see if any concept pages have drifted into fluff encyclopedias.
```

## Vault Contract

Your vault will maintain a rigid structure, strictly enforced by Codex:

```text
questions/        # The moments that made you scratch your head
corrections/      # Objective facts corrected by Codex
concepts/         # Minimal load-bearing concepts, not encyclopedias
derivations/      # Nitty-gritty formula derivations
misconceptions/   # Chronic, recurring wrong intuitions
bridges/          # Crucial connections between knowledge nodes
reviews/          # The mental journey of your reviews
sources/          # Explicitly cited reference materials
_raw/             # Undigested snippets
_meta/            # Templates and maintenance files
index.md          # Catalog
map.md            # Your map of understanding
gaps.md           # Blind spots blocking your progress
review.md         # The pending review queue
log.md            # Operation log
hot.md            # What you are currently obsessed with
```

## What It Absolutely Is Not

It is NOT:

- A general LLM theory encyclopedia: if you want an encyclopedia, read papers, textbooks, or
  Wikipedia.
- A generic second brain: it won't help you mindlessly hoard information.
- A paper highlight extractor: it only archives your understanding, not world knowledge.
- A pretty note generator: aesthetics are not the goal; repairing your understanding is.

It is a highly opinionated system: it forces your confusions center-stage, leaves your
mistakes right at the scene of the crime, and compacts your understanding inch by inch.

## Privacy & Publishing Hygiene

Your actual vault should be private by default. Do not upload the following local
directories to GitHub:

```text
vault/
references/
upstream/
```

Your public repository should only contain the skill sets, scripts, documentation, and empty
templates. Do not publish your real Obsidian notes, cloned reference projects, chat exports,
or local config files.

## License

MIT. See [LICENSE](LICENSE) and [NOTICE.md](NOTICE.md).

## References & Influences

This project is based on the `Ar9av/obsidian-wiki` pattern and absorbs philosophies from the
following projects:

- `incremental-zettelkasten`: questions as review units
- `joshylchen/zettelkasten`: Capture -> Explain -> Question -> Refine -> Connect
- `arturseo-geo/llm-knowledge-base`: gaps, review queues, learning-layer maintenance

The implementation here is intentionally trimmed for one job: personal, question-grown LLM
theory learning.
