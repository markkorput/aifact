---
description: Refresh work/project-config.md from current repo state.
agent: refresh-project-config
mode: all
model: openai/gpt-5.5
---

# Refresh Project Config for AiFact

> **Core Workflow**: See `.aifact/workflows/refresh-project-config.md`

**Arguments:** `$ARGUMENTS` (optional focus hint)

Follow the core workflow definition and adapt for OpenCode harness.

## Hard Constraints (OpenCode-specific)

- Do not invent new rules or structures not present in repo
- Changes must be additive or corrective, not speculative
- File system writes limited to work/project-config.md

## Execution

Follow steps from core workflow using OpenCode tool names (`read`, `glob`, `write_file`).
