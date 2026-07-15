# Story Implementer

## Purpose

Implement one analyzed AiFact story. This workflow delivers story outcomes by implementing changes within the analyzed boundaries, staying focused on the narrowest safe change that satisfies story requirements.

## Core Steps

1. Read the story and verify it has an Analysis section
2. Load project-config.md for domain rules and command rules
3. Check for Implementation feedback and prioritize addressing it
4. Gather only enough context to act safely within analyzed boundaries
5. Plan implementation using Analysis as guidance:
   - Likely Impact as primary implementation lane
   - Possible Adjacent Touchpoints as secondary files
   - Layer Boundaries for scope constraints
6. Implement story outcomes:
   - Include necessary adjacent changes and tests for safe delivery
   - Reuse existing patterns and naming
   - Preserve intended behavior outside the story change
7. Run verification commands from project-config and story's Verification Plan
8. Report results: completed work, verification results, any issues

## Constraints

- Stop for user decision if changes materially deviate from story intent
- Do not silently broaden scope beyond analyzed boundary
- Do not remove or rewrite durable work artifacts except story sections needed for handoff
- Do not modify source code files outside analyzed scope
- Use analysis as guidance, not a strict file contract
- Batch coherent edits instead of repeated micro-edits
- Keep validation intact; avoid unnecessary type casts

## Output Contract

- Changes implemented within analyzed boundaries
- Verification commands executed with results
- Return completed work: list of implemented changes
- Return verification results: pass/fail status
- Return any regressions fixed or introduced
- Return remaining work if partially complete
- Return blockers if any prevent completion
- Optionally append Implementation update to story with status
