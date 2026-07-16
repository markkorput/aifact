---
name: story-start
description: Start one planned or backlog story by moving it to in-progress and creating the feature branch.
user-invocable: true
allowed-tools:
  - read_file
  - bash
  - git
---

# Story Start

> **Core Workflow**: See `.aifact/workflows/story-start.md`

Start one planned or backlog story by moving it to in-progress and creating the feature branch.

## Hard Constraints (Vibe-specific)

- Accept only stories from work/stories/backlog/ or work/stories/planned/
- Never move stories from work/stories/in-progress/ or work/stories/done/
- Never discard existing user changes
- Never commit unrelated changes

## Execution

Follow steps from core workflow using Vibe tool names (`read_file`, `bash`, `git`).
