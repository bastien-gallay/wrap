# 2026-08-03 — reviewed batch, the external run

One batch, from a real `/wrap` on **another repo** (`termherd`), folded into
`SKILL.md` the same day and released as `0.5.0`. The filename carries the fold
date and a suffix, because `2026-08-03-reviewed.md` was already taken by the
usage-report batch folded hours earlier.

This is the batch the intake was not supposed to be able to receive. `wrap`'s
`FEEDBACK.md` is unreachable from any checkout but this one, so friction from an
external run has nowhere to land — the standing open item since 2026-07-26. It
landed here because a human carried it by hand, which is the workaround the
07-26 archive names and does not solve.

## Ledger — note → fold

| Note | Folded as |
| --- | --- |
| The harness forbade subagents; Orientation and the refuter are both subagents and neither ran | §4 — invoking wrap *is* the request for the collector wave and the refuter, scoped to those two and nothing else; §6 says the same at the refuter |
| The pass declared the hole rather than simulating it | **Already covered** by the degradation rule added the same morning in `0.4.0`. It worked on its first external run. No change; the fold explicitly keeps it as the exit when a harness refuses anyway |
| A claim of absence was falsified by three commits landing on `main` mid-session, invisible in the branch's diff | Seiso — the blast radius is not only your own diff; fetch, read what moved, re-check every claim of absence against it |
| `git log origin/main..HEAD` does not answer *am I behind* | §1.9 — the range is named in the right direction at the point where the remote is re-checked before pushing |
| `osascript -e 'keystroke ""'` succeeds without accessibility permission | §1.6 — an argument that does nothing never reaches the check the probe was meant to exercise |

Two vigilance points came with the batch and were honoured rather than folded as
prose: the authorisation is **scoped** to the two subagents the protocol
actually uses, so it cannot be read as a general permission; and the degradation
rule stays, so a harness that refuses anyway still produces a declared gap
rather than a silent substitution. Both are written into §4's paragraph.

## The notes, as captured

### 2026-08-03 — a wrap on someone else's repo, with subagents forbidden

A real run of `/wrap` on `termherd`, not on this repo, carried here by hand
because the intake only fires during a self-wrap. Documentary milestone — an
mdBook, its CI gates, two AGENTS directives, one roadmap entry. Full pass, five
signed commits, PR opened and green.

- **The harness forbade subagents, and the protocol has no answer for that.**
  The session's system prompt carried two standing lines: "Do not call the
  AgentTool unless the user requested it" and "Do not use workflows or
  deep-research unless the user requested it". Checked and ruled out as the
  source: `settings.json` (user and project), global `CLAUDE.md`, the repo's
  `AGENTS.md`, managed-settings (absent), `~/.claude.json`, output-styles, shell
  aliases and functions for `claude`, environment variables, and the host app's
  launch line. The client injects them.

  Consequence: Orientation's collector wave and the refuter are both subagents
  by design, and neither ran. Orientation went serial in the main context; the
  refuter was replaced by a re-read of the pass's own claims — precisely what
  the protocol names as *not* a refuter. The degradation rule added the same day
  worked: the pass declared the hole instead of simulating it. What it does not
  settle is whether the hole should have existed at all — that is, whether
  **asking for a wrap constitutes the request** the harness demands. The
  protocol prescribes both steps without ever saying they are subagents or who
  authorises them.

- **What the absent refuter should have caught, and what caught it instead.**
  `main` moved three commits ahead during the session, one of them shipping an
  `open.command` setting. The book written in that same session stated, word for
  word, "there is no `open.command` setting yet — the OS handler is what you
  get". False the minute it was typed, and invisible in the branch's own diff.
  Caught at the very last gate, by the standing directive to re-check the remote
  just before pushing — not by any verification step. A redundancy saved the
  pass where the refuter was the designed mechanism.

  Trap paid on the spot, same family as probe hygiene: `git log
  origin/main..HEAD` does **not** report whether you are up to date. It lists
  what the branch has in addition, and returns the same thing whether you are
  current or three commits behind. `git log HEAD..origin/main` is the one that
  answers. The first was read and the wrong conclusion drawn before it was
  caught.

- **A new instance for the probe-hygiene family.** While trying to drive the app
  for screenshots, `osascript -e 'keystroke ""'` **succeeds without
  accessibility permission** — an empty string never reaches macOS's TCC check.
  A wait loop built on it reported the permission granted while every real
  keystroke was being denied, and that conclusion held for a full turn before it
  fell. Same shape as the linter exiting 0 without reading anything, and as
  `mutants.out/outcomes.json` read mid-run: from outside, success and vacuity
  are indistinguishable. The phrasing that has served elsewhere — *the cheap
  probe and the real call are rarely the same call, and it is the cheap one that
  ends up written down.*

Two things to watch if the fold decides to authorise subagents from the skill.
**Scope**: the authorisation covers Orientation and the refuter only; a line
written too broadly becomes a general permission disguised as a skill rule, and
no other part of the pass needs subagents. **No simulation**: the existing
degradation rule has to stay the escape hatch when a harness refuses anyway. The
risk to write into the rule is the hidden one — a pass that reads the directive,
quietly substitutes its own re-read, and reports a verification that did not
happen.

## What worked

- The degradation rule, on its first run outside this repo and hours after being
  written. The pass named what went unverified instead of reporting a complete
  one.
- Directive 9's re-check of the remote before pushing, catching a falsified
  claim that was the refuter's job and that no diff of the branch showed. A
  redundancy earning its cost.
- Carrying a batch by hand across repos. Slow, lossy, and the only path there
  is — which is the argument for the intake item staying open, not for closing
  it because a human compensated once.
