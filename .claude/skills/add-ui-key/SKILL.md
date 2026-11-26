---
name: add-ui-key
description: Add a new configuration key of the ARK Editable Server UI mod to the ArkUI Generator (default data dict, sample data.json, docs). Use when the mod gains a setting that the generator should edit.
---

# Add a UI key

Background: `docs/architecture.md` (JSON keys).

## Steps

1. Confirm the exact key name and type with the user or the mod
   documentation; never guess key names.
2. Add the key with its default to the `data` dict in `start.py`, in the
   group where it belongs (dict order is the field order in the GUI).
3. Add the same key to `data.json`.
4. Booleans: default `False`/`True`; `save_changes()` converts
   `"true"`/`"false"` entries. Integers are currently saved as strings; do not
   rely on numeric output unless you change `save_changes()` deliberately.
5. Check: `python3 -c "import ast; ast.parse(open('start.py', encoding='utf-8').read())"`
   and `python3 -m json.tool data.json > /dev/null`.
6. Update the key table in `docs/architecture.md` and, if user-visible,
   `README.md` and `README.de.md`; then the `document-change` skill.
