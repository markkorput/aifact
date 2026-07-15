---
name: story-implementer
description: Implement an in-progress AiFact story after Analysis exists, preserving artifact-first handoffs.
user-invocable: true
allowed-tools:
  - read_file
  - grep
  - glob
  - write_file
  - edit
  - bash
---

# Story Implementer

> **Core Workflow**: See `.aifact/workflows/story-implementer.md`

Implement an in-progress AiFact story after Analysis exists, preserving artifact-first handoffs.

## Hard Constraints (Vibe-specific)

- Stop for user decision if required changes materially deviate from story intent
- Do not silently broaden scope beyond analyzed boundary
- Do not remove or rewrite durable work artifacts except story sections needed for handoff
- Do not modify source code files outside analyzed scope

## Execution

Follow steps from core workflow using Vibe tool names (`read_file`, `grep`, `glob`, `write_file`, `edit`, `bash`).
