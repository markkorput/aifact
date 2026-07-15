---
description: Record a new AiFact user story under work/backlog/backlog using the standard story template with short ID.
agent: record-story
mode: all
model: openai/gpt-5.5
---

# Record Story for AiFact

> **Core Workflow**: See `.aifact/workflows/record-story.md`

Record a new AiFact user story under work/backlog/backlog using the standard story template with short ID.

## Hard Constraints (OpenCode-specific)

- Do not modify existing stories
- Do not auto-start stories
- File system writes limited to work/backlog/
- Story ID must be unique

## Execution

Follow steps from core workflow using OpenCode tool names (`read`, `write_file`, `glob`).
