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
