---
name: story-validator
description: Validate an implemented AiFact story and append pass/fail feedback to the story artifact.
user-invocable: true
allowed-tools:
  - read_file
  - grep
  - glob
  - bash
---

# Story Validator

> **Core Workflow**: See `../../../../workflows/story-validator.md` for the harness-agnostic workflow definition.

Validate an implemented AiFact story and append pass/fail feedback to the story artifact.

## Purpose

Validate an implemented AiFact story to ensure it meets acceptance criteria and is ready for delivery.

## Hard Constraints

- Only validate stories in work/backlog/in-progress/ or work/backlog/done/
- Do not modify implementation, only validate
- Do not run destructive operations
- Validation must be repo-grounded

## Execute

1. Read the implemented story file
2. Verify story has required sections: Analysis, Implementation updates
3. Run verification commands from project-config and story's Verification Plan
4. Check acceptance criteria:
   - Verify each criterion is met
   - Mark as pass/fail with evidence
5. Validate implementation quality:
   - Changes within analyzed boundaries
   - No modifications to protected files
   - Backward compatibility maintained
6. Check for regressions
7. Produce validation feedback
8. Append validation feedback to story file

## Validation Checks

### Acceptance Criteria
- Verify each criterion is met
- Mark as pass/fail with evidence
- Be explicit about what was verified

### Implementation Quality
- Changes are within analyzed boundaries
- No modifications to protected files
- Backward compatibility maintained
- No silent scope broadening

### Regression Checks
- Existing tests still pass
- No new issues introduced
- Existing functionality preserved

## Output Contract

Append Validation section to story:

```markdown
## Validation (YYYY-MM-DD HH:MM)

**Status**: pass | fail | partial

**Acceptance Criteria**:
- [x] Criterion 1 - evidence of pass
- [ ] Criterion 2 - reason for failure

**Verification Results**:
- Unit tests: pass | fail
- Integration tests: pass | fail
- E2E / Manual Validation: pass | fail

**Issues Found**:
- List of issues with severity

**Recommendation**: ready | needs-fixes | blocked
```

- Return validation status and recommendation
- Return list of blocking issues if any
