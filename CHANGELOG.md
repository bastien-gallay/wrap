# Changelog

All notable changes to this skill are documented here.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/).

## [0.2.1] — 2026-07-26

### Fixed

- The config example carried `(§Seiso)` — a section-number reference inside the
  release that forbade them. A phase has a name; it now reads `(Seiso)`. Found
  by a wrap of this repo and routed rather than fixed mid-pass, because editing
  `SKILL.md` while it executes is the documented hazard.
- The rule now says what it governs: what you tell the user and what you write
  into their files. The protocol's own numbered cross-references are addressed
  to the agent executing it and stay, because a numbered section here has no
  other name — a phase always does. Written down so the next pass does not
  "fix" them.

## [0.2.0] — 2026-07-26

Folded from 26 runs across six repos, 2026-07-21 to 07-25. See
[`feedback/2026-07-26-reviewed.md`](feedback/2026-07-26-reviewed.md).

### Added

- Orientation runs as one wave of concurrent read-only collectors — git, docs
  (the grep fan-out), tracker, checks — then the five phases run serially in
  one context. Collectors never edit; there is one writer.
- A refuter pass before publication: a fresh context told to attack the closing
  table against the files on disk, targeting the stale summary line that the
  writing context cannot see.
- Phase glyphs (🗂 📍 🧹 📐 🪧) and a closed verdict set (✅ ⚠️ ❌ →), so a run
  can be scanned for judgements. Phase glosses render in the session's
  language.
- `tracker` config key: tickets, issues and wiki pages are part of the blast
  radius. Seiso proposes rewordings there and never edits without confirmation
  — a label change can move a ticket's status through an automation.
- Shitsuke writes a copy-pasteable resume block, and offers to schedule the
  reminder when an open item has a datable next action.
- Free-text arguments, documented: they narrow the scope or state the intent.
- `.wrap.md`'s `## Notes` is a Seiketsu destination — the place for what a pass
  over this repo got wrong.
- The commit-split recipe for one file carrying two ideas, with the
  `git diff --stat` check that catches a substitution which silently matched
  nothing.
- Directives for parallel sessions in the same repo, and a ranked
  recommendation at the end of every run.

### Changed

- The publication path is **one** confirmation covering branch, commits, push
  and PR/MR, including the out-of-sandbox or signing authorisation. It was
  three round-trips in every observed run.
- `.wrap.md` is now **written** during Shitsuke when absent, not offered at the
  end. The offer was swallowed by the commit proposal in four runs out of four.
- Narration is capped at once per phase, findings are stated once, and
  independent commands are batched. Half of a run's turns were prose between
  tool calls, each re-reading the largest context of the day.
- Locations are named by file and heading, never by section number.

## [0.1.0] — 2026-07-21

### Added

- Initial `wrap` skill: a 5S pass to close out a session that reached a
  milestone — Seiri (sort), Seiton (set in order), Seiso (clean), Seiketsu
  (standardise), Shitsuke (sustain).
- Per-project configuration via `.wrap.md` or `.personal/wrap/config.md`,
  declaring canonical locations, verification commands, disposable zones, and
  commit conventions. Runs unconfigured if absent and offers to bootstrap one.
- Autonomy contract: prose reconciliation, index refresh, checks, and lesson
  promotion run directly; deletions, moves, and git operations confirm first.
- `--dry-run` and `--only <phase>` flags.
- Config template at `skills/wrap/templates/wrap-config.md`.
