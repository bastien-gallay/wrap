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
- **`FEEDBACK.md`** — append-only intake for raw run notes, newest first,
  above the `<!-- No open feedback -->` sentinel.
- **`feedback/`** — archived batches as `YYYY-MM-DD-reviewed.md`, written
  *after* a batch has been folded into `SKILL.md`.
- **`install.sh`** — symlinks (default) or copies `skills/wrap` into
  `~/.claude/skills/wrap`. Symlink is the intended mode so edits to `SKILL.md`
  propagate live without reinstalling.

## The iteration loop (this repo's actual workflow)

The protocol is improved by running it on real milestones, then folding what
the run exposed back into the prose:

1. A real run surfaces friction → capture it verbatim in `FEEDBACK.md`, at
   the time, without deciding the fix.
2. Fold the change into `SKILL.md` — usually a new bullet in a phase under
   §5, an always-on directive in §1, or an entry in §8 anti-patterns. Record
   the *why* under `## Design decisions worth not re-litigating` below, so the
   reasoning does not live only in git history.
3. Move the consumed notes into `feedback/<date>-reviewed.md`.

**Editing `SKILL.md` during a wrap of this repo is a hazard**, not a
convenience: the install is a symlink, so the protocol changes while it is
executing and the run stops being reproducible. Capture into `FEEDBACK.md`
during the pass; edit `SKILL.md` after it closes.

**Step 1 does not work from other repos, and that is the loop's weak point.**
A wrap running in someone else's checkout cannot reach this `FEEDBACK.md`, so
friction from external runs is lost unless someone goes back through the
session transcripts. That is exactly what happened between 2026-07-21 and
07-25: 26 runs, one note. Recovering them meant parsing
`~/.claude/projects/*/*.jsonl` for `/wrap` expansions and reading the turns
that followed — feasible, and not a substitute. The naive fix (have `SKILL.md`
append to `~/.claude/skills/wrap/FEEDBACK.md`) is deliberately not folded; see
`feedback/2026-07-26-reviewed.md` for why it only works on symlink installs.

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
- **Publication is one confirmation, not three.** Splitting `commit`, `push`
  and PR into separate approvals looked like caution. In 26 observed runs it
  produced three round-trips every single time and never once caught a mistake
  the commit-subject list had not already surfaced. The confirmation still
  exists; it is just presented whole, signing authorisation included.
- **Orientation fans out, the five phases do not.** The phases are serial by
  construction — you cannot rank what to keep before you know what exists.
  What parallelises is the *reading*: a main-loop turn at the end of a long
  session carries ~245 k of cached context, a fresh collector's turn carries
  20–40 k, so a `grep` is 6–10× cheaper outside the main context. Hence four
  collectors, one barrier, one writer. Fanning out the *edits* was rejected:
  claims overlap files, so parallel writers recreate the commit-split problem
  and can clobber each other.
- **Seiketsu is never delegated.** Routing lessons to destinations requires
  having seen the whole pass, and the "zero to two lessons, be strict"
  discipline only holds in a context that watched itself accumulate candidates.
  A subagent asked to promote lessons promotes seven.
- **The glyphs are output structure, not decoration.** The Japanese names earn
  their place — they keep the five phases from collapsing into five generic
  steps — but `Seiketsu` alone is unreadable at a glance. A glyph costs one
  token per line and makes a run scannable for judgements. Two registers, kept
  distinct: five fixed phase glyphs, and a closed verdict set (✅ ⚠️ ❌ →).
- **A phase reference is a name; a section reference is a number.** `0.2.1`
  settled this rather than leaving it to be re-litigated per occurrence. The
  ban on `§n` governs what wrap says to the user and writes into their files,
  because a number is unresolvable from memory. `SKILL.md`'s own `§2` / `§4`
  cross-references are addressed to the agent executing the protocol, where the
  number *is* the section's identity, so they stay. A phase always has a name,
  so `§Seiton` is always wrong. Do not "clean up" the numeric ones.
- **Probe hygiene is a directive, not a phase split.** The 2026-08-02 usage
  report proposed splitting wrap into a read-only audit that stops, then an
  approve-and-execute phase, on the grounds that its frictions are all
  read-phase errors surfacing during the write phase. Rejected: `--dry-run`
  already offers that shape on demand, and a standing split adds a sixth gate
  to a protocol whose stated position is *publication is one confirmation, not
  three*. The frictions were not caused by phase ordering — they were caused
  by shell probes returning plausible wrong answers, which a later gate would
  have approved just as confidently. The fix is upstream of the ordering, so
  it went into the always-on directives.
- **The skill ships decoupled from every real project.** Examples use `PROJ-\d+`
  and invented topic paths. Two client ticket refs shipped in `0.1.0`'s output
  sample before anyone noticed; a skill that travels to other people's repos
  must not carry a client's identifiers in its own prose.

## Provenance

The protocol is a codification of a pattern observed across 635 commits (469
of them `docs:`) in a docs-first knowledge hub — consolidate scattered
sessions into one source, write provenance, reconcile every doc carrying the
superseded claim, retire hypotheses in a table, promote the durable lesson,
write the handoff. The 5S framing was applied afterwards; it fit without
forcing.

