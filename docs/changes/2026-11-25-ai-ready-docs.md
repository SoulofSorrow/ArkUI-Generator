---
date: 2026-11-25
type: docs
scope: docs, agent tooling
files: [AGENTS.md, CLAUDE.md, .claude/settings.json, .claude/skills/add-ui-key/SKILL.md, .claude/skills/document-change/SKILL.md, docs/README.md, docs/architecture.md, docs/changes/2026-11-25-ai-ready-docs.md, README.md, README.de.md]
breaking: false
---
# Agent-ready documentation and project skills

## Context

- The repository had no `docs/` folder and no instructions for AI coding
  agents.
- The application is a single file (`start.py`); docs are sized accordingly.

## Change

- `docs/README.md`: index of docs and change records, maintenance rules.
- `docs/architecture.md`: file map, functions of `start.py`, JSON key groups,
  known behaviour, CI state.
- `AGENTS.md`: tool-agnostic agent instructions (commands, definition of done,
  hard rules, language table, skill list).
- `CLAUDE.md`: imports `AGENTS.md` via `@AGENTS.md`, Claude Code notes.
- `.claude/settings.json`: allows the `ast.parse` and `json.tool` checks and
  read-only `make` targets; asks before `git push` and `make` targets that
  write files, hooks or git config; denies reading `.env`.
- `.claude/skills/`: `add-ui-key`, `document-change`.
- `README.md`, `README.de.md`: section pointing to `docs/` and `AGENTS.md`.

## Decisions

- No application code, build files, CI or dependencies changed.

## Usage / Verification

```bash
python3 -m json.tool .claude/settings.json
python3 -c "import ast; ast.parse(open('start.py', encoding='utf-8').read())"
python3 -m json.tool data.json > /dev/null
ls docs docs/changes .claude/skills
```

## Follow-ups

- `.github/workflows/python.yml` runs `tox` and `flit publish` but there is no
  `tox.ini`, `pyproject.toml` or test suite; the jobs cannot pass. The
  unittest matrix maps Python 3.12 to `py311-unittest`.
- `README.md` and `README.de.md` refer to `progende.py`; the script is
  `start.py`.
- `save_changes()` saves integer keys as strings; "Speichern als Einzeiler"
  ignores unsaved entry changes.
- `start.exe` is a committed binary without a build script or provenance.
- No `.gitignore`; `Makefile` has no build, test or tag targets, contains a
  personal e-mail in `GIT_EMAIL` and emojis in the `info` target.
- Missing standard files: `.editorconfig`, `CHANGELOG.md`, `CONTRIBUTING.md`,
  `.pre-commit-config.yaml`, `.gitignore`.
