# wrap — session feedback log

Accumulated, dated friction from real runs, to drive protocol iteration.
Newest first. Factual capture of what actually happened, lightly organized —
not conclusions, and not fixes. The fix is decided when the batch is folded.

Once a batch has been folded into `SKILL.md`, archive it under
[`feedback/`](feedback/) as a date-prefixed, reviewed file.

A run that went smoothly is worth a line too. Only recording friction makes
the log read like the protocol is worse than it is.

Last folded:
[`feedback/2026-08-03-external-run-reviewed.md`](feedback/2026-08-03-external-run-reviewed.md)
— three findings from a real run on **another repo**, carried here by hand
because the intake cannot reach across checkouts, folded and **released in
`0.5.0`** on 2026-08-03. It is the first batch from an external run to be folded
at all.

Before it: [`feedback/2026-08-03-reviewed.md`](feedback/2026-08-03-reviewed.md)
— five findings about `wrap` read out of the periodic usage report, folded
2026-08-03 and **released in `0.4.0`** the same day. It also consumed one
bullet of the 07-31 batch below, marked in place; the rest of that batch is
still open.

Before that: [`feedback/2026-07-26-reviewed.md`](feedback/2026-07-26-reviewed.md)
— 26 runs across six repos, released as `0.2.0`. It also records the one note
that was *not* folded, and why: this file is unreachable from any repo other
than this one, so the intake only fires during a self-wrap. The usage report is
a partial answer to that, and the 08-03 archive says what it does not recover.

## 2026-08-03 — the first self-wrap whose refuter actually ran

A real run on this repo, after four merges and `0.5.0`. The first where the
subagent authorisation folded that morning applied to the pass executing it.

- **The refuter found six things nobody had looked for.** It was given eleven
  claims to attack; ten survived and one was partly refuted. The value was
  entirely in what it volunteered: a `CLAUDE.md` State bullet still calling
  `0.5.0` unpublished after four merges, a commit figure stale for the fourth
  time in a day, a squash count that said three when six had happened, a tag
  list of two when four exist, a `.markdownlint.jsonc` that neither document
  describing it describes in full, and `docs/infographic.md` — a third spine —
  drifted from `SKILL.md` and `README.md` on both of `0.5.0`'s changes.

  Ratio worth recording: the claims I chose to submit were the ones I had
  already verified, and they held. The findings came from the file the refuter
  opened next.

- **The State section has now described a released version as unreleased three
  times** — `0b0fe37`, `8b173d1`, and this run. Not carelessness about one line:
  Shitsuke writes the entry point *before* the publication gate, the gate is
  answered, and nothing re-reads what was written. The protocol has no step
  after publication.

  **Folded in `0.6.0`, 2026-08-04.** The pass no longer ends at the push: it
  re-reads the entry point once the merge lands and reconciles what the answer
  falsified, and Shitsuke stops asserting publication state it cannot yet know.
  The reasoning, including the two fixes deliberately not taken, is in
  `CLAUDE.md`.

- **The figure trap, in a repo whose PRs are squashed.** `.wrap.md` carried
  "thirty-four of thirty-five non-merge commits". Correct when written; wrong
  two hours and three squashes later. Any count over `git log` here is stale by
  construction. Replaced by the command that derives it.

- **Orientation did not fan out, fourth consecutive self-wrap.** Twelve markdown
  files, two batched commands. Still not evidence about the wave, and the
  authorisation changes nothing here: the wave is a cost decision, not a
  permission one.

## 2026-08-03 — the archive claim, inferred and wrong within the hour

Not a wrap run. What happened to the rule written one merge earlier.

- **"GitHub deletes the merged branch by default" was never measured.**
  `gh repo view --json deleteBranchOnMerge` returns `false` on this repo. The
  claim was inferred from a plausible GitHub default, written into `CLAUDE.md`
  as a design decision and into `.wrap.md` as a rule, and published — in the
  same hour as a release extending the directive that says a command's output is
  a claim until you know the command ran. The command was never run. Corrected
  in place, not rewritten.

- **The rule was broken by the merge that published it.** `wrap/post-0.5.0`
  carried the commit saying not to delete a release branch, and was deleted from
  the remote on merge, by hand, like `wrap/0.5.0` an hour before. Two for two.
  A support whose survival depends on a human not clicking a button is not an
  archive, which is what the branch rule assumed and the tag rule does not.

