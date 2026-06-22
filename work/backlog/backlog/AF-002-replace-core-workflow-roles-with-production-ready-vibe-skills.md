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
