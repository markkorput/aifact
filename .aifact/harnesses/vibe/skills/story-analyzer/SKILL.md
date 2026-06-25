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

> **Core Workflow**: See `../../../../workflows/story-analyzer.md` for the harness-agnostic workflow definition.

Analyze an in-progress AiFact story and write a bounded implementation Analysis section.

## Purpose

Analyze one story for implementation scoping. Optimized for orienting quickly in the codebase like a senior engineer.

## Hard Constraints

- Do not rewrite the story
- Do not re-open product requirements
- Do not turn analysis into speculative file inventory
- Add or replace only the story's Analysis section

## Execute

1. Read story from provided path
2. Load work/project-config.md
3. Extract 3-6 concrete keywords/entities from story
4. Perform minimal repo lookup with keywords
5. Identify primary implementation lane
6. Find closest prior art and patterns
7. Map likely implementation impact
8. Name boundaries that keep implementation from widening
9. Produce Analysis section
10. Update story with Analysis

## Analysis Format

```markdown
## Analysis

### Likely Impact
- Primary implementation lane: <entry point -> downstream layers>
- <file/module> - <why it is likely in scope>

### Possible Adjacent Touchpoints
- <secondary file/module> - <why it may need an update>

### Existing Patterns / Prior Art
- <file/flow> - <closest pattern to follow>

### Layer Boundaries
- Touch first: <layers to change first>
- Avoid unless evidence emerges: <layers to leave untouched>

### Verification Plan
**Unit Tests**: <checks>
**Integration Tests**: <checks>
**E2E / Manual Validation**: <checks>
**Additional Checks**: <checks>
```

## Output Contract

- Analysis section added/replaced in story
- All other sections unchanged
- Analysis is concise and repo-grounded
- Cite file paths for concrete claims
- Label uncertainty as "Inference:"
