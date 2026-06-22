---
name: story-analyzer
description: Analyze an in-progress AiFact story and write a bounded implementation Analysis section. Preserves artifact-first handoffs.
user-invocable: true
allowed-tools:
  - read_file
  - grep
  - write_file
---

# Story Analyzer

Analyze one story for implementation scoping. Optimized for orienting quickly in the codebase like a senior engineer.

## Purpose

Use after brainstorming and story review, when the story is stable enough for implementation scoping.
Your job is to orient quickly so implementation stays focused:
- Trace relevant execution paths
- Identify the primary implementation lane
- Identify the right layers to touch first
- Identify the layers not to touch unless evidence emerges
- Find the closest prior art and existing patterns to follow
- Map likely implementation impact from real code, not story wording alone

This analysis is for implementers reading the story later. Optimize for scoping `story-implementer`.

## Hard Constraints

- Do not rewrite the story.
- Do not re-open product requirements unless a missing technical detail blocks credible analysis.
- Do not turn analysis into a speculative file inventory.
- Add or replace only the story's `## Analysis` section.

## Execute

1. **Read story from provided path argument**
   - If path is missing or empty, report error: "No story path provided"
   - If story file cannot be read, report error: "Story file not found at <path>"

2. **Load required context**
   - Read `work/project-config.md` (required)
   - Load Always Load guidelines from project-config
   - Load analysis-matched guidelines if they exist
   - Inspect command rules

3. **Extract 3-6 concrete keywords/entities from the story**
   - Focus on domain-specific terms from Functional Requirements and Technical Requirements
   - Prioritize nouns that represent files, modules, components, or systems

4. **Before using tools, give a brief preamble**
   - State the goal: "Analyzing <story-title> for implementation scoping"
   - State what you are checking: "Looking for primary implementation lane and boundaries"

5. **Perform minimal repo lookup in relevant code**
   - Start with one targeted lookup batch using the extracted keywords
   - Use `grep` to find relevant files
   - Use `read_file` for 1-3 most relevant files to confirm patterns
   - Stop searching once you can name:
     - The primary implementation lane
     - Credible adjacent touchpoints
     - The boundaries that should keep implementation from widening

6. **Specifically look for**
   - Relevant execution paths
   - Likely entry points and downstream layers
   - The closest existing patterns or prior art to reuse
   - Boundaries and layers that should probably remain untouched

7. **Stop once you can name**
   - The primary implementation lane
   - The likely adjacent touchpoints needed for safe delivery
   - The boundaries that should keep implementation from widening

8. **Prefer the narrowest credible implementation scope**
   - Name the first layer(s) that should likely change
   - Include adjacent files only when they are likely needed for safe delivery
   - Avoid speculative widening across unrelated layers or domains

9. **Handle conflicts between story wording and repo evidence**
   - State the repo-grounded fact and cite it
   - State the story assumption or ambiguity separately
   - Do not silently reconcile the conflict
   - Treat it as a risk or uncertainty, not a reason to broaden the scope

10. **Produce the Analysis section**
    - Follow the required format below
    - Cite file paths for concrete claims when possible
    - Label non-critical uncertainty as `Inference:` rather than guessing
    - If no close prior art is found quickly, say so plainly
    - Keep analysis concise; do not list every possibly related file

11. **Update story**
    - If `## Analysis` exists, replace only that section up to next `##` heading
    - Else append `## Analysis` to end of file
    - Keep all other sections unchanged

## Analysis format

```markdown
## Analysis

### Likely Impact

- Primary implementation lane: <entry point -> downstream layer(s) -> touchpoints>
- <file/module> - <why it is likely in scope>

### Possible Adjacent Touchpoints

- <secondary file/module> - <why it may need an update for safe delivery>

### Existing Patterns / Prior Art

- <file/flow> - <closest pattern to follow and what is similar>

### Layer Boundaries

- Touch first: <layers/modules that should likely change first>
- Avoid unless evidence emerges: <layers/modules that likely should remain untouched>

### Verification Plan

**Unit Tests**:

- <story-specific unit checks>

**Integration Tests**:

- <story-specific integration checks>

**E2E / Manual Validation**:

- <story-specific end-to-end checks>

**Additional Checks (as applicable)**:

- <story-specific checks: migration, API, security, perf, provider-specific>
```

Omit empty subsections. Keep analysis concise and repo-grounded.

## Error Handling

- If story file is not found: report error with path and stop
- If project-config cannot be read: report error and stop
- If analysis cannot be completed due to missing context: report what's missing and stop

## User Feedback

- Report analysis completion status
- Report any uncertainties or inferences
- Report if prior art was not found
- Report the story path with updated Analysis section
