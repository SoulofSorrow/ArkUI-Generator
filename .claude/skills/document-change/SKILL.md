---
name: document-change
description: Write the change record in docs/changes/ and update the docs index and topic docs for the ArkUI Generator. Use at the end of every change set, before committing.
---

# Document a change

Every change set gets one record. Records are written for AI agents: explicit,
self-contained, exact paths and identifiers.

## Steps

1. Create `docs/changes/YYYY-MM-DD-<short-slug>.md` with today's date. Never
   edit an existing change file; add a new one.
2. Fill in the template below.
3. Add a row to the "Change records" table in `docs/README.md`.
4. Update every topic doc whose facts changed (`docs/*.md`). Docs must never
   contradict the code.
5. User-visible change: update `README.md` and `README.de.md` together.
6. There is no `CHANGELOG.md` in this repository; do not create one unless the
   user asks.

## Template

```markdown
---
date: YYYY-MM-DD
type: feature | fix | refactor | config | docs | chore
scope: <component or path>
files: [<relative/path>, ...]
breaking: false
---
# <Title>

## Context
Why the change was needed (problem, request, constraint).

## Change
What changed, per file or component. Exact relative paths, function/resource
names and config keys.

## Decisions
Chosen approach and rejected alternatives, one line each with the reason.

## Usage / Verification
Exact, copy-pasteable commands to build, test or verify.

## Follow-ups
Open points, known limitations, TODOs. Write "none" if there are none.
```

## Writing rules

- No "as discussed", no chat references.
- Paths, identifiers, env vars and commands in backticks.
- Lists and tables over prose. State facts, not narrative.
- No secrets, tokens or credentials.
- English.
