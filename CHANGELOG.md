# Changelog

All notable changes to this skill are documented here.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/).

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