## State — what is open

Revised 2026-07-31, after shipping `0.3.0`. The 2026-07-21 and 07-26 lines are
kept where they are still true and marked closed where they are not.

Three open items below are marked *not ticketed*. GitHub issues exist as of
2026-07-26, so that is now a choice rather than a constraint: all three are
questions about the protocol's own design that the next run answers or does
not, and an issue would only restate this section.

- **Settled.** The protocol is written, installed at `~/.claude/skills/wrap`,
  and committed. `0.2.0` folds two feedback batches; see
  `feedback/2026-07-26-reviewed.md` for the note-to-fold ledger. `0.3.0`
  (2026-07-31) turns every confirmation gate into an `AskUserQuestion` — it did
  not come from a feedback batch but from a direct request, so nothing was
  archived out of `FEEDBACK.md` for it.
- **Open, not ticketed — the question-shaped gates are written but unexercised.**
  `0.3.0` mandates `AskUserQuestion` at every gate, with options that name
  their consequence and always one that does less. No wrap has run them. The
  session that shipped it used a question for the GPG-signing authorisation and
  then asked about publication in prose — the exact anti-pattern the release
  names, committed while the release was in flight. The prediction to check on
  the next real run: whether a batch of deletions genuinely fits four options,
  or whether the ceiling forces a shape the phase output does not have.
- **Settled 2026-07-26 — the repo is published.**
  `github.com/bastien-gallay/wrap`, public, `main` default. It had no remote at
  all until then, which is why the manifests' `homepage` and `repository` URLs
  pointed at nothing through `0.1.0` and most of `0.2.0`. The first PR (#1) set
  the precedent: a merge commit, not a squash, so the per-idea commit subjects
  survive in the history.
- **Closed 2026-07-26 (was: never run externally).** 26 runs across six repos
  between 07-21 and 07-25 exercised all five phases on real external
  milestones. Seiso carries the value in essentially every run; Seiri and
  Seiton are legitimately empty most of the time, which is the designed
  outcome, not an untested one.
- **Open, not ticketed — the parallel-collector design is written but unrun.**
  `0.2.0` describes Orientation as a fan-out of four read-only collectors plus
  a refuter. That is a prediction about cost, derived from measured averages
  (245 k cache-read per main-loop turn, 67 turns per run), not a measurement of
  the new design. If the fixed startup cost of four collectors eats the saving,
  the fallback is fewer collectors with more work each, not a return to serial
  reading.

  **Still unrun after the 2026-07-26 self-wrap.** That pass deliberately did not
  fan out: orientation in a fifteen-file repo is three commands, so four
  collectors would have cost more than they saved. The design needs a large
  repo at the end of a long session — the condition it was written for. Do not
  read a clean self-wrap as evidence either way.
- **Open, not ticketed — the feedback intake is still repo-local.** Friction
  from a run in someone else's checkout has nowhere to land. The naive fix was
  considered and deliberately not folded; the reasoning is in
  `feedback/2026-07-26-reviewed.md`.
- **Closed 2026-07-21.** This repo had no `.wrap.md` of its own during the
  self-wrap, which is how the unconfigured path got tested. One was written
  immediately afterwards. Its commit conventions section diverges from the
  template on purpose: this repo's subjects carry no type prefix, verified
  against `git log` rather than assumed.
- **Looks like a contradiction, is not.** The first commit message
  (`cd75710`) says the pattern was observed across "~590 commits". The real
  figure is 635. The message is left uncorrected on purpose — the
  *supersede, do not rewrite history* directive in `SKILL.md` says so.
  `CLAUDE.md` carries the corrected figure; the commit carries the one that was
  believed at the time.
- **Looks like a contradiction, is not.** `21a453d`'s message says a finding is
  "recorded in FEEDBACK.md". At that commit it was not — `fbe44ed`, two commits
  later, writes it. Same rule: the message stands, the later commit supersedes
  it, and `fbe44ed`'s subject says exactly that.
- **Looks like a contradiction, is not.** `.wrap.md` strikes out "there is no
  ticket tracker" and still declares no `ticket-pattern`. Both are current: the
  tracker exists as of publication, and no commit in the history references an
  issue number, so there is no pattern to match yet.

## Conventions

- **Markdown is linted with markdownlint** against `.markdownlint.jsonc`.
  `MD013` (line length) is disabled because the phase tables run wide on
  purpose; keep prose wrapped at ~78 columns to match existing style. `MD024`
  is scoped to siblings, because the changelog repeats `### Added` per release
  and each reviewed-feedback archive repeats `### What worked` per batch.
- **`.gitignore` covers five paths**: `.DS_Store`, `.personal/`, `dist/`,
  `node_modules/`, `.impeccable/`. The last is a regenerating hook cache that
  was ignored only through this clone's `.git/info/exclude` until 2026-07-26 —
  a fresh clone saw it as an untracked file.
- Version bumps live in `.claude-plugin/plugin.json` *and*
  `marketplace.json` — both, or the plugin silently freezes.
