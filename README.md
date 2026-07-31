# wrap

A Claude Code skill that closes out a session which reached a milestone.

A session ends in one of two states: **stopped** or **closed**. Stopped means
the work is done and the traces of doing it are still lying around. Closed
means the next arrival — a colleague, a future agent, you in six weeks — can
pick it up without reconstructing it.

`wrap` crosses that gap, using the 5S as the running order.

Orientation runs first, as one wave of concurrent read-only collectors — git
state, the grep fan-out over unchanged files, the tracker, and the project's
checks. Then the five phases run in order, in one context, with one writer.

## The five phases

| S | What it handles |
| --- | --- |
| 🗂 **Seiri** — sort | What stays, what goes. Absorbed notes deleted; un-reproducible evidence annexed; dead hypotheses retired into a table rather than erased; scratch zones emptied or ignored; deliberate non-decisions marked as such. |
| 📍 **Seiton** — set in order | Consolidate scattered notes into one source. Write `## Provenance` (absorbed-and-deleted / kept-as-annex / corrected-in-place). Re-check the canonical-vs-exploratory boundary. Refresh the index that has quietly drifted. |
| 🧹 **Seiso** — clean | Grep for every superseded claim and reconcile *all* its occurrences — headers, TL;DRs and summary lines included, not only body prose. Check the surfaces outside the repo too: a ticket built on a dead premise costs more than a stale doc. Run the project's checks. |
| 📐 **Seiketsu** — standardise | Route each durable lesson by scope: topic doc, skill, contributor-facing lessons file, ADR, dated journal, or `.wrap.md` when the lesson is about wrapping this repo. Most sessions produce zero to two. |
| 🪧 **Shitsuke** — sustain | Write the entry point: what is settled, what is open (ranked, each ticketed or explicitly not), what will look like a contradiction and is not, where the deleted things went. Then the copy-pasteable resume block, and the publication. |

The glyphs are load-bearing in the output, not decoration: they let a run be
scanned for judgements. The gloss beside each slug is rendered in the language
of the session.

## What it is not

- **Not `/do-eod`.** That runs on a clock and closes a *day*. This runs on a
  milestone and may fire three times in a week or once a month. If both apply,
  run `wrap` first — it produces the state the daily digest should describe.
- **Not a report generator.** The tidied repo is the deliverable. The only
  prose it adds is the entry-point section inside your canonical document.
- **Not autonomous with your files.** Deletions, moves, ticket edits, and the
  publication path always confirm. Everything else it does directly and
  reports. Publication is *one* confirmation covering branch, commits, push and
  PR — not three.
- **Not a prose ask.** Every gate is a question with named options — what each
  answer does, and always one that does less. Nothing gets approved by not
  objecting to a sentence.

## Install

```bash
./install.sh          # symlink into ~/.claude/skills/wrap (edits propagate)
./install.sh --copy   # copy instead
```

Then type `/wrap` when a milestone lands.

## Configure

Optional. Copy `skills/wrap/templates/wrap-config.md` to `.wrap.md` at your
project root (or `.personal/wrap/config.md` to keep it out of the repo). It
declares five things:

- **Canonical locations** — the index that must match reality, where lessons
  go, where decisions go, the dated journal, and the tracker whose tickets can
  also carry a superseded claim.
- **Verification commands** — blocking vs advisory.
- **Disposable zones** — paths Seiri need not agonise over.
- **Commit conventions** — format, scope, ticket pattern.
- **Notes** — free prose, including what a pass over *this* repo got wrong last
  time.

With no config, `wrap` infers what it can, runs anyway, says plainly that it is
unconfigured, and **writes the `.wrap.md` itself** during Shitsuke, capturing
what it inferred and what the repo does not have. Offering it at the end
instead meant the offer got swallowed by the commit proposal and the next run
inferred everything again.

## Usage

```text
/wrap
/wrap --dry-run                 # read-only: full plan, nothing touched
/wrap --only seiso              # run a single phase
/wrap for picking up tomorrow   # free text narrows the scope, or states intent
```

## Output

```text
🗂 Seiri       3 deleted, 1 annexed, 2 hypotheses retired
📍 Seiton      6 notes → wip/queue-pacing/README.md; index refreshed (67)
🧹 Seiso       4 docs reconciled ⚠️ · markdownlint ✅ · lychee ⚠️ 2 dead links
               → PROJ-412's justification is dead, reword proposed not applied
📐 Seiketsu    1 lesson → AGENTS.md; nothing else generalised
🪧 Shitsuke    entry point written; 1 open (PROJ-419), 1 not ticketed
```

Verdict glyphs are a closed set — ✅ clean · ⚠️ finding · ❌ blocking · → routed
elsewhere. Then the publication block, one confirmation, and a ranked
recommendation of what to do next.

Empty phases are the normal case for small milestones, and `wrap` reports them
as empty rather than manufacturing activity.

## License

MIT.
