# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with
code in this repository.

## What this repo is

A single-skill repository. It packages **one** Claude Code skill — `wrap` —
and nothing else. There is no application, no build, no test suite. The
"product" is the protocol prose itself: `SKILL.md` is the deliverable, and the
other files exist only to install, lint, and iterate on it.

## Files that matter

- **`skills/wrap/SKILL.md`** — the canonical protocol and the only file with
  real content. YAML frontmatter (`name`, `description`) drives skill
  discovery/triggering; the body is what Claude executes when invoked. Editing
  this file *is* the work. Structured as §0–§9 (the one idea → always-on
  directives → autonomy contract → configuration → orientation → the five
  phases → output → hard rules → anti-patterns → self-check). The five phase
  *slugs* under §5 are load-bearing — `--only <phase>` names them, so
  `seiri|seiton|seiso|seiketsu|shitsuke` must match the frontmatter
  `argument-hint`. The English glosses beside them are not: `SKILL.md` says
  "Seiton — put each thing in its place" where `README.md` says "set in
  order", and that divergence is fine. Only the slugs need syncing.
- **`skills/wrap/templates/wrap-config.md`** — the `.wrap.md` template users
  copy into their projects. Its four section headings (Canonical locations /
  Verification commands / Disposable zones / Commit conventions) are parsed by
  §3 of `SKILL.md`. Renaming a heading here is a breaking change.
- **`README.md`** — human-facing summary; must stay in sync with `SKILL.md`'s
  spine but is not itself executed.
- **`install.sh`** — symlinks (default) or copies `skills/wrap` into
  `~/.claude/skills/wrap`. Symlink is the intended mode so edits to `SKILL.md`
  propagate live without reinstalling.

## Design decisions worth not re-litigating

- **No milestone profiles.** An earlier draft branched on dev / fix / doc
  milestones. It was dropped: one pass, and each phase finds what it finds or
  nothing. Branching doubled the prose for a distinction the phases already
  make implicitly.
- **No report file.** The tidied repo plus the entry-point section is the
  deliverable. A separate `MILESTONE.md` was considered and rejected — it
  becomes another document to reconcile, which is the very problem Seiso
  exists to fix.
- **Deletions and git confirm; prose edits do not.** The asymmetry is
  deliberate: reconciling a stale header is reversible and tedious, deleting a
  measurement is neither.
- **Retired hypotheses are kept, not erased.** A future session may arrive
  holding a dead belief; it needs to recognise its own, which requires the
  belief to still be written down somewhere.

## Provenance

The protocol is a codification of a pattern observed across 635 commits (469
of them `docs:`) in a docs-first knowledge hub — consolidate scattered
sessions into one source,
write provenance, reconcile every doc carrying the superseded claim, retire
hypotheses in a table, promote the durable lesson, write the handoff. The 5S
framing was applied afterwards; it fit without forcing.

## Conventions

- **Markdown is linted with markdownlint** against `.markdownlint.jsonc`.
  `MD013` (line length) is disabled because the phase tables run wide on
  purpose; keep prose wrapped at ~78 columns to match existing style.
- `.DS_Store` and `.personal/` are gitignored.
- Version bumps live in `.claude-plugin/plugin.json` *and*
  `marketplace.json` — both, or the plugin silently freezes.
