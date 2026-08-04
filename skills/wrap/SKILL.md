---
name: wrap
description: >
  Close out a session that reached a milestone — a feature landed, a bug
  fixed, an investigation concluded, a document consolidated — by running a
  5S pass over the work: Seiri (sort what stays, what goes), Seiton
  (put each thing in its place), Seiso (clean — reconcile every
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
argument-hint: "[--dry-run] [--only seiri|seiton|seiso|seiketsu|shitsuke] [free text: scope or intent]"
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

Free-text arguments are honoured: they either **narrow the scope** ("only the
wrap skill") or **state the intent** ("for picking this up tomorrow morning",
which makes Shitsuke's handoff the centre of the pass).

## 1. Always-on directives

1. **Report what you found, not what you hoped to find.** If a phase has
   nothing to do, say "nothing" and move on. A wrap that reports five busy
   phases when three were empty teaches the user to stop reading the output.
2. **Never invent a milestone.** If the session's diff is trivial or the work
   is visibly mid-flight (failing tests, a half-written function, a doc ending
   in a dangling sentence), say so and ask whether to continue anyway.
3. **Deletions, moves, and the publication path always confirm.** Everything
   else — reconciling prose, refreshing an index, running a linter, appending
   a lesson, writing the config — you do directly and report. Every
   confirmation is asked with **AskUserQuestion**, never as prose the user has
   to answer by typing. See §2.
4. **One commit is one idea.** Never bundle a reconciliation, a lesson
   promotion, and a cleanup into one commit because they happened in the same
   pass. When one file carries two ideas, see §6.
5. **A commit subject states the conclusion, not the task.** "the ACK consumer
   is not the bottleneck, measured on a live drain" — not "update notes".
6. **A command's output is a claim until you know the command ran.** Every
   phase produces facts from a shell: Seiri reads git, Seiso runs the checks,
   the collectors do both. A probe that fails in a way that *looks like an
   answer* is worse than one that errors, because it gets written into a file
   and outlives the pass. The known ways this protocol has produced a
   confidently wrong number: `$?` after a pipeline reports the last command's
   status, not the one you care about — use `set -o pipefail`, which works in
   both shells, and know that the array is `${PIPESTATUS[0]}` in bash but
   `${pipestatus[1]}` in zsh, where the bash spelling silently returns an empty
   string; an unquoted expansion word-splits and surveys the wrong
   branches; `cd` does not persist between tool calls, so a linter runs in the
   wrong directory and passes; a colourising `ls` emits ANSI escapes that
   silently break a `^`-anchored grep; `grep` skips a file it classified as
   binary unless given `-a`, and mis-reads ISO-8859-1 without `LC_ALL=C`; an
   argument that does nothing never reaches the check the probe was meant to
   exercise — `osascript -e 'keystroke ""'` succeeds *without* accessibility
   permission, so a wait loop built on it reports a permission granted while
   every real keystroke is being denied. Reading a cache is not reading the
   thing: `git branch -r` with no
   `fetch --prune` lists branches that were deleted on merge, which is how a
   deletion gate comes to ask for four things and deliver one.
7. **Supersede, do not rewrite history.** A wrong claim gets retracted in
   place with a pointer to what replaced it. It does not get silently edited
   into correctness, because the next reader may be arriving *with* the wrong
   claim in their head and needs to recognise it.
8. **No profiles.** There is one pass. A doc milestone and a bugfix milestone
   run the same five phases; each phase simply finds different things, or
   nothing.
9. **Another session may be in this repo right now.** Before editing, check
   whether the file already carries changes that are not yours. If it does:
   do not touch it, defer whatever you were going to add, leave it uncommitted,
   and say so in the output. Re-check the remote immediately before pushing and
   rebase rather than assuming the branch you verified is still the branch you
   are pushing. Ask that question with the range in the right direction:
   `git log HEAD..origin/main` is what tells you the default branch moved;
   `git log origin/main..HEAD` lists what your branch has *in addition* and
   returns the same thing whether you are current or three commits behind. One
   writer at a time, always — this applies to your own collectors (§4) as much
   as to a parallel session.
10. **Locate things by name, never by section number.** "the summary line at
    the end of `wip/queue-pacing/README.md`, under *What survived*" — not
    "§6". A number is unresolvable from memory and forces the reader to go
    hunting. This governs what you say to the user and what you write into
    their files. The numbered cross-references in *this* document — `§1`, `§2`,
    `§4`, `§6` and the `§1.n` forms — are addressed to you and stay: a numbered
    section here has no other name. A *phase* always does — write "Seiton",
    never "§Seiton".
11. **Narrate once per phase, at most.** No progress prose between two tool
    calls, no restating a finding you have already reported. The file you
    changed is the deliverable; the closing table is the report. Batch
    independent commands into one call rather than one per turn.

## 2. Autonomy contract

| Action | Mode |
| --- | --- |
| Reconcile a document against a superseded claim | Do it, report it |
| Refresh an index / status table | Do it, report it |
| Run lint, tests, link-check | Do it, report the output verbatim |
| Append a lesson to a durable location | Do it, report it |
| Write the next-session entry point | Do it, report it |
| Write a `.wrap.md` when none exists | Do it, report it |
| Bump a tool version | Do it, report it |
| **Delete a file** | **Propose, wait** |
| **Move / relocate a file** | **Propose, wait** |
| **Edit a ticket, issue, or wiki page** | **Propose, wait** |
| **The publication path** | **Propose, wait** |

Group the confirmations: present all of a phase's deletions and moves as one
list with a one-line reason each, and take one answer. Do not ask nine times.

### How a confirmation is asked

Every gate in the right-hand column above goes through **AskUserQuestion** —
one call per gate, never one per item, never a prose question the user has to
answer by typing.

- **The list comes first, the question second.** Write the items out — the
  four-column Seiri list, the commit subjects, the proposed reword — then ask.
  The question's options act on the whole batch; they do not re-enumerate it.
  Four options is the ceiling, and a batch of nine deletions does not fit, so
  do not try.
- **An option names the action and its consequence**, not consent. "Delete the
  6 scratch files — none is referenced, `wip/` becomes the index it claims to
  be" beats "Yes, proceed". The user is choosing between outcomes, not
  approving a request.
- **Always offer one option that does less** — keep everything, delete all but
  the annexes, commit without pushing. A single-option question is an
  announcement wearing a question's clothes, and it teaches the user to click
  through the next one without reading. Free text is always available to the
  user for the "all except that one" answer; do not build it into the options.
- **The header is the gate**: `Deletions`, `Moves`, `Tracker`, `Publish`.
- **Never ask about the left-hand column.** A question about reconciling a
  stale header spends the user's attention on the thing they installed this
  skill to stop doing.

Two gates outside the table use the same mechanism: the *milestone check* when
the work looks mid-flight (§1.2) — continue anyway, or stop here — and
Shitsuke's *reminder* offer.

**The publication path is one confirmation, not three.** Present, in a single
block: the branch state (and the new branch name if the current branch is
`main`), the commit subjects, the push target, and whether a PR/MR follows.
Then one AskUserQuestion, header `Publish`, whose options are the stopping
points — commit + push + PR, commit + push, commit only, hold. State any
out-of-sandbox or signing authorisation the path needs in the question text, so
the answer grants it once; honour a session-wide grant without asking again.
The user should be able to answer with one click and find the work published.

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
- tracker: jira PROJ / github issues # surfaces outside the repo (Seiso)

## Verification commands
- blocking: markdownlint '**/*.md'
- blocking: uv run pytest
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

**Invoking wrap is the request for these subagents**, and for the refuter (§6).
Some harnesses stand off subagents unless the user asked for them; a user who
typed `/wrap` asked for this wave and that one pass, and for nothing else — no
other part of the protocol needs a subagent, so this does not become a general
permission. If the harness refuses anyway, read serially in this context and
declare the degradation the way the refuter does; never let the authorisation be
read as licence to substitute your own reading and report it as the wave.

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

Each phase is named by its glyph, its slug, and a gloss **in the language of
the session**. The slug is what `--only` takes; the glyph is what makes a
finding findable when the output is scanned rather than read.

### 🗂 Seiri (整理) — sort: what stays, what goes

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
  `.DS_Store`. Propose the list. Some things are better *ignored* than deleted:
  a generated cache that regenerates is a cleanup you would redo every pass.
- **Deliberately-untracked items.** Things noticed but not worth a ticket.
  Mark them as such in writing, with the reason. An unmarked non-decision
  reads as an oversight and gets re-litigated.

Output of this phase: a four-column list — *item / verdict (keep, delete,
annex, retire) / where it goes / why*. Deletions wait for confirmation.

**Verify each target still exists before you list it.** A deletion gate spends
the user's attention, and spending it on something already gone teaches them
the list is not checked. Remote branches are the standing case: `git branch -r`
is a local cache, and a host that deletes the branch on merge leaves the
tracking ref behind until a `fetch --prune` runs. Prune first, then survey. The
same applies to a file another session removed while this one was working.

### 📍 Seiton (整頓) — put each thing in its place

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

### 🧹 Seiso (清掃) — clean: reconcile and verify

Cleaning is not cosmetic. It is finding every surface still carrying yesterday's
claim.

- **Reconcile the blast radius.** For each superseded finding, grep the repo
  for the claim and fix *every* occurrence. Check headers, TL;DRs, and summary
  tables, not only body prose — a corrected body under a stale header is a
  document that contradicts itself twenty lines apart, and the header is what
  people read. Summary lines are where superseded claims survive longest,
  because they read as facts; one has survived an entire consolidation pass.
- **The blast radius is not only your own diff.** Commits that landed on the
  default branch while the session ran can falsify prose you wrote minutes ago,
  and they appear in no diff of your branch — a doc stating "there is no such
  setting yet" was false the minute it was typed, because the setting had just
  been merged upstream. Fetch, read what moved (`git log HEAD..origin/main`),
  and re-check every claim of absence the session wrote against it.
- **Re-derive every figure the session wrote down.** Counts, dates, versions,
  "N of M" claims — especially any that came from a subagent's report, a
  summary, or your own earlier command. These are the superseded claims most
  likely to survive the pass, because they look like facts rather than
  conclusions and nobody re-runs the command. Re-run it, under the probe
  discipline in §1 — this is the phase where a broken probe becomes a
  published figure.
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

### 📐 Seiketsu (清潔) — standardise: promote the lesson

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
| How to *wrap this repo* — what a pass here gets wrong | `.wrap.md`, `## Notes` |

Be strict. Most sessions produce **zero to two** durable lessons. Promoting
seven means most of them were topic-specific and you just polluted the file
everyone has to read. If nothing generalises, say so — that is a normal
outcome, not a failed phase.

A lesson worth promoting is phrased as the trap plus the instance that
produced it, not as an abstraction. "A local reading extrapolated into a
global conclusion — we measured one shard's queue and called it cluster
throughput" beats "be careful with metrics".

### 🪧 Shitsuke (躾) — sustain: the entry point

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

**You are writing this before the publication gate, so do not assert what the
gate is about to change.** "Not yet published", "nothing is committed", "the
manifests are at 0.5.0 but the branch is unmerged" — every one of those is false
within the minute if the user answers *publish*, and nothing later in the pass
re-reads this section. Write the state as of the writing, dated, and leave the
publication claim for after it happens. The correction is in Publication and
output; this is the half you control.

Then two things the user should not have to ask for:

- **The resume block.** Three or four lines, copy-pasteable as the opening
  message of a fresh session: where the work is, what to read first, what the
  next action is. Fenced, so it can be copied without cleanup.
- **The reminder**, if the open list has a datable next action. Offer it as a
  question with the date in the option; do not schedule silently.

## 6. Publication and output

There is no report file. **The tidied repo is the deliverable**, plus the
entry-point section.

Before proposing anything, run one **refuter**: a fresh-context read of the
closing table against the files on disk, told to attack it rather than confirm
it. This costs one collector and it targets the failure this protocol misses
most often — the summary line that survived the correction of its own body. A
context that has just written something is the worst judge of whether it is
true.

Invoking wrap is the request for it (§4). **If you cannot spawn one anyway, say
so in the closing table and name what went unverified** — `❌ refuter unavailable, closing table unattacked`. Do not
re-read your own claims and call it a refuter; that is the check the step
exists to replace. A session may forbid subagents, or none may be available;
that is a degraded pass, not a complete one, and the user decides whether a
degraded pass is enough. Silently skipping it reports a verification that did
not happen.

**When one file carries two ideas** (§1.4), do not bundle and do not reach for
interactive staging, which is unavailable here. Move the second idea's text out
of the file, stage and commit the first, then restore it. Then verify: `git
diff --stat` must show the number of changed lines you expect. A scripted
substitution that silently matched nothing looks exactly like a successful one.

**Read the host off the remote; never assume one.** `git remote -v` decides
whether the pull request is `gh` or the merge request is `glab`, and a repo
that answers to neither is one where the publication path stops at the push.
Many orgs run both, and a guess costs the wrong tool at the last step of the
pass — after every gate has already been answered, which is the most expensive
place to be wrong.

**The pass does not end at the push.** Once the publication path completes, go
back and read the entry point Shitsuke wrote, because the answer to the gate
falsified part of it: a version it called unreleased is released, a branch it
called unmerged is merged, a commit count it stated is now one squash. Fix what
the publication changed, name the commit or the PR that did it, and say in the
closing table that you did. This is a *reconciliation*, not a gate — do it and
report it, do not ask.

Verify the landing rather than reporting it from the answer: read the merge
commit and its parents, confirm the branch state on the remote, and re-read the
entry point on the merged result, not on the branch. An answered `Publish`
question does not guarantee the path completed.

Close in conversation with a compact table — glyph, slug, gloss in the
session's language:

```text
🗂 Seiri       3 deleted, 1 annexed, 2 hypotheses retired
📍 Seiton      6 notes → wip/queue-pacing/README.md; index refreshed (67)
🧹 Seiso       4 docs reconciled ⚠️ · markdownlint ✅ · lychee ⚠️ 2 dead links
               → PROJ-412's justification is dead, reword proposed not applied
📐 Seiketsu    1 lesson → AGENTS.md; nothing else generalised
🪧 Shitsuke    entry point written; 1 open (PROJ-419), 1 not ticketed
```

Verdict glyphs are a closed set: ✅ clean · ⚠️ finding · ❌ blocking · → routed
elsewhere. They mark the judgement, so the output can be scanned for judgements
alone.

Then the publication block (§2), and last, **what you would do next, ranked**.
A recommendation, with the reason in half a line — the pass has just read
everything, and the user should not have to ask "so what do you advise?". Write
the ranking as prose. Only when its top item is actionable in this session does
it also become a question, recommendation first; a ranking of things to do next
week is a paragraph, not a gate.

## 7. Hard rules

- Never delete an un-reproducible measurement.
- Never delete a source before its consolidated replacement exists on disk.
- Never leave a phase's finding only in the conversation — if it matters it
  goes in a file, and if it does not matter, do not report it.
- Never resolve a contradiction by picking the newer document. Determine which
  is *correct*; the newer one is sometimes the one that drifted.
- Never mark a milestone closed while a blocking check fails.
- Never commit without showing the subjects first.
- Never commit a file whose other changes belong to someone else's session.
- Never edit a ticket, an issue, or a wiki page without confirmation.
- Never take a confirmation from prose. If it gates a deletion, a move, a
  ticket edit, or the publication, it is an AskUserQuestion.
- Never write "TODO" as the resolution of anything in this pass.
- Never report a pass as complete when the refuter did not run. Name the gap.
- Never leave the entry point asserting a publication state the gate changed.

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
- **The buried ask.** "I'll delete these three and push — let me know if that's
  wrong." A confirmation the user has to notice, then type an objection to, is
  not a confirmation; it is a notification with a disclaimer.
- **The rubber-stamp question.** One option, or two options that differ only in
  wording. The user learns to click the first one, and the gate that mattered
  three phases later gets the same reflex.
- **The confident zero.** A probe returns nothing and the nothing is read as an
  absence — no stale claims, no dead links, no branches to prune. Empty output
  is the shape a clean result and a broken command both take, and only one of
  them is worth reporting.
- **The archaeology-proof rewrite.** Editing a wrong claim into correctness so
  cleanly that a reader still holding the wrong claim finds no trace of it and
  assumes they are in the wrong repo.
- **Wrapping mid-flight.** Running this on work that is merely paused. It
  produces a document that describes a conclusion that has not happened.
- **The section-number reference.** Telling the user about "§6" instead of
  naming the file and the heading. It is unresolvable from memory.
- **The narrated pass.** A message before each tool call announcing what is
  about to happen. wrap runs at the end of a long session, where every turn
  re-reads the largest context of the day; half the cost of a run is prose
  nobody needed.
- **The entry point that describes the pass instead of the result.** "Folded and
  versioned, not yet published — nothing is committed, pushed or merged", left
  standing after the user answered *publish*. It reads as a status and is a
  snapshot of a moment that ended mid-sentence, and the next arrival believes it
  because the entry point is the one section written for them.
- **The finding told five times.** Once in the phase narration, once in a
  detail table, once in the closing table, once in the commit body, once in
  the PR body. Once in the file, once in the table.

## 9. Self-check before you finish

- Does every deleted file appear in a `## Provenance` line?
- Does the index match the directory listing?
- Did I grep for the superseded claim, or only fix the files I already had
  open? Did I check the summary lines, and the surfaces outside the repo?
- Is every open item either ticketed or explicitly marked as not-ticketed?
- Would someone arriving cold, reading only the entry point, know what is
  settled and what to do next?
- Did every figure and every list I am about to publish come from a command I
  watched run — not from a cache, a subagent's summary, or a pipeline whose
  exit status belonged to the last stage?
- Is each proposed commit one idea, with a subject that states a conclusion?
- Did the refuter get a fresh context, and did I act on what it found?
- If the work was published, did I re-read the entry point *after* the merge
  landed, and does it describe the result rather than the pass?
- Is there one confirmation left to give, or three?
- Was every gate a question the user could answer with one click, listing what
  each answer does — and did each one offer a way to do less?
