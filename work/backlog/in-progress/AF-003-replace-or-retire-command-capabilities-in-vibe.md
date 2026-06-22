# AF-003 Replace or retire command capabilities using Vibe-supported mechanics

## Type

feature

## Context

The opencode workflow includes command entrypoints in `.opencode/commands/` for: init, change, commit, release, create-guideline, and refresh-project-config. The spike identified these as needing replacement using Vibe-supported skill mechanics or documented shell workflows. The MVP did not address commands, focusing only on core lifecycle skills.

## Functional Requirements

- Evaluate each command capability for Vibe-native replacement or retirement
- Implement Vibe skills for commands that should be retained as user-invocable actions
- Document shell-based workflows for commands that don't warrant a Vibe skill
- Retire commands that have no place in the Vibe workflow

## Technical Requirements

### Implementation Approach

- Analyze each command file to understand its purpose and usage patterns:
  - `init.md` / `init.sh`: Bootstrap new project structure
  - `change.md`: Git change automation
  - `commit.md`: Git commit with message generation
  - `release.md`: Release workflow
  - `create-guideline.md`: Guideline creation
  - `refresh-project-config.md`: Config regeneration
- Decide for each: replace with Vibe skill, replace with documented shell workflow, or retire
- Implement chosen replacements

### Compatibility Matrix (from spike)

| Command | Current Surface | Recommended Outcome | Notes |
| --- | --- | --- | --- |
| init | `.opencode/commands/init.md`, `.opencode/custom/init/init.sh` | Adapt with changed mechanics | No Vibe-native bootstrap; keep shell-driven |
| change | `.opencode/commands/change.md` | Defer until a later story | Could become Vibe skill |
| commit | `.opencode/commands/commit.md` | Defer until a later story | Could become Vibe skill or documented git discipline |
| release | `.opencode/commands/release.md` | Defer until a later story | Out of MVP scope; evaluate separately |
| create-guideline | `.opencode/commands/create-guideline.md` | Defer until a later story | Could become Vibe skill |
| refresh-project-config | `.opencode/commands/refresh-project-config.md` | Defer until a later story | Could become Vibe skill |

### Decisions

- init: Keep as shell-driven bootstrap outside `.opencode/`; create reviewed `work/init.sh` or similar
- change, commit: Implement as Vibe skills with proper git tool usage
- release: Defer to separate story (see AF-008)
- create-guideline, refresh-project-config: Implement as Vibe skills

### Constraints

- Do not remove `.opencode/commands/` files until replacements are validated
- Preserve the `work/` artifact structure for any new bootstrap
- Vibe skills must use the `bash` tool for git operations, not direct shell execution

## Acceptance Criteria

- init replacement: Shell script created outside `.opencode/`, validated to create proper `work/` structure
- change skill: Created and validated for git change automation
- commit skill: Created and validated for git commit workflow
- create-guideline skill: Created and validated
- refresh-project-config skill: Created and validated
- All new skills/artifacts are in `.vibe/skills/` or documented locations
- Opencode command files remain untouched until validation passes

## Analysis

### Likely Impact

- Primary implementation lane: `.vibe/skills/` directory for new Vibe skills + `work/` for shell-driven bootstrap
- `.vibe/skills/change/SKILL.md` - Vibe skill for git change automation (replaces `.opencode/commands/change.md`)
- `.vibe/skills/commit/SKILL.md` - Vibe skill for git commit workflow (replaces `.opencode/commands/commit.md`)
- `.vibe/skills/create-guideline/SKILL.md` - Vibe skill for guideline creation (replaces `.opencode/commands/create-guideline.md`)
- `.vibe/skills/refresh-project-config/SKILL.md` - Vibe skill for config regeneration (replaces `.opencode/commands/refresh-project-config.md`)
- `work/init.sh` - Shell script for bootstrap (replaces `.opencode/custom/init/init.sh` usage)

### Possible Adjacent Touchpoints

- `.vibe/skills/story-start/SKILL.md` - Existing pattern to follow for Vibe skill structure and YAML frontmatter
- `.opencode/skills/record-story/SKILL.md` - Existing opencode skill pattern for reference
- `.opencode/commands/init.md` - Reference for init behavior when creating `work/init.sh`

### Existing Patterns / Prior Art

- `.vibe/skills/` - Vibe skills use SKILL.md with YAML frontmatter: `name`, `description`, `user-invocable`, `allowed-tools`
- `.opencode/commands/` - opencode commands use markdown with YAML frontmatter: `description`, `agent`
- `.opencode/custom/init/init.sh` - Bootstrap is shell-driven, creates `work/` directory structure
- `.vibe/skills/story-start/SKILL.md` - Closest prior art for Vibe skill implementation pattern

### Layer Boundaries

- Touch first: `.vibe/skills/` (new skills), `work/init.sh` (bootstrap script)
- Avoid unless evidence emerges: `.opencode/commands/`, `.opencode/custom/init/`, `.opencode/skills/` (per constraint: do not remove until replacements are validated)

### Verification Plan

**Unit Tests**:
- Each Vibe skill executes its core function correctly with valid inputs
- Each Vibe skill handles edge cases and error conditions per its specification

**Integration Tests**:
- Vibe skills work correctly with git operations via `bash` tool
- `work/init.sh` creates proper `work/` directory structure matching `.opencode/custom/init/init.sh` behavior

**E2E / Manual Validation**:
- User can invoke each new Vibe skill and get expected results
- User can run `work/init.sh` to bootstrap a new project
- All new artifacts follow existing naming and structure conventions

**Additional Checks (as applicable)**:
- No `.opencode/commands/` files are modified or removed before validation passes

## Implementation update (2026-06-22 22:58)

- Addressed: All acceptance criteria implemented
  - work/init.sh created and validated to create proper work/ structure
  - .vibe/skills/change/SKILL.md created for git change automation
  - .vibe/skills/commit/SKILL.md created for git commit workflow
  - .vibe/skills/create-guideline/SKILL.md created for guideline creation
  - .vibe/skills/refresh-project-config/SKILL.md created for config regeneration
- Not addressed: None
- Status: done
