---
name: story-implementer
description: Implement an in-progress AiFact story after Analysis exists, preserving artifact-first handoffs.
user-invocable: true
allowed-tools:
  - read_file
  - grep
  - write_file
  - edit
  - bash
---

# Story Implementer

Implement one analyzed AiFact story. Autonomous and execution-focused.

## Purpose

Deliver story outcomes by implementing changes within the analyzed boundaries. Stay focused on the narrowest safe change that satisfies story requirements.

## Hard Constraints

- Stop for user decision if required changes materially deviate from story intent.
- Do not silently broaden scope beyond the analyzed boundary.
- Do not remove or rewrite durable work artifacts except the story sections needed for handoff.
- Do not modify source code files outside the analyzed scope.

## Execute

1. **Read the story and require `## Analysis`**
   - If `## Analysis` is missing, stop and report: "Analysis section missing. Run /story-analyzer first."

2. **Load required context**
   - Read `work/project-config.md` (required)
   - Load matching guidelines based on affected area from project-config domain rules
   - Load command rules from project-config
   - Read the story's `### Verification Plan`

3. **Check for Implementation feedback**
   - If `## Implementation feedback` exists, read the latest feedback block
   - Prioritize addressing the feedback items in the latest block
   - Track which feedback items are addressed vs not addressed

4. **Gather only enough context to act safely**
   - Think first about the files and symbols you likely need
   - Batch independent reads/searches in parallel when possible
   - Stop searching once you have enough context to act safely
   - Search again only if validation fails or new unknowns appear

5. **Plan by domain/risk**
   - Treat `### Likely Impact`, `### Possible Adjacent Touchpoints`, `### Existing Patterns / Prior Art`, and `### Layer Boundaries` in `## Analysis` as the default execution boundary
   - Choose execution mode:
     - Default to direct execution, including most cross-domain stories
     - Use direct execution for straightforward refactors even when they touch a few tightly related files
     - Only widen scope if new repo evidence shows the analyzed boundary is incomplete

6. **Implement story outcomes**
   - Use analysis as guidance, not a strict file contract
   - Include necessary adjacent changes and tests when required for safe delivery
   - Reuse existing helpers, patterns, and naming before adding new code
   - Preserve intended behavior outside the story change
   - Avoid broad try/catch blocks, silent fallbacks, and speculative abstractions
   - Keep type safety and validation intact
   - Batch coherent edits instead of repeated micro-edits

7. **Follow Codex implementation quality rules**
   - Reuse existing helpers, patterns, and naming before adding new structure
   - Preserve intended behavior outside the story intent
   - Avoid broad try/catch blocks, silent fallbacks, and speculative abstractions
   - Keep validation intact; avoid unnecessary type casts
   - Batch coherent edits instead of repeated micro-edits

8. **Run verification commands**
   - Run every command under `commands` with `always: true` from project-config
   - Run conditionally relevant commands when their metadata matches the implemented change
   - Use the story's `### Verification Plan` for story-specific or additional checks

9. **Handle feedback and updates**
   - If implementing against existing `## Implementation feedback`, focus on the latest feedback block first
   - After addressing feedback, append a short status note to the story:
     ```markdown
     ## Implementation update (YYYY-MM-DD HH:MM)
     
     - Addressed: <short feedback items fixed>
     - Not addressed: <short feedback items not fixed + why>
     - Status: <done | partial | blocked>
     ```

10. **Report results clearly**
    - Completed work: list of implemented changes
    - Regressions fixed: if any were found and resolved
    - Regressions introduced: if any new issues were created
    - Unrelated pre-existing failures: if any were observed but not caused by this story
    - Remaining work: if story is partially complete
    - Blockers: if any prevent completion

## Stop If

- Change needed that would materially deviate from story intent
- Missing required context
- Blocker requiring user decision
- Delegated unit reports material scope widening, wrong analysis, cross-domain prerequisite, or unrelated failures

## Reporting

At completion, provide:
- Summary of completed work
- List of files modified
- Verification results
- Any issues encountered
- Next steps if applicable
