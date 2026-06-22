# AF-002 Replace core workflow roles with production-ready Vibe skills

## Type

feature

## Context

The spike `2026-06-17-adapt-opencode-workflow-for-mistral-vibe.md` created minimal Vibe-native skills for the core lifecycle: brainstorm, record-story, story-start, story-analyzer, story-implementer, and story-validator. These MVP skills proved the Vibe conventions but need to be hardened into production-ready implementations that fully replace the corresponding opencode agents.

## Functional Requirements

- Replace `.opencode/agent/brainstorm.md` with a production-ready `.vibe/skills/brainstorm/SKILL.md`
- Replace `.opencode/skills/record-story/SKILL.md` with a production-ready `.vibe/skills/record-story/SKILL.md`
- Replace `.opencode/agent/story-start.md` with a production-ready `.vibe/skills/story-start/SKILL.md`
- Replace `.opencode/agent/story-analyzer.md` with a production-ready `.vibe/skills/story-analyzer/SKILL.md`
- Replace `.opencode/agent/story-implementer.md` with a production-ready `.vibe/skills/story-implementer/SKILL.md`
- Replace `.opencode/agent/story-validator.md` with a production-ready `.vibe/skills/story-validator/SKILL.md`
- Ensure all production skills follow Vibe-native conventions (Agent Skills spec, proper frontmatter, user-invocable where appropriate)
- Preserve all existing artifact-first handoff behavior from the opencode versions

## Technical Requirements

### Implementation Approach

- Review each MVP skill against its opencode counterpart for functional gaps
- Add error handling, validation, and user feedback appropriate for production use
- Ensure backward compatibility: existing `work/` artifacts remain compatible
- Document any behavior changes in the story's Analysis section
- Update skill frontmatter with proper `allowed-tools` based on actual tool usage

### Decisions

- Keep the skill-based approach rather than agent-based for core workflow
- Maintain the same phase contracts: each skill consumes prior story sections and produces the next
- Preserve the existing `work/` directory structure and artifact formats

### Constraints

- Do not modify the existing opencode agents until this story is complete and validated
- All new skills must pass the same acceptance criteria as their opencode counterparts
- Vibe CLI must be able to discover and invoke all skills

## Acceptance Criteria

- All six production skills are created and validated
- Each skill has comprehensive error handling and user guidance
- End-to-end lifecycle works: brainstorm -> record-story -> story-start -> story-analyzer -> story-implementer -> story-validator
- All existing story artifacts in `work/backlog/**/*` remain compatible
- No references to `.opencode/` in the production skills
- Vibe can discover all skills via `vibe --trust` in the repository root

## Analysis

### Likely Impact

- Primary implementation lane: `.vibe/skills/` directory -> Vibe skill discovery -> CLI invocation
- `.vibe/skills/brainstorm/SKILL.md` - core workflow entry point, needs production hardening
- `.vibe/skills/record-story/SKILL.md` - story capture, needs production hardening
- `.vibe/skills/story-start/SKILL.md` - story kickoff, needs production hardening
- `.vibe/skills/story-analyzer/SKILL.md` - implementation scoping, needs production hardening
- `.vibe/skills/story-implementer/SKILL.md` - story delivery, needs production hardening
- `.vibe/skills/story-validator/SKILL.md` - story verification, needs production hardening

### Possible Adjacent Touchpoints

- `.opencode/agent/brainstorm.md` - reference for brainstorm behavior
- `.opencode/agent/story-start.md` - reference for story-start behavior
- `.opencode/agent/story-analyzer.md` - reference for story-analyzer behavior
- `.opencode/agent/story-implementer.md` - reference for story-implementer behavior
- `.opencode/agent/story-validator.md` - reference for story-validator behavior
- `.opencode/skills/record-story/SKILL.md` - reference for record-story behavior

### Existing Patterns / Prior Art

- `.vibe/skills/brainstorm/SKILL.md` - MVP skill with Vibe-native frontmatter (`name`, `description`, `user-invocable`, `allowed-tools`)
- `.opencode/agent/brainstorm.md` - opencode agent with legacy frontmatter (`description`, `mode`, `model`)
- Directory-based skill structure: each skill in its own subdirectory with SKILL.md

### Layer Boundaries

- Touch first: `.vibe/skills/` for all six production skill implementations
- Avoid unless evidence emerges: `.opencode/` (per constraint: do not modify until story is complete and validated)
- Avoid unless evidence emerges: `work/` (durable artifacts, read-only per project-config)

### Verification Plan

**Unit Tests**:

- Each skill file validates against its schema (frontmatter, required sections)
- Each skill contains proper `allowed-tools` based on actual tool usage

**Integration Tests**:

- Vibe CLI discovers all six skills via `vibe --trust`
- Each skill can be invoked with its expected arguments
- Skills maintain backward compatibility with existing `work/` artifacts

**E2E / Manual Validation**:

- End-to-end lifecycle: brainstorm -> record-story -> story-start -> story-analyzer -> story-implementer -> story-validator
- Each skill produces artifacts compatible with the next phase
- No references to `.opencode/` in production skills

**Additional Checks (as applicable)**:

- All production skills follow Vibe-native conventions per Agent Skills spec
- Error handling and user feedback present in all skills
