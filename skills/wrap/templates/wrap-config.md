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
`{MM}` placeholders and is appended to, never rewritten. `tracker` names the
surfaces *outside* the repo that Seiso must also check for superseded claims —
a ticket sitting in `READY FOR DEV` on a premise the session just killed is
more expensive than any stale document. wrap proposes rewordings there; it
never edits a ticket without confirmation.

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

This section is also where a *wrap of this repo* records what it got wrong, so
the next pass does not repeat it: "a merged branch's commits never appear on
`main` here, PRs are squash-merged — verify removal against the PR state", or
"the generated caches under `.tooling/` get ignored, not deleted, since
they regenerate". Seiketsu routes lessons of that shape here rather than into the
contributor-facing lessons file, which is for people, not for the pass.