- **Nine commits spent the interval reachable from one clone only.** Recovered
  because this session still held the local branches. Had the clone been fresh,
  or the session over, `git blame` per idea would have been gone for `0.5.0` the
  way it is already gone for #6's ten commits.

  **False, measured an hour later.** `git ls-remote origin`, run with no filter
  for the first time all day, lists `refs/pull/8/head` = `6e3d58a` and
  `refs/pull/9/head` = `bd210f1`. GitHub keeps a `refs/pull/N/head` for every
  PR and never deletes it. Nothing was ever reachable from one clone only, and
  #6's ten commits are in `refs/pull/6/head`, read one by one to check.

- **Four statements about loss, in one day, in ascending confidence.** "#6's
  ten commits survive nowhere but a reflog" (asserted). "The branch is the
  archive, so keep it" (asserted, and broken by the merge that published it).
  "The branch is not the archive, a tag is — because otherwise they are gone"
  (measured on `deleteBranchOnMerge`, inferred on the loss). Then the loss
  itself measured, and false. Each correction fixed the mechanism of the last
  and reproduced its epistemic shape: the load-bearing premise went unmeasured
  every time, and one unfiltered `ls-remote` would have settled all four at any
  point.

## 2026-08-03 — the `0.5.0` publication

Not a wrap run. The publication of the external-run fold, kept because it
settles a question three documents had left open.

- **Third consecutive squash, on a PR whose body asked for a merge.** `29d66a3`,
  one parent, six per-idea commits collapsed. #6 asked in `CLAUDE.md`, #7 asked
  again, #8 asked in the PR body itself, at the top of the section a merger
  reads last. Three to zero. Reconciled the same hour in `CLAUDE.md` and
  `.wrap.md`: `main` carries one commit per release, and the release branch is
  where per-idea history lives.

  The consequence nobody had written down: GitHub deletes the merged branch by
  default, so "the branch is the archive" only holds if the branch is kept.
  `origin/wrap/0.5.0` was gone within the minute; #6's ten commits are already
  lost this way.

  **Both halves false, measured later the same day** and left standing here so
  the batch reads as it was written. `deleteBranchOnMerge` is `false` on this
  repo — a human deleted the branches. And nothing was lost: `refs/pull/6/head`
  holds all ten. See the 08-03 batch above this one.

- **The sandboxed `git fetch` failed and the count that followed still
  answered.** `fatal: failed to store: 100001`, then
  `git rev-list --count HEAD..origin/main` returned `0` off a cache that had
  never been refreshed. Re-run outside the sandbox, the answer was the same — so
  the wrong reading and the right one were indistinguishable, which is the whole
  shape the probe directive names. Met while committing the change that extends
  that directive.

- **No refuter, and the authorisation written in this very release did not
  apply.** The session forbids subagents unless asked, and this was not a
  `/wrap` invocation — so the new line, which says invoking wrap *is* the
  request, had nothing to attach to. Everything published went out attacked by
  nobody. Worth knowing before reading `0.5.0` as having closed the question: it
  authorises the refuter *inside a wrap*, and the folds themselves are landed by
  sessions that are not wraps.

## 2026-08-03 — the release wrap, and a second session in the same checkout

The pass that cut `0.4.0` and the one that closed it, both with another agent
writing into the same worktree.

- **A parallel session moved the ground three times mid-pass.** It added a
  twelfth always-on directive to `SKILL.md` and withdrew it before it could be
  committed; it committed `docs/infographic.md` on top of the release branch
  after this pass had un-tracked the same file; and it opened the PR under a
  title describing one of eleven commits. Directive 9 covers the file-level
  case and worked — the withdrawn directive was never committed. It does not
  cover the surfaces *outside* the repo: nothing in the protocol says to check
  whether a PR already exists before opening one, and `gh pr create` refusing
  was what surfaced it.

- **`git add -A` swept in the other session's file.** It landed in a commit
  whose subject is about a bash-only `PIPESTATUS` spelling. Un-tracked in a
  follow-up rather than rewritten, then re-committed deliberately by its
  author. The protocol says not to commit another session's changes; it does
  not say how to stage, and the habit that breaks it is the convenient one.

- **The squash happened again, under a stale title.** `CLAUDE.md` said "merge,
  do not squash, on the next one" and the next one was squashed. Worse, GitHub
  took the squash subject from the PR title as it stood before a rewrite, so
  `main` records the `0.4.0` release as `docs: add 5S workflow infographic
  guide (#7)`. Retitling a PR does not retitle what the merge button will
  write, and nothing warned about that.

