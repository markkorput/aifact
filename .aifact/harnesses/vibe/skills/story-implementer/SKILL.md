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

> **Core Workflow**: See `../../../../workflows/story-implementer.md` for the harness-agnostic workflow definition.

Implement an in-progress AiFact story after Analysis exists, preserving artifact-first handoffs.

## Purpose

Implement one analyzed AiFact story. Autonomous and execution-focused.

## Hard Constraints

- Stop for user decision if changes materially deviate from story intent
- Do not silently broaden scope beyond analyzed boundary
- Do not remove or rewrite durable work artifacts except story sections needed for handoff
- Do not modify source code files outside analyzed scope

## Execute

1. Read the story and require Analysis section
2. Load work/project-config.md
3. Check for Implementation feedback and prioritize it
4. Gather only enough context to act safely
5. Plan using Analysis as guidance
6. Implement story outcomes within boundaries
7. Run verification commands
8. Handle feedback and updates
9. Report results clearly

## Planning

- Use Analysis as default execution boundary
- Choose execution mode: direct execution for most cross-domain stories
- Widen scope only if new repo evidence shows analyzed boundary is incomplete

## Implementation Quality

- Reuse existing helpers, patterns, and naming
- Preserve intended behavior outside story change
- Avoid broad try/catch blocks and silent fallbacks
- Avoid speculative abstractions
- Batch coherent edits

## Verification

- Run commands from project-config and story's Verification Plan
- Report verification results

## Output Contract

- Changes implemented within analyzed boundaries
- Verification results
- Completed work list
- Any regressions fixed or introduced
- Remaining work if partial
- Blockers if any
- Optional Implementation update appended to story
