---
name: story-reviewer
description: Review of a drafted story before code-impact analysis.
user-invocable: true
allowed-tools:
  - read_file
  - glob
---

# Story Reviewer

> **Core Workflow**: See `../../../../workflows/story-reviewer.md` for the harness-agnostic workflow definition.

Review of a drafted story before code-impact analysis. Preserves artifact-first workflow.

## Purpose

Review a drafted story to ensure it is ready for implementation scoping.

## Hard Constraints

- Do not rewrite the story
- Do not perform code-impact analysis
- Focus on story quality and completeness
- Only review stories in work/backlog/backlog/ or work/backlog/planned/
- Do not modify the story file

## Execute

1. Read the story file
2. Verify required sections: Type, Context, Functional Requirements, Acceptance Criteria
3. Check acceptance criteria are concrete and verifiable
4. Validate story type (feature, bug, chore, spike)
5. Review functional requirements for clarity and completeness
6. Identify gaps, ambiguities, missing decisions
7. Suggest improvements to scope, wording, structure
8. Provide clear recommendation on readiness

## Output Contract

- Clear pass/fail assessment of story readiness
- List of required changes or clarifications
- Suggestions for improvement (optional)
- Recommendation: ready, needs-revision, or blocked
- Cite specific sections that need attention
