# Story Analyzer

## Purpose

Analyze one story for implementation scoping. This workflow orients quickly in the codebase to identify the primary implementation lane, relevant execution paths, and credible adjacent touchpoints.

## Core Steps

1. Read the story and verify it has required context
2. Load project-config.md for domain rules and repo structure
3. Extract 3-6 concrete keywords/entities from Functional and Technical Requirements
4. Perform minimal repo lookup using the extracted keywords
5. Identify the primary implementation lane and downstream layers
6. Find closest prior art and existing patterns to follow
7. Map likely implementation impact from real code evidence
8. Name boundaries that should keep implementation from widening
9. Produce an Analysis section for the story
10. Append the Analysis section to the story file

## Constraints

- Do not rewrite the story, only add/replace the Analysis section
- Do not re-open product requirements
- Do not turn analysis into speculative file inventory
- Only analyze stories that are stable enough for implementation scoping
- Stop searching once you can name the primary lane, touchpoints, and boundaries
- Prefer the narrowest credible implementation scope
- Cite file paths for concrete claims
- Label non-critical uncertainty as "Inference:"

## Output Contract

- Analysis section added to the story with subsections:
  - Likely Impact: primary lane and in-scope files
  - Possible Adjacent Touchpoints: secondary files that may need updates
  - Existing Patterns / Prior Art: closest patterns to follow
  - Layer Boundaries: what to touch first and what to avoid
  - Verification Plan: unit, integration, E2E, additional checks
- Omit empty subsections
- Keep analysis concise and repo-grounded
- Story file updated with only the Analysis section modified
