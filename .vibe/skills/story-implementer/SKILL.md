---
name: story-implementer
description: Use to implement an in-progress AiFact story after Analysis exists, preserving artifact-first handoffs.
user-invocable: true
allowed-tools:
  - read_file
  - grep
  - write_file
  - bash
---

# Story Implementer

Implement one analyzed AiFact story.

## Execute

1. Read the story and require `## Analysis`; if missing, stop and direct the user to run `/story-analyzer`.
2. Read `work/project-config.md`, matching guidelines, command rules, and the story's `### Verification Plan`.
3. If `## Implementation feedback` exists, prioritize the latest feedback block.
4. Gather only enough context to act safely.
5. Treat the story's Analysis as the default execution boundary.
6. Implement the story outcomes with the narrowest safe change.
7. Reuse existing helpers, patterns, and naming before adding new structure.
8. Preserve behavior outside the story intent.
9. Run every repo-configured command marked `always: true` and conditionally relevant commands from `work/project-config.md`.
10. Run story-specific verification from the Analysis and story verification plan.
11. Report completed work, regressions fixed or introduced, unrelated pre-existing failures, remaining work, and blockers.

## Constraints

- Stop for user decision if required changes materially deviate from story intent.
- Do not silently broaden scope beyond the analyzed boundary.
- Do not remove or rewrite durable work artifacts except the story sections needed for handoff.
