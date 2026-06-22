# AF-007 Evaluate and implement PR workflow in Vibe

## Type

feature

## Context

The opencode workflow includes PR workflow capabilities in `.opencode/agent/story-pr.md`. The spike deferred PR workflow replacement to a later story. This story evaluates the opencode PR workflow and implements a Vibe-native equivalent or documented workflow.

## Functional Requirements

- Evaluate current opencode PR workflow capabilities
- Decide on Vibe-native implementation approach
- Implement PR workflow as Vibe skills or documented shell workflow
- Preserve existing PR artifact behavior where applicable

## Technical Requirements

### Implementation Approach

- Review `.opencode/agent/story-pr.md` to understand:
  - PR creation and submission workflow
  - PR checks and validation
  - GitHub CLI usage patterns
  - Artifact handoff behavior
- Decide implementation approach:
  - Option A: Vibe skill that orchestrates PR workflow
  - Option B: Documented shell workflow using gh CLI
  - Option C: Hybrid approach with Vibe skills for complex logic
- If implementing as skill(s):
  - Create `.vibe/skills/story-pr/SKILL.md` or similar
  - Handle git operations via `bash` tool
  - Handle GitHub operations via `bash` tool with gh CLI
  - Preserve artifact-first handoffs
- If documenting as shell workflow:
  - Create `work/pr-workflow.md` or similar
  - Document required tools (gh CLI)
  - Document workflow steps

### Decisions

- Prefer Vibe skills for complex workflow logic
- Use gh CLI for GitHub-specific operations (via bash tool)
- Maintain compatibility with existing `work/` artifact structure

### Constraints

- Do not implement until core Vibe workflow (AF-002) is proven
- Do not modify opencode PR workflow files until replacement is validated
- Preserve any PR-specific artifact formats in `work/`

## Acceptance Criteria

- PR workflow implementation (skill or documentation) is created and validated
- PR workflow handles the same use cases as opencode story-pr
- GitHub CLI integration works via Vibe's bash tool
- PR creation, checks, and validation are covered
- Existing PR-related artifacts remain compatible
