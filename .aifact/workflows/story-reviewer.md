# Story Reviewer

## Purpose

Review a drafted story before code-impact analysis to ensure it is ready for implementation scoping. This workflow validates story quality, completeness, and clarity.

## Core Steps

1. Read the story file
2. Verify the story has required sections: Type, Context, Functional Requirements, Acceptance Criteria
3. Check that acceptance criteria are concrete and verifiable
4. Validate the story type is one of: feature, bug, chore, spike
5. Review functional requirements for clarity and completeness
6. Identify gaps, ambiguities, or missing decisions
7. Suggest improvements to scope, wording, or structure
8. Provide a clear recommendation on story readiness

## Constraints

- Do not rewrite the story, only suggest improvements
- Do not perform code-impact analysis (that's story-analyzer's role)
- Focus on story quality and completeness, not technical implementation
- Only review stories in work/stories/backlog/ or work/stories/planned/
- Do not modify the story file
- Be explicit about what is missing or unclear

## Output Contract

- Clear pass/fail assessment of story readiness
- List of required changes or clarifications needed
- Suggestions for improvement (optional)
- Return recommendation: ready, needs-revision, or blocked
- Cite specific sections or criteria that need attention
