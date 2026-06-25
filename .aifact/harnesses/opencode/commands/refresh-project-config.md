---
description: Refresh work/project-config.md from current repo state.
agent: brainstorm
mode: all
model: openai/gpt-5.5
---

# Refresh Project Config for AiFact

> **Core Workflow**: See `../../../workflows/refresh-project-config.md` for the harness-agnostic workflow definition.

**Arguments:** `$ARGUMENTS` (optional focus hint)

Update `work/project-config.md` directly so it matches the current repository as closely as possible without inventing new policy.

## Execute

1. Read and use these files first:
   - `work/project-config.md`
   - `AGENTS.md`
2. Inspect current repository state:
   - top-level repo directories
   - `work/guidelines/`
   - `work/backlog/`
   - `work/adr/`
   - `docs/`
   - `Makefile`
   - domain folders explicitly referenced by current config
3. Update `work/project-config.md` in place
4. Refresh only what can be verified from repo
5. Prioritize these sections:
   - Repo Structure
   - Technology Rules
   - Command Rules
   - guideline file references in Domain Rules and Review Rules
6. Preserve existing wording and intent when still compatible
7. If detail cannot be safely inferred, keep current text
8. If repo clearly contains new durable structure, add it concisely
9. Return:
   - whether work/project-config.md changed
   - the main updates applied
   - any ambiguous areas intentionally left unchanged

## Constraints

- Do not invent new rules or structures not present in repo
- Do not remove existing valid content
- Preserve existing section order and formatting
- Only update what can be verified from repo artifacts
- Do not add speculative or aspirational content
- Changes must be additive or corrective, not speculative
- File system writes limited to work/project-config.md

## Output Contract

- Updated work/project-config.md file
- Changes are minimal and verified from repo state
- Return whether the file changed
- Return main updates applied
- Return ambiguous areas intentionally left unchanged
