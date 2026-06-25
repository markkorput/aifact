---
name: create-guideline
description: Create or update a project guideline following strict formatting rules.
user-invocable: true
allowed-tools:
  - read_file
  - write_file
  - glob
---

# Create Guideline

> **Core Workflow**: See `../../../../workflows/create-guideline.md`

Follow the core workflow definition and adapt for Mistral Vibe harness.

## Hard Constraints (Vibe-specific)

- Guideline files must be in work/guidelines/
- File names: GL-<ID>-<slugified-title>.md
- File system writes limited to work/guidelines/

## Execution

Follow steps from core workflow using Vibe tool names (`read_file`, `write_file`, `glob`).
