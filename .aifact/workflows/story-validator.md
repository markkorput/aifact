# Story Validator

## Purpose

Validate an implemented AiFact story and append pass/fail feedback to the story artifact. This workflow ensures implemented work meets acceptance criteria and is ready for delivery.

## Core Steps

1. Read the implemented story file
2. Verify the story has required sections: Analysis, Implementation updates
3. Run verification commands from project-config and story's Verification Plan
4. Check acceptance criteria from the story:
   - Verify each criterion is met
   - Mark as pass/fail with evidence
5. Validate implementation quality:
   - Changes are within analyzed boundaries
   - No modifications to protected files (per constraints)
   - Backward compatibility maintained
6. Check for regressions:
   - Existing tests still pass
   - No new issues introduced
7. Produce validation feedback:
   - Overall pass/fail status
   - Individual acceptance criteria results
   - Any issues found
8. Append validation feedback to story file

## Constraints

- Only validate stories in work/stories/in-progress/ or work/stories/done/
- Do not modify implementation, only validate
- Do not run destructive operations
- Validation must be repo-grounded
- Clearly state what was verified and how
- Report both passes and failures explicitly

## Output Contract

- Validation feedback appended to story file as new section:
  ```markdown
  ## Validation (YYYY-MM-DD HH:MM)
  
  **Status**: pass | fail | partial
  
  **Acceptance Criteria**:
  - [x] Criterion 1 - evidence
  - [ ] Criterion 2 - reason for failure
  
  **Verification Results**:
  - Unit tests: pass | fail
  - Integration tests: pass | fail
  - E2E tests: pass | fail
  
  **Issues Found**:
  - List of any issues with severity
  
  **Recommendation**: ready | needs-fixes | blocked
  ```
- Return validation status and recommendation
- Return list of any blocking issues
