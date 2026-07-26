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

## 2026-07-26 — folding the batch hit the commit-split wall twice more

Not a wrap run. Notes from the session that folded the 07-26 batch into
`0.2.0`, kept because they are about this repo's own workflow.

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

<!-- No open feedback. Add new session notes above this line, newest first. -->
