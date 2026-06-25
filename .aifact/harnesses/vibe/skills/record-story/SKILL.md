---
name: record-story
description: Record a new AiFact user story under work/backlog/backlog using the standard story template with short ID.
user-invocable: true
allowed-tools:
  - read_file
  - write_file
  - glob
---

# Record Story

> **Core Workflow**: See `../../../../workflows/record-story.md` for the harness-agnostic workflow definition.

Record a new AiFact user story under work/backlog/backlog using the standard story template with short ID.

## Purpose

Record a new AiFact user story. Preserves artifact-first workflow.

## Hard Constraints

- Do not modify existing stories
- Do not auto-start stories
- Do not modify files outside work/backlog/
- Story ID must be unique
- Story file name: <ID>-<slugified-title>.md

## Execute

1. Read `work/project-config.md` first
2. Read `AGENTS.md`
3. Capture user request as story title
4. Generate unique story ID
5. Extract core user need
6. Create story with structure:
   ```markdown
   # <ID> <Title>

   ## Type
   <feature|bug|chore|spike>

   ## Context
   <user need and background>

   ## Functional Requirements
   <what the feature should do>

   ## Technical Requirements
   <technical implementation details>

   ## Acceptance Criteria
   - [ ] <verifiable criterion 1>
   - [ ] <verifiable criterion 2>
   ```
7. Write story to work/backlog/backlog/
8. Return absolute path and story ID

## Output Contract

- New markdown file in work/backlog/backlog/
- Story contains all required sections
- Return absolute path to story file
- Return story ID