- **The refuter ran twice and found nine things.** Six on the repo's own
  claims after two verification passes, three more on the release itself. Four
  of the six were in prose written minutes earlier by the context that then
  self-checked it and passed. This is the evidence the protocol lacked for
  three passes; see `CLAUDE.md` for what it settles.

## 2026-08-03 — self-wrap, right after folding the probe directive

A real run, on this repo, on the branch that adds the probe-hygiene directive
— so the protocol executing the pass is the one the pass just wrote.

- **The probe directive ships a probe bug.** It tells the agent to use
  `set -o pipefail` or `${PIPESTATUS[0]}`. `PIPESTATUS` is a bash array;
  **zsh** — this user's shell, and the shell every session in the usage report
  ran in — spells it `pipestatus` and indexes from 1. Measured, not assumed:
  `zsh -c 'false | true; echo "[${PIPESTATUS[0]}]"'` prints `[]`, while
  `${pipestatus[1]}` prints `1`. So the directive's own remedy returns an empty
  string exactly where a wrong exit code was the problem. Caught because the
  orientation command used it and printed `fetch exit=` with nothing after it.
  **Routed, not fixed** — editing `SKILL.md` mid-pass is the documented hazard,
  and the precedent is the `§Seiso` note of 2026-07-26 that became `0.2.1`.

  **Folded in `0.4.0`**, after the pass closed, as the precedent prescribes.

- **`git log --format='%G?'` reports `E` inside the sandbox.** Not a broken
  signature: gpg cannot reach `keyboxd` from the sandbox, so the *verification*
  fails and the field reports the failure. Read once inside the sandbox and
  once outside, the same five commits are `E` then `G`. A wrap that verifies
  its own signatures and believes the first reading would report five broken
  commits. Same family as everything the directive names, met twice in one
  session.

- **`fetch --prune` had something to prune.** `origin/wrap/post-0.3.0` was a
  stale tracking ref left by the merge of #5. The Seiri rule added this morning
  fired on its first run, and the branch survey after it was correct.

- **The refuter went unexercised a third consecutive time**, same cause: the
  session's standing instruction forbids spawning agents unless the user asks,
  and invoking `/wrap` was not read as asking. The pass re-read its own claims
  against the files instead, which is the thing the protocol says is not a
  refuter. Three self-wraps, zero runs. The step is now the least-tested part
  of the protocol and the decision is overdue: exercise it externally, or make
  the protocol degrade explicitly when agents are unavailable rather than
  silently skipping its own gate.

  **Folded in `0.4.0`, same day, and then exercised.** The degradation rule is
  in `SKILL.md` — a pass that cannot spawn a refuter declares it and names what
  went unverified. The refuter then ran twice for real: six refutations on the
  repo's own claims, three more on the release itself. Both halves of the
  decision taken, so nothing here stays open.

  **The stated cause is settled too, in `0.5.0`.** "Invoking `/wrap` was not
  read as asking" is now answered by the protocol itself: it says invoking wrap
  *is* the request, for the collector wave and the refuter and for nothing else.
  See
  [`feedback/2026-08-03-external-run-reviewed.md`](feedback/2026-08-03-external-run-reviewed.md).

- **Orientation did not fan out, third consecutive self-wrap.** Ten markdown
  files, two batched commands. Still not evidence about the wave.

## 2026-07-31 — self-wrap, right after `0.3.0`

A real run, on this repo, immediately after the release that mandates
`AskUserQuestion` at every gate was merged.

- **The release that forbids the prose ask was published through one.** The
  session shipping `0.3.0` used an `AskUserQuestion` for the GPG-signing
  authorisation — a real gate, correctly shaped — and then asked "Veux-tu que
  je l'ouvre ?" in prose for the PR, and "Je lance `gh pr create` + merge ?"
  after that. Two prose gates on the publication path, in the session that
  wrote the rule against them. Not a protocol defect: the rule was not yet
  installed when the first was asked. It is evidence that the anti-pattern is
  the *default* behaviour and that the rule has to be loud to displace it.

- **`gh pr merge` was refused by the auto-mode classifier, twice.** The gate
  had been answered — the user had chosen to publish — and the tool still
  declined. The pass handed the user a copy-pasteable `! gh pr merge …` and
  stopped, which worked. Worth knowing: an answered `Publish` question does not
  guarantee the path completes, so a wrap must verify the merge landed rather
  than report it from the answer.

- **The refuter went unexercised again**, same cause as 07-26: the session
  standing instruction forbids spawning agents unless asked. Second consecutive
  self-wrap where the protocol's most novel step did not run. If the only
  sessions that self-wrap this repo carry that instruction, the step will never
  be exercised here and must be tested externally or dropped.

