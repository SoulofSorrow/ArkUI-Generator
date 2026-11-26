# Architecture

## Files

| Path | Purpose |
| --- | --- |
| `start.py` | Whole application: default `data` dict, handlers, module-level tkinter GUI |
| `data.json` | Sample configuration with the same 72 keys as the default `data` dict |
| `start.exe` | Prebuilt Windows GUI executable (PE32+, x86-64); no build script in the repository |
| `.github/workflows/python.yml` | GitHub Actions on `pull_request`: tox lint, tox unit tests (3.8 to 3.12), coverage, flit publish to TestPyPI |
| `Makefile` | Repository setup helpers only (`setup`, `install-*`, `set-git-local`, `check-git`, `test-hook`, `info`, `clean`) |
| `README.md`, `README.de.md` | User docs (English, German) |
| `LICENSE.md` | GPL-3.0 |

## Structure of `start.py`

- `data`: dict with defaults for all mod keys; module-level and replaced on
  "Öffnen".
- GUI is built at import time and ends with `root.mainloop()`; there is no
  `if __name__ == "__main__"` guard.
- One `ttk.Label` + `ttk.Entry` per key in a scrollable canvas; entries kept
  in `entry_fields[key]`.

| Function | Trigger | Behaviour |
| --- | --- | --- |
| `open_file()` | button "Öffnen" | Ask for a `.json` file, `load_as_single_line()`, replace `data`, `refresh_ui()` |
| `refresh_ui()` | internal | Write `data` values into existing entry fields |
| `save_changes()` | button "Speichern" | Read all entries into `data` (`"true"`/`"false"` case-insensitive become booleans, everything else a string), save with `indent=4` |
| `save_as_single_line()` | button "Speichern als Einzeiler" | Save `data` with `separators=(',', ':')` without reading the entries first |
| `load_data()` | unused | Load JSON from a path |
| `load_as_single_line()` | `open_file()` | Load JSON from a path (any formatting) |

## JSON keys (groups)

| Group | Keys |
| --- | --- |
| Header | `ServerName` |
| Buttons | `ButtonTxt1` to `ButtonTxt5` |
| Link buttons | `LinkButtonTxt1` to `LinkButtonTxt5`, `LinkButton1`, `LinkButton2`, `Link1Button3` to `Link4Button5` |
| Tabs | `Tab<1-5>Panelcount` (int), `BackgroundTab<1-5>` (int), `Tab<1-5>Title<1-3>`, `Tab<1-5>Text<1-3>` |
| Colours | `Background3Color` (`R,G,B,A`), `FontColorButtons`, `FontColorServerName`, `FontColorTabTitles`, `FontColorTabText` (`R,G,B`) |
| Flags | `UseSteamBrowserLink1`, `UseSteamBrowserLink2` (bool) |

## Known behaviour

- `save_changes()` writes every non-boolean value as a string, so integer keys
  (`Tab*Panelcount`, `BackgroundTab*`) become strings like `"1"`.
- "Speichern als Einzeiler" writes the last loaded or saved `data`, not the
  current entry field contents.
- Opening a file whose keys differ from the defaults leaves the entry fields
  of the defaults; new keys are not shown.
- Files are opened with the platform default encoding.

## CI

`.github/workflows/python.yml` runs `tox` (envs `lint`, `py3x-unittest`),
coverage with `diff_cover`, and `flit publish` to TestPyPI (secret
`TESTPYPI_TOKEN`). The repository has no `tox.ini`, `pyproject.toml` or tests,
so these jobs cannot succeed as configured. The repository is hosted on Gitea;
whether GitHub Actions runs at all is not defined in the repository.
