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

> **Core Workflow**: See `../../../../workflows/refresh-project-config.md`

**Arguments:** $ARGUMENTS (optional focus hint)

Follow the core workflow definition and adapt for Mistral Vibe harness.

## Hard Constraints (Vibe-specific)

- Do not invent new rules or structures not present in repo
- Changes must be additive or corrective, not speculative
- File system writes limited to work/project-config.md

## Execution

Follow steps from core workflow using Vibe tool names (`read_file`, `glob`, `write_file`).
