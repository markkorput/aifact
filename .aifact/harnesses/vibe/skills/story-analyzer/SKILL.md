---
name: story-analyzer
description: Analyze an in-progress AiFact story and write a bounded implementation Analysis section.
user-invocable: true
allowed-tools:
  - read_file
  - grep
  - glob
  - write_file
---

# Story Analyzer

> **Core Workflow**: See `../../../../workflows/story-analyzer.md`

Analyze an in-progress AiFact story and write a bounded implementation Analysis section.

## Hard Constraints (Vibe-specific)

- Do not rewrite the story
- Do not re-open product requirements
- Do not turn analysis into speculative file inventory
- Add or replace only the story's Analysis section
- File system writes limited to work/

## Execution

Follow steps from core workflow using Vibe tool names (`read_file`, `grep`, `glob`, `write_file`).
