---
name: wrap
description: >
  Close out a session that reached a milestone — a feature landed, a bug
  fixed, an investigation concluded, a document consolidated — by running a
  5S pass over the work: Seiri (sort what stays from what goes), Seiton
  (put each thing in its canonical place), Seiso (clean — reconcile every
  document carrying a now-superseded claim, run the checks), Seiketsu
  (standardise — promote the durable lesson up to where the next reader
  will meet it), Shitsuke (sustain — leave an entry point for whoever
  arrives next). Reads project config from `.wrap.md` at project root or
  `.personal/wrap/config.md`; writes one if absent. Not a
  daily ritual — it triggers on a milestone, not on a clock. Trigger: the
  user types `/wrap`, says "wrap up", "close out this milestone", "on a
  fini, range", "finalise this session", or signals that a piece of work
  has reached a stopping point worth leaving clean.
user-invocable: true
argument-hint: "[--dry-run] [--only seiri|seiton|seiso|seiketsu|shitsuke]"
---

# wrap — finish a session at a milestone

## 0. The one idea

A session ends in one of two states: **stopped** or **closed**. Stopped means
the work is done and the traces of doing it are still lying around — scratch
files, notes that duplicate each other, an index that no longer matches the
directory, three documents asserting something the session just disproved, a
lesson that exists only in this conversation's context window and will die
with it.

Closed means the next person to arrive — a colleague, a future agent, you in
six weeks — can pick the work up without reconstructing it. The gap between
stopped and closed is boring, and it is therefore almost never crossed.

This skill crosses it, using the 5S as the running order. Each S is a
different *kind* of leftover, and running them in order matters: you cannot
put things away (Seiton) before deciding what goes (Seiri), and you cannot
write a useful entry point (Shitsuke) until the docs stop contradicting each
other (Seiso).

**wrap is not `/do-eod`.** That one runs on a clock and closes a *day*. This
one runs on a *milestone* and may fire three times in a week or once a month.
If both apply, run wrap first — it produces the state that the daily digest
should describe.

## 1. Always-on directives

1. **Report what you found, not what you hoped to find.** If a phase has
   nothing to do, say "nothing" and move on. A wrap that reports five busy
   phases when three were empty teaches the user to stop reading the output.
2. **Never invent a milestone.** If the session's diff is trivial or the work
   is visibly mid-flight (failing tests, a half-written function, a doc ending
   in a dangling sentence), say so and ask whether to continue anyway.
3. **Deletions, moves, and the publication path always confirm.** Everything
   else — reconciling prose, refreshing an index, running a linter, appending
   a lesson, writing the config — you do directly and report. See §2.
4. **One commit is one idea.** Never bundle a reconciliation, a lesson
   promotion, and a cleanup into one commit because they happened in the same
   pass.
5. **A commit subject states the conclusion, not the task.** "the ACK consumer
   is not the bottleneck, measured on a live drain" — not "update notes".
6. **Supersede, do not rewrite history.** A wrong claim gets retracted in
   place with a pointer to what replaced it. It does not get silently edited
   into correctness, because the next reader may be arriving *with* the wrong
   claim in their head and needs to recognise it.
7. **No profiles.** There is one pass. A doc milestone and a bugfix milestone
   run the same five phases; each phase simply finds different things, or
   nothing.

## 2. Autonomy contract

| Action | Mode |
8. **Another session may be in this repo right now.** Before editing, check
   whether the file already carries changes that are not yours. If it does:
   do not touch it, defer whatever you were going to add, leave it uncommitted,
   and say so in the output. Re-check the remote immediately before pushing and
   rebase rather than assuming the branch you verified is still the branch you
   are pushing. One writer at a time, always — this applies to your own
   collectors (§4) as much as to a parallel session.
9. **Locate things by name, never by section number.** "the summary line at the
   end of `wip/queue-pacing/README.md`, under *What survived*" — not "§6". A
   number is unresolvable from memory and forces the reader to go hunting.
10. **Narrate once per phase, at most.** No progress prose between two tool
    calls, no restating a finding you have already reported. The file you
    changed is the deliverable; the closing table is the report. Batch
    independent commands into one call rather than one per turn.
