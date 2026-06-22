---
name: refresh-project-config
description: Refresh work/project-config.md from current repo state. Replaces opencode refresh-project-config command.
user-invocable: true
allowed-tools:
  - read
  - write_file
  - bash
  - edit
---

# Refresh Project Config Skill

Update `work/project-config.md` to match the current repository state.

**Arguments:** Optional focus hint (e.g., "structure", "guidelines")

## Purpose

Keep the project configuration file synchronized with the actual repository state.

## Hard Constraints

- Update in place, do not rewrite from scratch
- Only update what can be verified from repo artifacts
- Preserve existing wording and intent when still compatible
- Do not invent new policy

## Execute

1. **Load required context**
   - Read `work/project-config.md` (required)
   - Read `AGENTS.md` (required)

2. **Inspect current repository state**
   - Top-level repo directories: `ls -la` using `bash` tool
   - `work/guidelines/`: list files using `bash` tool
   - `work/backlog/`: list directory structure using `bash` tool
   - `work/adr/`: list files using `bash` tool
   - `work/releases/`: list files using `bash` tool
   - `docs/`: check if exists using `bash` tool
   - `Makefile`: check if exists using `bash` tool
   - Any domain folders explicitly referenced by current config

3. **Update prioritized sections**
   - **Repo Structure**: Update to reflect current directory layout
   - **Technology Rules**: Update based on observable technologies in repo
   - **Command Rules**: Update if new command-related files are found
   - **Domain Rules > guideline file references**: Update to match current `work/guidelines/` contents

4. **Preserve compatibility**
   - If a detail cannot be safely inferred from repo artifacts, keep current text
   - If repo clearly contains new durable structure or rule source, add it concisely
   - Preserve existing wording when still accurate

5. **Edit file in place**
   - Use `edit` tool for targeted updates to specific sections
   - Do not rewrite entire file
   - Maintain markdown structure and formatting

6. **Report changes**
   - Whether `work/project-config.md` changed
   - Main updates applied
   - Any ambiguous areas intentionally left unchanged

## Constraints

- Always prefer repo-grounded facts over assumptions
- Only update sections that can be verified from artifacts
- Use minimal, targeted edits
- Maintain consistency with existing config style
