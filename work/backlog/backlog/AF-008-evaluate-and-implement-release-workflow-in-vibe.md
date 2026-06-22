# AF-008 Evaluate and implement release workflow in Vibe

## Type

feature

## Context

The opencode workflow includes release workflow capabilities in `.opencode/agent/story-ship-orchestrator.md` and `.opencode/commands/release.md`. The spike deferred release workflow replacement to a later story. This story evaluates the opencode release workflow and implements a Vibe-native equivalent.

## Functional Requirements

- Evaluate current opencode release workflow capabilities
- Decide on Vibe-native implementation approach
- Implement release workflow as Vibe skills or documented workflow
- Preserve existing release artifact behavior

## Technical Requirements

### Implementation Approach

- Review release-related opencode files:
  - `.opencode/agent/story-ship-orchestrator.md`
  - `.opencode/commands/release.md`
  - `.opencode/agent/story-done.md` (may be related)
- Understand current release workflow:
  - Release preparation and validation
  - Version bumping
  - Changelog generation
  - Git tagging
  - GitHub release creation
  - Artifact publication
- Decide implementation approach:
  - Option A: Vibe skill for release orchestration
  - Option B: Documented release workflow
  - Option C: Multiple Vibe skills for release phases
- If implementing as skill(s):
  - Create `.vibe/skills/release/SKILL.md` or similar
  - Handle git operations via `bash` tool
  - Handle GitHub operations via `bash` tool with gh CLI
- Maintain artifact compatibility with `work/releases/` directory

### Decisions

- Prefer modular Vibe skills for release phases
- Use gh CLI for GitHub release operations
- Keep release workflow separate from PR workflow (AF-007)

### Constraints

- Do not implement until core Vibe workflow (AF-002) is proven
- Do not implement until PR workflow (AF-007) is evaluated (may share dependencies)
- Do not modify opencode release files until replacement is validated
- Preserve `work/releases/` artifact structure

## Acceptance Criteria

- Release workflow implementation (skills or documentation) is created and validated
- Release workflow covers: preparation, validation, version bumping, changelog, tagging, publication
- Git and GitHub operations work via Vibe's bash tool
- Release artifacts are created in `work/releases/` as expected
- End-to-end release can be performed using Vibe workflow
