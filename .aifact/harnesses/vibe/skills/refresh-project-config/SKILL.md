---
name: refresh-project-config
description: Refresh work/project-config.md from current repo state.
user-invocable: true
allowed-tools:
  - read_file
  - glob
  - write_file
---

# Refresh Project Config

> **Core Workflow**: See `../../../../workflows/refresh-project-config.md` for the harness-agnostic workflow definition.

**Arguments:** $ARGUMENTS (optional focus hint)

Update `work/project-config.md` directly so it matches the current repository as closely as possible without inventing new policy.

## Purpose

Refresh work/project-config.md from current repo state. Replaces opencode refresh-project-config command.

## Hard Constraints

- Do not invent new rules or structures not present in repo
- Do not remove existing valid content
- Preserve existing section order and formatting
- Only update what can be verified from repo artifacts
- Do not add speculative or aspirational content
- Changes must be additive or corrective

## Execute

1. Read `work/project-config.md` first
2. Read `AGENTS.md`
3. Inspect current repository state
4. Identify discrepancies between config and actual state
5. Update sections in priority order: Repo Structure, Technology Rules, Command Rules, guideline references
6. Preserve existing wording when compatible
7. Keep ambiguous areas unchanged
8. Write updated config
9. Return: whether file changed, main updates, ambiguous areas left unchanged

## Output Contract

- Updated work/project-config.md file
- Changes are minimal and verified from repo state
- Return whether the file changed
- Return main updates applied
- Return ambiguous areas intentionally left unchanged
