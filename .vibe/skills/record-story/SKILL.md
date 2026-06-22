---
name: record-story
description: Record a new AiFact user story under work/backlog/backlog using the standard story template with short ID. Preserves artifact-first workflow.
user-invocable: true
allowed-tools:
  - read_file
  - write_file
  - bash
---

# Record Story

Record one new user story as a durable repo artifact.

## Purpose

Create a properly formatted story file in the backlog that captures all required information for the AiFact workflow.

## Hard Constraints

- Only write story files under `work/backlog/backlog/`.
- Never modify existing stories without explicit user request.
- Never overwrite existing story files.
- Validate all required fields are present before saving.

## Required fields

- Title (1-80 characters)
- Type: `feature`, `bug`, `chore`, or `spike`
- Context
- Functional Requirements
- Technical Requirements
- Acceptance Criteria

## Validation Rules

Before recording:
- Title must not be empty and should be concise (1-80 chars).
- Type must be one of: `feature`, `bug`, `chore`, `spike`.
- All required sections must have non-empty content.
- If validation fails, report the specific missing or invalid fields and stop.

## Save rules

1. Read the current counter from `work/.story-counter` (default to 1 if file doesn't exist).
2. Validate counter is a positive integer; if invalid, reset to 1 and report.
3. Generate short ID as `AF-<NNN>` where NNN is the counter padded to 3 digits.
4. Generate today's date as `YYYY-MM-DD`.
5. Slugify the title: lowercase, replace spaces with hyphens, remove special characters except hyphens.
6. Construct filename: `<SHORT_ID>-<YYYY-MM-DD>-<slug>.md`
7. Check that the target file does not already exist; if it does, increment counter and retry (max 10 attempts).
8. Increment the counter and write it back to `work/.story-counter`.
9. Save to `work/backlog/backlog/<filename>`.
10. Confirm the saved path and report success or failure.

## Error Handling

- If `work/.story-counter` cannot be read: use default value 1, report warning.
- If counter cannot be written: report error, do not save story.
- If story file cannot be written: report error with path and reason.
- If any validation fails: report all validation errors at once, do not save.

## User Feedback

After successful save:
- Report: Story recorded at `<path>`
- Report: Short ID: `<SHORT_ID>`
- Report: Next available counter: `<N>`

After failed save:
- Report: Story NOT recorded
- List all validation errors
- List all technical errors

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

<Technical Requirements>

- Implementation approach
- Decisions with rationale
- Rejected alternatives
- Constraints
- Validation requirements

## Acceptance Criteria

<Acceptance Criteria>
```

## Examples

Valid Type values: `feature`, `bug`, `chore`, `spike`

Valid Title: "Add user authentication"

Invalid Title: "" (empty) or 81+ characters

Slug transformation: "Add User Auth!" -> "add-user-auth"
