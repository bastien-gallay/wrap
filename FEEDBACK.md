# wrap — session feedback log

Accumulated, dated friction from real runs, to drive protocol iteration.
Newest first. Factual capture of what actually happened, lightly organized —
not conclusions, and not fixes. The fix is decided when the batch is folded.

Once a batch has been folded into `SKILL.md`, archive it under
[`feedback/`](feedback/) as a date-prefixed, reviewed file.

A run that went smoothly is worth a line too. Only recording friction makes
the log read like the protocol is worse than it is.

Last folded: [`feedback/2026-07-26-reviewed.md`](feedback/2026-07-26-reviewed.md)
— 26 runs across six repos, released as `0.2.0`. It also records the one note
that was *not* folded, and why: this file is unreachable from any repo other
than this one, so the intake only fires during a self-wrap.

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
