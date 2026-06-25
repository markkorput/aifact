---
name: story-validator
description: Validate an implemented AiFact story and append pass/fail feedback to the story artifact.
user-invocable: true
allowed-tools:
  - read_file
  - grep
  - glob
  - bash
---

# Story Validator

> **Core Workflow**: See `../../../../workflows/story-validator.md`

Validate an implemented AiFact story and append pass/fail feedback to the story artifact.

## Hard Constraints (Vibe-specific)

- Only validate stories in work/backlog/in-progress/ or work/backlog/done/
- Do not modify implementation, only validate
- Do not run destructive operations
- File system writes limited to work/

## Execution

Follow steps from core workflow using Vibe tool names (`read_file`, `grep`, `glob`, `bash`).
