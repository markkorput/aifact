---
name: commit
description: Create a Conventional Commit from current changes.
user-invocable: true
allowed-tools:
  - bash
  - git
---

# Commit

> **Core Workflow**: See `../../../../workflows/commit.md`

**Arguments:** $ARGUMENTS (optional commit message hint)

Follow the core workflow definition and adapt for Mistral Vibe harness.

## Hard Constraints (Vibe-specific)

- Only commit staged changes
- Do not commit if there are unstaged changes that should be included
- File system writes limited to git operations only

## Execution

Follow steps from core workflow using Vibe tool names (`bash`, `git`).
