---
description: Initialize AiFact framework in a project by creating pointer files.
agent: init
mode: all
model: openai/gpt-5.5
---

# Init for AiFact

> **Core Workflow**: Initialization command for AiFact framework activation.

**Arguments:** (none - uses .aifact/init script)

Initialize AiFact framework in a project by creating harness-specific pointer files.

## Execute

1. Read `work/project-config.md` first
2. Verify `.aifact/` directory exists at repository root
3. Run the activation script: `.aifact/init`
4. Script will:
   - Prompt user to select harness (opencode or vibe)
   - Generate pointer files in harness-specific locations
   - Pointer files reference implementations within `.aifact/harnesses/`
   - Prompt before overwriting existing files (use -f/--force to skip)
5. Verify pointer files were created correctly
6. Return activation status

## Constraints

- Requires `.aifact/` directory to exist
- Pointer files reference implementations within `.aifact/harnesses/`
- Must prompt user before overwriting existing files
- -f or --force flag skips prompts
- File system writes limited to pointer file locations

## Pointer File Pattern

Pointer files are harness-specific:
- For opencode: Create files in `.opencode/` that reference `.aifact/harnesses/opencode/`
- For vibe: Create files in `.vibe/` that reference `.aifact/harnesses/vibe/`

## Output Contract

- Harness-specific pointer files created
- Pointer files reference correct harness implementations
- Return activation status (success/failure)
- Return list of pointer files created
- Report any errors with clear messages
