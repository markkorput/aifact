---
name: story-validator
description: Use to validate an implemented AiFact story and append pass/fail feedback to the story artifact.
user-invocable: true
allowed-tools:
  - read_file
  - grep
  - write_file
  - bash
---

# Story Validator

Validate one implemented AiFact story.

## Execute

1. Read the story path provided by the user.
2. Read `work/project-config.md`, relevant guidelines, and changed files from git status/diff.
3. Translate the story's Functional Requirements, Acceptance Criteria, Verification Plan, Analysis, and latest Implementation feedback/update into a concrete validation checklist.
4. Validate the checklist with the narrowest credible proof surface first.
5. Run every repo-configured command marked `always: true` and conditionally relevant commands from `work/project-config.md`.
6. Distinguish story regressions from pre-existing unrelated failures.
7. Append either `## Implementation feedback (YYYY-MM-DD HH:MM)` for failures or `## Validation update (YYYY-MM-DD HH:MM)` for a pass.

## Gate

- `PASS` only when all required story checks pass or are not applicable.
- `FAIL` when a required requirement, acceptance criterion, relevant check, or proof item fails.
- `BLOCKED` only when missing context or environment prevents a credible result.

## Validation update format

```markdown
## Validation update (YYYY-MM-DD HH:MM)

* Validation passed with no regressions found.
* Gate result: PASS.
* Baseline checks passed or had no unrelated failures observed.
* Touched-scope coverage: <no material regression | justified exception>.
* Security review: <not applicable | completed>.
* Retained exploratory artifacts: <path(s) or none>.
* Validated checklist items: <items>.
```
