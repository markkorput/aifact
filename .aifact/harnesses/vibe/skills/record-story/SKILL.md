---
name: record-story
description: Record a new AiFact user story under work/backlog/backlog using the standard story template with short ID.
user-invocable: true
allowed-tools:
  - read_file
  - write_file
  - glob
---

# Record Story

> **Core Workflow**: See `.aifact/workflows/record-story.md`

Record a new AiFact user story under work/backlog/backlog using the standard story template with short ID.

## Hard Constraints (Vibe-specific)

- Do not modify existing stories
- Do not auto-start stories
- File system writes limited to work/backlog/
- Story ID must be unique

## Execution

Follow steps from core workflow using Vibe tool names (`read_file`, `write_file`, `glob`).
