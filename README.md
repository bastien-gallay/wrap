# wrap

A Claude Code skill that closes out a session which reached a milestone.

A session ends in one of two states: **stopped** or **closed**. Stopped means
the work is done and the traces of doing it are still lying around. Closed
means the next arrival — a colleague, a future agent, you in six weeks — can
pick it up without reconstructing it.

`wrap` crosses that gap, using the 5S as the running order.

## The five phases

| S | What it handles |
| --- | --- |
| **Seiri** — sort | What stays, what goes. Absorbed notes deleted; un-reproducible evidence annexed; dead hypotheses retired into a table rather than erased; scratch zones emptied; deliberate non-decisions marked as such. |
| **Seiton** — set in order | Consolidate scattered notes into one source. Write `## Provenance` (absorbed-and-deleted / kept-as-annex / corrected-in-place). Re-check the canonical-vs-exploratory boundary. Refresh the index that has quietly drifted. |
| **Seiso** — clean | Grep for every superseded claim and reconcile *all* its occurrences — headers and TL;DRs included, not only body prose. Run the project's checks. Bump changed tool versions. Resolve TODOs left in the diff. |
| **Seiketsu** — standardise | Route each durable lesson by scope: topic doc, skill, contributor-facing lessons file, ADR, or dated journal. Most sessions produce zero to two. |
| **Shitsuke** — sustain | Write the entry point: what is settled, what is open (ranked, each ticketed or explicitly not), what will look like a contradiction and is not, where the deleted things went. Then propose the commits. |

## What it is not

- **Not `/do-eod`.** That runs on a clock and closes a *day*. This runs on a
  milestone and may fire three times in a week or once a month. If both apply,
  run `wrap` first — it produces the state the daily digest should describe.
- **Not a report generator.** The tidied repo is the deliverable. The only
  prose it adds is the entry-point section inside your canonical document.
- **Not autonomous with your files.** Deletions, moves, and git operations
  always confirm. Everything else it does directly and reports.

## Install

```bash
./install.sh          # symlink into ~/.claude/skills/wrap (edits propagate)
./install.sh --copy   # copy instead
```

Then type `/wrap` when a milestone lands.

## Configure

Optional but recommended. Copy `skills/wrap/templates/wrap-config.md` to
`.wrap.md` at your project root (or `.personal/wrap/config.md` to keep it out
of the repo). It declares four things:

- **Canonical locations** — the index that must match reality, where lessons
  go, where decisions go, the dated journal.
- **Verification commands** — blocking vs advisory.
- **Disposable zones** — paths Seiri need not agonise over.
- **Commit conventions** — format, scope, ticket pattern.

With no config, `wrap` infers what it can, runs anyway, says plainly that it
is unconfigured, and offers to write a `.wrap.md` at the end.

## Usage

```text
/wrap
/wrap --dry-run                 # read-only: full plan, nothing touched
/wrap --only seiso              # run a single phase
```

## Output

```text
Seiri     3 deleted, 1 annexed, 2 hypotheses retired
Seiton    6 notes → wip/ingestion-pacing/README.md; index refreshed (80 topics)
Seiso     4 docs reconciled; markdownlint ✓; lychee 2 dead links (advisory)
Seiketsu  1 lesson → AGENTS.md; nothing else generalised
Shitsuke  entry point written; 1 item open (CN2-847), 1 not ticketed
          3 commits proposed
```

Empty phases are the normal case for small milestones, and `wrap` reports them
as empty rather than manufacturing activity.

## License

MIT.
