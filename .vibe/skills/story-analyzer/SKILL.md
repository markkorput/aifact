---
name: story-analyzer
description: Use to analyze an in-progress AiFact story and write a bounded implementation Analysis section.
user-invocable: true
allowed-tools:
  - read_file
  - grep
  - write_file
---

# Story Analyzer

Analyze one story for implementation scoping.

## Execute

1. Read the story path provided by the user.
2. Read `work/project-config.md` and any relevant guideline files named there.
3. Extract 3-6 concrete keywords/entities from the story.
4. Perform minimal repo lookup to confirm the likely implementation lane from actual files.
5. Stop searching once the primary lane, adjacent touchpoints, prior art, and boundaries are clear enough.
6. Add or replace only the story's `## Analysis` section.

## Analysis format

```markdown
## Analysis

### Likely Impact

- Primary implementation lane: <entry point -> downstream layer(s) -> touchpoints>
- <file/module> - <why it is likely in scope>

### Possible Adjacent Touchpoints

- <secondary file/module> - <why it may need an update>

### Existing Patterns / Prior Art

- <file/flow> - <closest pattern to follow>

### Layer Boundaries

- Touch first: <layers/modules>
- Avoid unless evidence emerges: <layers/modules>

### Verification Plan

**Unit Tests**:

- <story-specific checks>

**Integration Tests**:

- <story-specific checks>

**E2E / Manual Validation**:

- <story-specific checks>

**Additional Checks (as applicable)**:

- <story-specific checks>
```

Omit empty subsections. Keep analysis concise and repo-grounded.
