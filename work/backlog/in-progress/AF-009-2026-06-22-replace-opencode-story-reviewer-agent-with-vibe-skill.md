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

## Analysis

### Likely Impact

- Primary implementation lane: `.vibe/skills/story-reviewer/SKILL.md` - new skill file to be created
- `.vibe/skills/story-reviewer/` - new directory for the story-reviewer skill
- `.vibe/skills/story-reviewer/SKILL.md` - contains the ported review logic from opencode agent

### Possible Adjacent Touchpoints

- `work/backlog/backlog/*.md` - existing drafted stories for validation testing
- `.opencode/agent/story-reviewer.md` - source material to port (read-only reference)

### Existing Patterns / Prior Art

- `.vibe/skills/story-analyzer/SKILL.md` - closest vibe skill pattern with YAML frontmatter (name, description, user-invocable, allowed-tools)
- `.vibe/skills/record-story/SKILL.md` - example of vibe skill structure and sections
- `.opencode/agent/story-reviewer.md` - the opencode agent to convert, contains complete review methodology, output contract, and critique labels

### Layer Boundaries

- Touch first: `.vibe/skills/story-reviewer/` directory and SKILL.md file
- Avoid unless evidence emerges: `.opencode/` directory (preserve until validation passes), source code, runtime configuration, files outside `work/` directory

### Verification Plan

**Unit Tests**:

- Verify SKILL.md has valid YAML frontmatter with required fields (name, description, user-invocable, allowed-tools)
- Verify all required sections exist: Purpose, Role, Hard Constraints, Review Method, Review Checklist, Completion Contract
- Verify output contract format matches opencode agent (What exists today, Proposals, Open questions, Decision summary)
- Verify critique labels are present (Verified alignment, Architecture fit concerns, Failure modes, Simpler approaches, Hidden complexity, Suggested story revisions)

**Integration Tests**:

- Verify skill can be loaded by vibe without errors
- Verify skill follows vibe skill metadata conventions

**E2E / Manual Validation**:

- Run skill on at least one existing story from `work/backlog/backlog/` and verify it produces valid critique output
- Verify critique output contains labeled sections matching opencode agent format
- Verify skill maintains review-only mode (no implementation, no file writes outside `work/`)

**Additional Checks (as applicable)**:

- Verify constraints are preserved: review-only mode, file system writes limited to `work/`, allowed-tools limited to read_file, grep, glob

## Implementation feedback (2026-06-22)

- Addressed: Created `.vibe/skills/story-reviewer/SKILL.md` with all required sections and metadata
- Addressed: Ported all critique capabilities from opencode agent including output contract and critique labels
- Addressed: Maintained all constraints (review-only, work/ writes only, allowed-tools: read_file, grep, glob)
- Addressed: Preserved topic-driven lookup approach and repo-first review principles
- Not addressed: E2E validation on existing stories (requires manual testing with vibe skill invocation)
- Status: done (pending E2E validation)
