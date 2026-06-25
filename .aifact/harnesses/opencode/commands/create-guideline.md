---
description: Create or update a project guideline following strict formatting rules.
agent: create-guideline
mode: all
model: openai/gpt-5.5
---

# Create Guideline for AiFact

> **Core Workflow**: See `../../../workflows/create-guideline.md`

Follow the core workflow definition and adapt for OpenCode harness.

## Hard Constraints (OpenCode-specific)

- Guideline files must be in work/guidelines/
- File names: GL-<ID>-<slugified-title>.md
- File system writes limited to work/guidelines/

## Execution

Follow steps from core workflow using OpenCode tool names (`read`, `write_file`, `glob`).
