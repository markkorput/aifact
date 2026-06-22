# AF-009 Replace opencode story-reviewer agent with vibe skill

## Type

chore

## Context

As part of the migration from opencode workflow to vibe workflow, the story-reviewer agent needs to be converted to a vibe skill. The existing opencode story-reviewer agent at `.opencode/agent/story-reviewer.md` provides critical review functionality for drafted stories before implementation-oriented analysis. This work preserves the artifact-first workflow while transitioning to vibe's skill-based architecture.

The story-reviewer agent's role is to critique drafted stories by pressure-testing them through rough design thinking, identifying architectural fit concerns, failure modes, hidden complexity, and suggesting concrete revisions. This functionality must be preserved in the new vibe skill.

Existing vibe skills (story-analyzer, story-implementer, story-validator, etc.) provide a pattern to follow for skill structure, metadata, and execution flow.

## Functional Requirements

- Create a vibe skill that performs story review before implementation analysis
- Maintain the same critique capabilities as the opencode story-reviewer agent
- Support review of drafted stories in `work/backlog/backlog/` and `work/backlog/planned/`
- Provide structured critique output with clear section labels
- Identify architectural fit concerns, failure modes, and hidden complexity
- Suggest concrete story revisions when weaknesses are found
- Follow repo-first review principles (use tool access to ground critique)

## Technical Requirements

- Implementation approach: Create a new skill under `.vibe/skills/story-reviewer/` with a `SKILL.md` file
- Follow the existing vibe skill pattern with YAML frontmatter (name, description, user-invocable, allowed-tools)
- Include all required sections: Purpose, Hard Constraints, Execute, Error Handling, User Feedback
- Reuse the output contract format from the opencode agent (What exists today, Proposals, Open questions, Decision summary)
- Use the same critique labels: Verified alignment, Architecture fit concerns, Failure modes, Simpler approaches, Hidden complexity, Suggested story revisions
- Maintain the same constraints: review-only mode, no implementation, file system writes limited to `work/`
- Include the topic-driven lookup approach for repo-grounded critique
- Preserve the completion contract (main concerns surfaced, revisions concrete enough, unresolved questions identified)

- Decisions with rationale:
  - Keep the skill user-invocable for explicit review requests
  - Limit allowed-tools to read_file, grep, glob for repo lookup (matching opencode constraints)
  - Follow the same review method: pressure-test story by asking about architecture fit, failure modes, assumptions, simpler approaches, hidden concerns
  - Use the verification loop from the opencode agent to ensure grounded claims

- Rejected alternatives:
  - Not merging with story-analyzer: these are distinct workflow steps (review vs implementation scoping)
  - Not creating a command: skill invocation is more appropriate for this workflow step
  - Not removing the functionality: story review is critical for quality before implementation

- Constraints:
  - Must not modify source code or runtime configuration
  - File system writes limited to `work/` directory only
  - Must not perform implementation work
  - Must follow artifact-first workflow principles

- Validation requirements:
  - Skill must be loadable by vibe
  - Skill must produce valid critique when invoked on a drafted story
  - Skill must follow the existing vibe skill patterns and metadata structure

## Acceptance Criteria

- New vibe skill created at `.vibe/skills/story-reviewer/SKILL.md`
- Skill metadata matches vibe skill conventions (name, description, user-invocable: true, allowed-tools)
- Skill includes all critical sections from opencode agent: Purpose, Role, Hard Constraints, Review Method, Review Checklist, Completion Contract
- Skill preserves the output contract format with labeled critique sections
- Skill maintains repo-first review principles with tool usage guidelines
- Skill is validated by running it on at least one existing story in the backlog
- Opencode story-reviewer agent remains unchanged (for now) until validation passes
- Story file follows the standard template and all required fields are present
