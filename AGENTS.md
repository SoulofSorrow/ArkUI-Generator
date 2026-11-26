# AGENTS.md

Instructions for AI coding agents working in this repository. Tool-agnostic;
`CLAUDE.md` imports this file.

## Project

ArkUI Generator: small tkinter desktop GUI (`start.py`, single file, Python
stdlib only: `tkinter`, `json`) to edit the JSON configuration of the ARK
"Editable Server UI" Steam Workshop mod (id `924619115`): button texts, link
buttons, tab titles and texts, colours. Saves pretty-printed or single-line
JSON. `start.exe` is a prebuilt Windows binary; `data.json` is a sample
configuration. License GPL-3.0 (`LICENSE.md`).

## Read first

1. `docs/README.md` (index).
2. `docs/architecture.md`: code structure, JSON keys, save/load behaviour,
   CI state.

## Commands

```bash
python start.py      # start the GUI (needs a display and tkinter)
```

There is no test suite, no linter config and no build script for
`start.exe`. `Makefile` only contains repository setup helpers
(`.editorconfig`, `.gitignore`, `.dockerignore`, git hook, git identity).
`.github/workflows/python.yml` calls `tox` and `flit`, but there is no
`tox.ini` or `pyproject.toml`; see `docs/architecture.md`.

Cheap checks without side effects:

```bash
python3 -c "import ast; ast.parse(open('start.py', encoding='utf-8').read())"
python3 -m json.tool data.json > /dev/null
```

## Definition of done

- `start.py` still parses and the GUI starts; `data.json` is valid JSON.
- Key names in the `data` dict stay exactly as the mod expects them.
- Affected doc in `docs/` updated.
- New file `docs/changes/YYYY-MM-DD-<slug>.md` (template in
  `.claude/skills/document-change/SKILL.md`), listed in `docs/README.md`.
- User-visible change: update `README.md` and `README.de.md` together.

## Hard rules

- Python stdlib only.
- Do not rename JSON keys (including irregular ones like `Link1Button3`,
  `Background3Color`): they are read by the ARK mod.
- Keep `data.json` and the default `data` dict in `start.py` on the same key
  set.
- Do not rebuild or replace `start.exe` unless the user asks.
- Do not run `make set-git-local` or `make install-hooks`: they change local
  git config and hooks.
- No emojis in new code, logs or docs.

## Language

| Artifact | Language |
| --- | --- |
| Code identifiers, JSON keys | English |
| Code comments, button labels | German (existing) |
| `README.md`, `docs/`, `AGENTS.md`, commit messages | English |
| `README.de.md` | German |

Commits: imperative subject, no tool attribution trailers.

## Project skills

Located in `.claude/skills/<name>/SKILL.md`.

| Skill | Use for |
| --- | --- |
| `add-ui-key` | New configuration key of the Editable Server UI mod |
| `document-change` | Writing the `docs/changes/` record |
