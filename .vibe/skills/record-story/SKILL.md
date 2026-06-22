---
name: record-story
description: Use to record a new AiFact user story under work/backlog/backlog using the standard story template.
user-invocable: true
allowed-tools:
  - read_file
  - write_file
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

1. Generate today's date as `YYYY-MM-DD`.
2. Slugify the title in lowercase kebab-case.
3. Save to `work/backlog/backlog/YYYY-MM-DD-<slug>.md`.
4. Confirm the saved path.

## Template

```markdown
# <Title>

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
