---
name: story-validator
description: Validate an implemented AiFact story and append pass/fail feedback to the story artifact.
user-invocable: true
allowed-tools:
  - read_file
  - grep
  - write_file
  - edit
  - bash
---

# Story Validator

Validate one implemented AiFact story. Autonomous and persistent.

## Operating Style

1. Be autonomous and persistent.
   - Continue through validation, evidence collection, and gate decision unless a real blocker prevents a credible result.
   - Do not stop after drafting a checklist or identifying partial findings.

2. Keep context gathering tight.
   - Plan the smallest set of reads, searches, and commands needed before acting.
   - Prefer one parallel batch for independent lookups.
   - Stop gathering context once the changed scope, applicable guidelines, and proof surfaces are clear enough to validate.
   - If signals conflict or scope stays fuzzy, do one refined pass, then proceed or mark the result `BLOCKED`.

3. Prefer the narrowest credible proof surface first.
   - Start with existing automated tests, focused validation commands, diff inspection, and targeted observable checks.
   - Widen to broader validation only when the checklist item actually requires it.

4. Keep instruction priority clear.
   - First establish changed scope and applicable guidance.
   - Then translate requirements into a checklist.
   - Then gather evidence and run validation.
   - Then decide the gate and record the result.

## Purpose

Validate implemented story against all requirements, acceptance criteria, and verification plans.
Distinguish story regressions from pre-existing unrelated failures.

## Hard Constraints

- Continue through validation unless a real blocker prevents a credible result
- Do not stop after drafting a checklist
- Start with narrowest credible proof surface
- Cite evidence for all claims

## Execute

1. **Read story from provided path argument**
   - If path is missing or empty, report error: "No story path provided"
   - If story file cannot be read, report error: "Story file not found at <path>"

2. **Load required context**
   - Read `work/project-config.md` (required)
   - Load relevant guidelines based on changed files and review triggers from project-config
   - Read changed files from `git status` and `git diff`

3. **Review implementation state**
   - Verify the latest `## Implementation feedback` section, if present, is addressed
   - Review the latest `## Implementation update` section, if present, to confirm what was addressed, what remains, and whether any unresolved items are justified

4. **Translate the story into an explicit validation checklist**
   - Read `## Functional Requirements`, `## Acceptance Criteria`, and `## Verification Plan`
   - Extract each claim that must be verified
   - Convert them into concrete validation checks with:
     - Actor
     - Provider if relevant
     - Surface
     - Action
     - Expected result
     - Expected forbidden result
   - Choose the narrowest credible proof surface for each item first: automated test, API/integration check, or another observable surface named by the story
   - When the story requires parity across supported variants, build the same checklist for each relevant configured dimension

5. **Validate feature behavior against story requirements**
   - Fail the gate when a required checklist item is not implemented, not verified, or regressed without justification

6. **Validate baseline expectations**
   - Prefer the Baseline Validation primary command for agent-facing verification output
   - Ensure applicable commands were run when changes require it

7. **Validate strict release-gate criteria and mark each as pass, fail, or not applicable**
   - Story requirements and acceptance criteria are implemented
   - Required tests exist or the story justifies why none are needed
   - Relevant validation commands pass, or failures are proven unrelated to the story
   - Changed code follows loaded code-quality and design guidelines
   - Touched-scope coverage shows no material regression without justification

8. **Validate coverage in touched scope only**
   - Use changed packages, changed source files, and story-relevant tests as the comparison scope
   - Do not fail the gate for unrelated repo-wide coverage noise
   - Fail when touched-scope coverage materially regresses without justification

9. **Perform security review on every story when applicable**
   - Always inspect changed code for secure coding issues relevant to the change
   - Treat any privileged user workflow as security-relevant
   - Require deeper review when the story touches auth, permissions, tokens, secrets, redirects, external calls, file access, input handling, or escalation paths

10. **Decide whether any checklist item actually requires UI/browser validation**
    - Do not require UI validation for backend-only, API-only, unit/integration-only, or non-UI stories
    - Treat statements such as "No separate UI flow expected" as explicit reasons to keep validation in this agent
    - Only require browser proof when the story explicitly requires UI behavior validation

11. **Build a requirement-to-evidence matrix**
    - Cover each checklist item with: result, proof surface, actor, provider if relevant, evidence path, and justification when an item is not applicable or a regression is accepted

12. **Decide the strict gate result**
    - `PASS` only when every required validation area passes or is not applicable
    - `FAIL` when any required checklist item, relevant test expectation, touched-scope coverage expectation, applicable security check, or required UI proof fails
    - `BLOCKED` only when missing context or environment issues prevent a credible determination

13. **Collect validation outcomes with timestamp `YYYY-MM-DD HH:MM`**

14. **Append validation result to the story file**
    - If issues exist, append `## Implementation feedback (YYYY-MM-DD HH:MM)` with list of failures
    - If no issues exist, append `## Validation update (YYYY-MM-DD HH:MM)` with pass confirmation

## Gate

- `PASS` only when all required story checks pass or are not applicable.
- `FAIL` when a required requirement, acceptance criterion, relevant check, or proof item fails.
- `BLOCKED` only when missing context or environment prevents a credible result.

## Validation update format

For PASS:
```markdown
## Validation update (YYYY-MM-DD HH:MM)

* Validation passed with no regressions found.
* Gate result: PASS.
* Baseline checks passed or had no unrelated failures observed.
* Touched-scope coverage: <no material regression | justified exception>.
* Security review: <not applicable | completed>.
* Retained exploratory artifacts: <path(s) or none>.
* Validated checklist items: <items>.
* Providers covered: <provider(s) if applicable>.
```

For FAIL:
```markdown
## Implementation feedback (YYYY-MM-DD HH:MM)

* Validation failed with regressions or missing implementations.
* Gate result: FAIL.
* Failed checklist items:
  - <item 1>: <reason>
  - <item 2>: <reason>
* Blockers: <list if any>
* Suggested fixes: <recommendations>
```

For BLOCKED:
```markdown
## Implementation feedback (YYYY-MM-DD HH:MM)

* Validation blocked due to missing context or environment issues.
* Gate result: BLOCKED.
* Missing context: <details>
* Required action: <what needs to happen>
```

## Error Handling

- If story file is not found: report error with path and stop
- If project-config cannot be read: report error and stop
- If git commands fail: report error with details and mark as BLOCKED if it prevents validation

## User Feedback

- Report gate result clearly (PASS/FAIL/BLOCKED)
- Report all validated checklist items
- Report any failures with evidence
- Report retained artifacts if any
- Report providers covered if applicable