- **The deletion gate listed three branches that did not exist.** Seiri offered
  four merged branches for deletion, read from `git branch -r`. Three were
  stale remote-tracking refs — GitHub deletes the branch on merge, and no
  `fetch --prune` had run since. The user approved deleting four things and got
  one, plus three `remote ref does not exist` errors. Same failure mode as a
  stale figure in a summary line, in a phase that does not currently think of
  itself as handling figures: `git branch -r` is a cache, not an observation.

  **Folded 2026-08-03**, with the same finding from the usage report: Seiri now
  prunes before it surveys, and verifies a deletion target exists before
  listing it. See [`feedback/2026-08-03-reviewed.md`](feedback/2026-08-03-reviewed.md).

- **Orientation did not fan out, again deliberately.** Nine markdown files, one
  batched command. Not evidence about the wave.

## 2026-07-26 — folding the batch hit the commit-split wall twice more

Not a wrap run. Notes from the session that folded the 07-26 batch into
`0.2.0`, kept because they are about this repo's own workflow.

**Partly folded the same day**, by the self-wrap that followed: the first and
third notes are now in `.wrap.md`'s `## Notes`, which is where `0.2.0` routes
lessons about wrapping a given repo. The second — whether a rationale file is
exempt from the one-idea rule — is a hypothesis, not folded. Archive this batch
once that one is decided.

- **A wholesale rewrite cannot be retro-split by hunk.** `SKILL.md` was
  rewritten in one pass, then carved into commits by staging hunks
  (`git apply --cached --unidiff-zero`, selecting whole hunks by content
  anchor). Selecting *partial* hunks was tried first and produced broken
  prose — a replaced bullet keeping half its old body. Whole-hunk selection
  worked, but displaced continuation lines: a bullet's first line landing in
  one commit and its remaining lines in another position, plus a paragraph
  left counting four config keys while listing five. Fixed by a named
  reconciliation commit (`21a453d`), and the final tree was verified
  byte-identical to a pre-commit backup.

  The recipe now in `SKILL.md` covers a file carrying two ideas. It does not
  cover a file rewritten from scratch. The real fix is upstream: edit the
  protocol one idea at a time, one commit at a time.

- **The one-idea rule breaks on `CLAUDE.md` by design.** It holds the *why*
  for six different changes, so it cannot be split without six extractions on
  a rationale file. Treated as one idea — "record the reasoning for 0.2.0" —
  which is defensible but is the third time this friction has appeared in
  three sessions. It may be that a rationale file is simply exempt.

- **Three protocol regions turned out to be one seam.** The config tail and
  the whole of Orientation are contiguous in the file, so "the config writes
  itself", "the config gains a tracker key" and "orientation fans out" could
  not be separated. They shipped as one commit with all three named in the
  body. Worth knowing before the next fold: the section order of `SKILL.md`
  determines what can be committed apart.

## 2026-07-26 — self-wrap, after publication

A real run, on this repo, immediately after `0.2.0` was merged and pushed.

- **`0.2.0` left one `§Seiso` behind, inside the change that forbade it.** The
  config example in the Configuration section carries the comment
  `# surfaces outside the repo (§Seiso)`. The same release stripped the other
  phase cross-references (`§Seiton` → `Seiton`) for exactly that reason.
  **Routed, not fixed**: editing `SKILL.md` during a pass over this repo is the
  documented hazard, and every edit to it is release-eligible. It is a `0.2.1`,
  together with a decision on the remaining numeric self-references (`§2`,
  `§4`, `§6`, `§1.4`) — they look like the same violation and arguably are not,
  since a numbered section of the protocol has no other name. Decide once,
  apply to all.

  **Folded in `0.2.1`, same day.** The `§Seiso` is fixed; the numeric
  self-references stay, and the rule now states what it governs so a future
  pass does not strip them. The reasoning is in `CLAUDE.md` under design
  decisions, not only here.

- **The refuter did not get a fresh context.** The pass verified its own
  figures by re-running the commands, which caught nothing, and that is not the
  same thing. The session standing instruction was not to spawn agents unless
  asked, so the step the protocol added one commit earlier went unexercised on
  its first run. Not a protocol defect — a note that its most novel step is
  still untested.

- **Orientation did not fan out either, deliberately.** Three commands over
  fifteen files. Four collectors would have cost more than they saved. A clean
  self-wrap is not evidence about the wave in either direction.

<!-- No open feedback. Add new session notes above this line, newest first. -->