| --- | --- |
| Reconcile a document against a superseded claim | Do it, report it |
| Refresh an index / status table | Do it, report it |
| Run lint, tests, link-check | Do it, report the output verbatim |
| Append a lesson to a durable location | Do it, report it |
| Write the next-session entry point | Do it, report it |
| Bump a tool version | Do it, report it |
| **Delete a file** | **Propose, wait** |
| **Move / relocate a file** | **Propose, wait** |
| **Edit a ticket, issue, or wiki page** | **Propose, wait** |
| Write a `.wrap.md` when none exists | Do it, report it |
| **The publication path** | **Propose, wait** |

Group the confirmations: present all of a phase's deletions and moves as one
list with a one-line reason each, and take one answer. Do not ask nine times.

**The publication path is one confirmation, not three.** Present, in a single
block: the branch state (and the new branch name if the current branch is
`main`), the commit subjects, the push target, and whether a PR/MR follows.
Ask for any out-of-sandbox or signing authorisation *there*, once, in the same
block — and honour a session-wide grant without asking again. The user should
be able to answer with one word and find the work published.

## 3. Configuration

Read, in order, the first that exists:

1. `.wrap.md` at project root
2. `.personal/wrap/config.md`

The config declares five things. Everything in it is optional; a missing key
means "figure it out or skip the check", never "fail".

```markdown
## Canonical locations
- index: wip/README.md              # the table that must match reality
- lessons: AGENTS.md                # where fleet-wide lessons go
- skills: .claude/skills/           # where operational lessons go
- decisions: architecture/adr/      # where cross-cutting decisions go
- journal: infrastructure/{YYYY}-{MM}-applied-decisions.md

## Verification commands
- blocking: markdownlint '**/*.md'
- blocking: uv run pytest
- tracker: jira PROJ / github issues # surfaces outside the repo (§Seiso)
- advisory: lychee --offline .

## Disposable zones
- scratchpad/
- wip/*.md                          # loose files that never got a topic dir
- .DS_Store

## Commit conventions
- format: <type>(<scope>): <the conclusion, lowercase>
- scope: a ticket ref or a topic dir name
- ticket-pattern: PROJ-\d+

## Notes
Free prose — including what a wrap of *this* repo learned the hard way.
```

**If no config exists**, do not stop. Run the pass using what you can infer (a
README that looks like an index, a lint command in CI config, a `.gitignore`d
scratch dir), say plainly that you are running unconfigured, and **write the
`.wrap.md` during Shitsuke** — capturing what you inferred, what this repo does
*not* have (no ADR directory, no dated journal, and where those things go
instead), and anything the pass learned the hard way. Include it in the
publication. Do not leave it as an offer at the end; the offer gets swallowed
by the commit proposal and the next run infers everything again.

## 4. Orientation — one parallel wave

The whole of orientation is read-only, and it is the bulk of the pass's cost.
Run it as **one wave of concurrent collectors**, then stop and assemble. A
collector reads, greps, and runs commands; **a collector never edits.**

| Collector | Gathers | Returns |
| --- | --- | --- |
| git | log since the last tag or the previous wrap, status, `diff --stat`, merged branches and stale worktrees | the milestone, in one sentence, plus the changed-file list |
| docs | the *unchanged* files that talk about the same subject — the grep fan-out over each claim the session touched | Seiso's work list, the one everybody forgets |
| tracker | tickets, issues, wiki pages named by the config's `tracker` key that carry a claim this session changed | proposals only, never an edit |
| checks | the config's blocking and advisory commands, started first because they are the slowest | output, verbatim |

Then, in the main pass and in this order, state each in one line:

1. **The milestone.** What concluded — "the queue-pacing investigation
   concluded: the parser is the per-work cost, and the budget closes."
2. **The blast radius.** The changed files, and the unchanged ones that talk
   about the same subject. That second set is Seiso's work list.
3. **The open thread.** Exactly one thing still open, several, or none? You
   will need this for Shitsuke.

If a previous wrap is in `git log`, derive the blast radius from the diff since
it rather than from the whole history — wrap is often run several times a day in
the same repo, and re-deriving everything is most of the waste.

If `--dry-run`, run every phase in read-only mode and present the whole plan
without touching anything.

## 5. The five phases

### Seiri (整理) — sort: what stays, what goes

Separate what has earned its place from what is merely still there.

- **Absorbed sources.** Notes whose content now lives in a consolidated
  document. These get deleted — but only after Seiton has written the
  provenance record, so sequence matters: identify here, delete after the
  consolidation exists.
- **Un-reproducible evidence.** Raw measurements, prod dumps, logs that cannot
  be regenerated. These are *never* deleted. They become annexes.
