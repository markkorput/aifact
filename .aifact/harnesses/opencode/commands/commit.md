---
description: Create a Conventional Commit from current changes.
agent: commit
mode: all
model: openai/gpt-5.5
---

# Commit for AiFact

> **Core Workflow**: See `.aifact/workflows/commit.md`

**Arguments:** `$ARGUMENTS` (optional commit message hint)

Follow the core workflow definition and adapt for OpenCode harness.

## Hard Constraints (OpenCode-specific)

- Only commit staged changes
- Do not commit if there are unstaged changes that should be included
- File system writes limited to git operations only

## Execution

Follow steps from core workflow using OpenCode tool names (`bash`, `git`).
