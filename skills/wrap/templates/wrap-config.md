# .wrap.md — project configuration for the `wrap` skill

Copy this to `.wrap.md` at your project root, or to `.personal/wrap/config.md`
if you would rather keep it out of the repo. Every key is optional — a missing
key means "infer it or skip the check", never "fail".

## Canonical locations

Where things belong once `wrap` decides they belong somewhere.

- index: wip/README.md
- lessons: AGENTS.md
- skills: .claude/skills/
- decisions: architecture/adr/
- journal: infrastructure/{YYYY}-{MM}-applied-decisions.md

`index` is the table that must match reality — the one that quietly drifts.
`lessons` is the file every contributor reads. `journal` supports `{YYYY}` and
`{MM}` placeholders and is appended to, never rewritten.

## Verification commands

Run during Seiso. `blocking` failures stop the wrap; `advisory` failures are
reported and carried into the open list.

- blocking: markdownlint '**/*.md'
- blocking: uv run pytest
- advisory: lychee --offline .

## Disposable zones

Paths Seiri may propose emptying without ceremony. It still asks before
deleting — this list only means "do not agonise over these".

- scratchpad/
- wip/*.md
- .DS_Store
- .pytest_cache/

## Commit conventions

- format: <type>(<scope>): <the conclusion, lowercase>
- scope: a ticket ref, or the topic directory name
- ticket-pattern: PROJ-\d+
- one commit is one idea

## Notes

Free prose. Anything a wrap should know about this repo that the keys above
do not capture — a directory whose boundary is contested, a doc that looks
stale but is deliberately frozen, a check that is expected to fail.