- **Dead hypotheses.** Beliefs the session killed. These do not get deleted
  either — they get promoted into a *Retired hypotheses* table (Seiton) so a
  future session arriving with one can recognise it.
- **Disposable zones.** Scratch scripts, one-off shell files, stale worktrees,
  `.DS_Store`. Propose the list.
- **Deliberately-untracked items.** Things noticed but not worth a ticket.
  Mark them as such in writing, with the reason. An unmarked non-decision
  reads as an oversight and gets re-litigated.

Output of this phase: a four-column list — *item / verdict (keep, delete,
annex, retire) / where it goes / why*. Deletions wait for confirmation.

### Seiton (整頓) — put each thing in its place

A place for everything, and the place is discoverable.

- **Consolidate.** If several documents cover what is now one subject, merge
  them into one source of truth. Open it with a dated line saying what it
  consolidated.
- **Write the `## Provenance` section.** Three groups, explicitly labelled:
  *absorbed and deleted*, *absorbed but kept as evidence annexes*, *corrected
  in place, not absorbed* (canonical pages that serve other readers and stay
  where they are). Without this, the next session hunts a deleted file.
- **Write the `## Retired hypotheses` table.** Columns: hypothesis / where it
  came from / killed by. Header it *do not re-open without new evidence*.
- **Re-check the boundary.** Does anything sit in the canonical area that is
  actually still exploratory, or vice versa? Propose the relocation.
- **Refresh the index.** The config's `index` file must match what is on disk.
  A status table listing ten topics over a directory of sixty-seven is worse
  than no table.
- **For code milestones**, the same logic applies to structure: a helper that
  now has three callers moves out of the file that spawned it; a module that
  turned out not to be shared moves back in.

### Seiso (清掃) — clean: reconcile and verify

Cleaning is not cosmetic. It is finding every surface still carrying yesterday's
claim.

- **Reconcile the blast radius.** For each superseded finding, grep the repo
  for the claim and fix *every* occurrence. Check headers, TL;DRs, and summary
  tables, not only body prose — a corrected body under a stale header is a
  document that contradicts itself twenty lines apart, and the header is what
  people read.
- **Re-derive every figure the session wrote down.** Counts, dates, versions,
  "N of M" claims — especially any that came from a subagent's report, a
  summary, or your own earlier command. These are the superseded claims most
  likely to survive the pass, because they look like facts rather than
  conclusions and nobody re-runs the command. Re-run it. Watch for shell
  aliases too: a colourising `ls` emits ANSI escapes that silently break a
  `^`-anchored grep and return a confident zero.
- **Run the verification commands** from config. Report output verbatim.
  Blocking failures stop the wrap: fix them, or say clearly that the milestone
  is not closable yet. Advisory failures get reported and carried into the
  open list. Verify that a check that reports success actually ran: a linter
  that exits 0 having linted nothing is worse than a failing one.
- **Bump versions** of any tool whose behaviour changed. Minor for a feature,
  patch for a fix, never for cosmetics.
- **Code hygiene**, where a code milestone applies: a TODO left in the diff
  either becomes a tracked item or gets deleted; commented-out code goes;
  debug logging goes; a test that was skipped to land the fix gets named in
  the open list.
- **Reconcile the surfaces outside the repo.** A ticket in `READY FOR DEV` on a
  justification this session killed is more expensive than any stale document —
  somebody picks it up tomorrow and builds on a dead premise. Report these and
  **propose** the rewording; do not edit. Prefer a comment over a field edit,
  and never touch labels: on many projects a label change moves a ticket's
  status through an automation.
- **Route what is bigger than the milestone.** A finding outside this
  milestone's scope gets a ticket, an issue comment, or a line in the open list.
  It is never silently fixed — that is scope creep with no trace — and never
  dropped.

### Seiketsu (清潔) — standardise: promote the lesson

The episode is over. What survives it?

Ask: *what did this session learn that the next one should not have to
re-learn?* Then route each lesson by scope — this is the whole phase, and
routing wrongly is the common failure:

| Scope of the lesson | Destination |
| --- | --- |
| Specific to this topic | Stays in the topic doc, as a named section |
| Operational — a procedure to follow next time | A skill (`.claude/skills/`) |
| Applies to anyone working in this repo | The `lessons` file (e.g. `AGENTS.md`) |
| A cross-cutting decision with alternatives | An ADR |
| "We applied X to environment Y on date Z" | The dated journal |

