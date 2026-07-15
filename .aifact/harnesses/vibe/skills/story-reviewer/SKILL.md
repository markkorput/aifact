---
name: story-reviewer
description: Review of a drafted story before code-impact analysis.
user-invocable: true
allowed-tools:
  - read_file
  - glob
---

# Story Reviewer

> **Core Workflow**: See `.aifact/workflows/story-reviewer.md`

Review of a drafted story before code-impact analysis. Preserves artifact-first workflow.

## Hard Constraints (Vibe-specific)

- Do not rewrite the story
- Do not perform code-impact analysis
- Focus on story quality and completeness
- Only review stories in work/backlog/backlog/ or work/backlog/planned/

## Execution

Follow steps from core workflow using Vibe tool names (`read_file`, `glob`).
