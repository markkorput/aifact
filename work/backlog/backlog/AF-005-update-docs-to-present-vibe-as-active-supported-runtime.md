# AF-005 Update README, docs, AGENTS.md, and work/project-config.md to present Vibe as the active supported runtime

## Type

chore

## Context

The spike identified that `README.md`, `docs/**/*.md`, `AGENTS.md`, and `work/project-config.md` all currently describe the opencode workflow as active. Once the Vibe replacement is proven (after AF-002, AF-003, AF-004 are complete), these documents need to be updated to present Vibe as the primary and only supported agent runtime.

## Functional Requirements

- Update `AGENTS.md` to reference `.vibe/` as the active workflow implementation
- Update `work/project-config.md` to reference Vibe conventions and remove opencode-specific rules
- Update `README.md` to describe Vibe as the supported runtime
- Update `docs/**/*.md` to remove opencode/OpenAI/Codex references
- Perform stale-reference cleanup for opencode, OpenAI, Codex, and hardcoded model fields

## Technical Requirements

### Implementation Approach

- Scan all documentation files for opencode-specific references:
  - `.opencode/` path references
  - `opencode` as a workflow name
  - `OpenAI`, `Codex` model references
  - opencode-specific frontmatter fields (`mode:`, `model:`, `agent:`)
  - `@.opencode/` command references
- Update `AGENTS.md`:
  - Change "current active legacy workflow" to "active workflow"
  - Update references from `.opencode/` to `.vibe/`
  - Update agent behavior guidelines for Vibe
- Update `work/project-config.md`:
  - Update Repo Structure section to describe `.vibe/` as primary
  - Update Domain Rules to reference Vibe patterns
  - Update Loading Rules for Vibe conventions
  - Update Technology Rules if needed
- Update `README.md`:
  - Describe Vibe as the supported runtime
  - Update getting started instructions for Vibe
  - Update workflow description
- Update `docs/**/*.md`:
  - Remove or replace opencode-specific documentation
  - Update examples to use Vibe conventions

### Decisions

- Perform updates as a single coordinated change after core Vibe workflow is validated
- Keep a historical note in `README.md` about the opencode-to-Vibe migration
- Archive opencode-specific docs rather than deleting them (for historical reference)

### Constraints

- Do not perform this update until AF-002, AF-003, AF-004 are complete and validated
- Do not remove opencode-specific information that may still be relevant for existing users
- Preserve all `work/` artifact format documentation (stories, ideas, ADRs, guidelines)

## Acceptance Criteria

- `AGENTS.md` references `.vibe/` as the active workflow implementation
- `work/project-config.md` describes Vibe conventions as primary
- `README.md` presents Vibe as the supported runtime
- All `docs/**/*.md` files have opencode references removed or updated
- No stale references to opencode, OpenAI, Codex, or opencode-specific frontmatter remain in active documentation
- Historical context about the migration is preserved
