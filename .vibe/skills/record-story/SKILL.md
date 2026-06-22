---
name: record-story
description: Use to record a new AiFact user story under work/backlog/backlog using the standard story template with short ID.
user-invocable: true
allowed-tools:
  - read_file
  - write_file
  - bash
---

# Record Story

Record one new user story as a durable repo artifact.

## Required fields

- Title
- Type: `feature`, `bug`, `chore`, or `spike`
- Context
- Functional Requirements
- Technical Requirements
- Acceptance Criteria

## Save rules

1. Read the current counter from `work/.story-counter` (default to 1 if file doesn't exist).
2. Generate short ID as `AF-<NNN>` where NNN is the counter padded to 3 digits.
3. Generate today's date as `YYYY-MM-DD`.
4. Slugify the title in lowercase kebab-case.
5. Increment the counter and write it back to `work/.story-counter`.
6. Save to `work/backlog/backlog/<SHORT_ID>-YYYY-MM-DD-<slug>.md`.
7. Confirm the saved path.

## Template

```markdown
# <SHORT_ID> <Title>

## Type

<Type>

## Context

<Context>

## Functional Requirements

<Functional Requirements>

## Technical Requirements

<Technical Requirements - include implementation approach, decisions, rejected alternatives, constraints, validation requirements>

## Acceptance Criteria

<Acceptance Criteria>
```