Be strict. Most sessions produce **zero to two** durable lessons. Promoting
seven means most of them were topic-specific and you just polluted the file
everyone has to read. If nothing generalises, say so — that is a normal
outcome, not a failed phase.

A lesson worth promoting is phrased as the trap plus the instance that
produced it, not as an abstraction. "A local reading extrapolated into a
global conclusion — we measured one society's queue and called it fleet
throughput" beats "be careful with metrics".
| How to *wrap this repo* — what a pass here gets wrong | `.wrap.md`, `## Notes` |

### Shitsuke (躾) — sustain: the entry point

Everything above is worthless if the next arrival cannot find it. Write, into
the canonical document, a section addressed to them. Put it near the top —
after the TL;DR, before the detail.

It answers four questions:

1. **What is settled.** One line. The conclusion, not the journey.
2. **What is still open.** One ranked list. Every item either has a ticket,
   or is explicitly marked as deliberately not ticketed with the reason.
   Nothing sits in between.
3. **What will look like a contradiction and is not.** The two or three places
   where a reader will think they have found an inconsistency — a kept annex
   that disagrees with the consolidated conclusion, a canonical page phrased
   differently on purpose. Naming these saves an hour each time.
4. **Where the deleted things went.** A pointer to `## Provenance`.

Then, and only then, propose the commits.

## 6. Output

There is no report file. **The tidied repo is the deliverable**, plus the
entry-point section. In conversation, close with a compact table:

```text
Seiri     3 deleted, 1 annexed, 2 hypotheses retired
Seiton    6 notes → wip/ingestion-pacing/README.md; index refreshed (67 topics)
Seiso     4 docs reconciled; markdownlint ✓; lychee 2 dead links (advisory)
Seiketsu  1 lesson → AGENTS.md; nothing else generalised
Shitsuke  entry point written; 1 item open (CN2-847), 1 not ticketed
          3 commits proposed
```

Then the proposed commit subjects, one per line, awaiting confirmation.

## 7. Hard rules

- Never delete an un-reproducible measurement.
- Never delete a source before its consolidated replacement exists on disk.
- Never leave a phase's finding only in the conversation — if it matters it
  goes in a file, and if it does not matter, do not report it.
- Never resolve a contradiction by picking the newer document. Determine which
  is *correct*; the newer one is sometimes the one that drifted.
- Never mark a milestone closed while a blocking check fails.
- Never commit without showing the subjects first.
- Never write "TODO" as the resolution of anything in this pass.

## 8. Anti-patterns

- **The busy wrap.** Five phases each reporting activity, because the skill
  felt obliged to produce. Empty phases are the normal case for small
  milestones.
- **The lesson dump.** Every observation promoted to `AGENTS.md`, which then
  nobody reads.
- **Body-only reconciliation.** Fixing the paragraph and leaving the header,
  the TL;DR, and the summary table asserting the old claim.
- **Silent tidying.** Deleting or moving without listing it, on the grounds
  that it was obviously junk.
- **The archaeology-proof rewrite.** Editing a wrong claim into correctness so
  cleanly that a reader still holding the wrong claim finds no trace of it and
  assumes they are in the wrong repo.
- **Wrapping mid-flight.** Running this on work that is merely paused. It
  produces a document that describes a conclusion that has not happened.

## 9. Self-check before you finish

- Does every deleted file appear in a `## Provenance` line?
- Does the index match the directory listing?
- Did I grep for the superseded claim, or only fix the files I already had
  open? Did I check the summary lines, and the surfaces outside the repo?
- Is every open item either ticketed or explicitly marked as not-ticketed?
- Would someone arriving cold, reading only the entry point, know what is
  settled and what to do next?
- Is each proposed commit one idea, with a subject that states a conclusion?
- Did the refuter get a fresh context, and did I act on what it found?
- Is there one confirmation left to give, or three?
- Never commit a file whose other changes belong to someone else's session.
- Never edit a ticket, an issue, or a wiki page without confirmation.
- **The section-number reference.** Telling the user about "§6" instead of
  naming the file and the heading. It is unresolvable from memory.
- **The narrated pass.** A message before each tool call announcing what is
  about to happen. wrap runs at the end of a long session, where every turn
  re-reads the largest context of the day; half the cost of a run is prose
  nobody needed.
- **The finding told five times.** Once in the phase narration, once in a
  detail table, once in the closing table, once in the commit body, once in
  the PR body. Once in the file, once in the table.
