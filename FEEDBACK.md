# wrap — session feedback log

Accumulated, dated friction from real runs, to drive protocol iteration.
Newest first. Factual capture of what actually happened, lightly organized —
not conclusions, and not fixes. The fix is decided when the batch is folded.

Once a batch has been folded into `SKILL.md`, archive it under
[`feedback/`](feedback/) as a date-prefixed, reviewed file.

A run that went smoothly is worth a line too. Only recording friction makes
the log read like the protocol is worse than it is.

## 2026-07-21 — first run, on this repo, against itself

Conditions were the most favourable possible: a one-hour-old repo, no
residue, no accumulated contradiction. Treat the verdicts below as
provisional — most phases were never stressed.

### What worked

- **Seiso earned the whole pass.** It found two superseded figures across
  four files, including the number used to *illustrate* index drift in the
  Seiton section. Grepping for the claim rather than fixing the files already
  open is what caught the third occurrence.
- **The empty-phase rule held.** Seiri and Seiton reported nothing without
  manufacturing activity. §8's "busy wrap" warning did its job.
- **Supersede-don't-rewrite produced a real artifact.** The first commit's
  "~590 commits" is wrong and stayed wrong; `CLAUDE.md` carries the correction
  plus a "looks like a contradiction, is not" line pointing at it.

### Friction — one commit is one idea, but ideas share files

§1.4 mandates one idea per commit. The run produced four ideas across three
files, and **three of the four ideas touched `CLAUDE.md`**. Interactive
`git add -p` is unavailable in this harness.

Worked around it by: backing the final files up outside the repo, reverting
to HEAD, and replaying the edits in commit order. It worked — a final `diff`
confirmed byte-identity with the backup — but it is fragile, and one `perl`
substitution silently failed mid-replay because the pattern omitted the
leading indent. Caught only because `git diff --stat` showed one changed line
where three were expected.

`SKILL.md` says nothing about *how* to split when ideas share a file. It
should: either name the backup-revert-replay recipe, or say plainly that
bundling is acceptable when the alternative is patch surgery, and let the
commit body enumerate the ideas.

Unresolved: which of the two. Do not fold this until a second run has hit the
same wall — one occurrence is not a pattern.

### Friction — the symlink makes a self-wrap non-reproducible

The install is a symlink, so editing `SKILL.md` during the pass changed the
protocol while it ran. Seiso gained a new directive *while Seiso was
executing*. Harmless here, but a self-wrap is not a clean test of anything.

Already mitigated in `CLAUDE.md`'s iteration loop (capture during, edit
after). Left here because the mitigation is documented, not enforced, and the
next self-wrap will be tempted the same way.

### Not friction, worth recording

The three-phases-untested state is in `CLAUDE.md § State`, not here — it is
repo state, not protocol feedback.

<!-- No open feedback. Add new session notes above this line, newest first. -->
