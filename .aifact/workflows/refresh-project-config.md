# Refresh Project Config

## Purpose

Update the `work/project-config.md` file to reflect the current repository state. This ensures the project configuration stays synchronized with actual repo structure and conventions.

## Core Steps

1. Read the existing `work/project-config.md` file
2. Inspect the current repository state:
   - Top-level directory structure
   - Domain folders (work/, .opencode/, .vibe/, etc.)
   - Guideline files in work/guidelines/
   - Backlog state in work/backlog/
   - ADR files in work/adr/
   - Documentation structure
3. Identify discrepancies between config and actual state
4. Update the Repo Structure section to match current directories
5. Update Domain Rules to reference existing guideline files
6. Preserve existing wording and intent when still compatible
7. Keep ambiguous or unverifiable details unchanged
8. Write the updated config file

## Constraints

- Do not invent new rules or structures not present in the repo
- Do not remove existing valid content
- Preserve existing section order and formatting
- Only update what can be verified from repo artifacts
- Do not add speculative or aspirational content
- Changes must be additive or corrective, not speculative

## Output Contract

- Updated `work/project-config.md` file
- Changes are minimal and verified from repo state
- Return whether the file changed
- Return the main updates applied
- Return any ambiguous areas intentionally left unchanged
