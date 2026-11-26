# Documentation Index

Primary reader: AI coding agents. Human readers start with `README.md`
(English) or `README.de.md` (German).

Agent rules and workflow live in `AGENTS.md` in the repository root.

## Topic docs (current state)

| File | Purpose |
| --- | --- |
| `docs/architecture.md` | Structure of `start.py`, JSON keys, save/load behaviour, CI workflow state |

## Change records

One file per change set in `docs/changes/`, named `YYYY-MM-DD-<short-slug>.md`.
Never rewrite an existing change file; add a new one.

| File | Purpose |
| --- | --- |
| `docs/changes/2026-11-25-ai-ready-docs.md` | Adds `docs/`, `AGENTS.md`, `CLAUDE.md` and project skills |

## Maintenance rules

- Add, rename or remove a doc: update this index in the same change.
- Change behaviour: update `docs/architecture.md` in the same change.
- Every change set: add a file in `docs/changes/`. There is no `CHANGELOG.md`.
