# AF-004 Replace bootstrap/init behavior for Vibe while preserving work/ artifact structure

## Type

feature

## Context

The current opencode bootstrap at `.opencode/custom/init/init.sh` and `.opencode/commands/init.md` creates the `work/` directory structure, default `AGENTS.md`, `work/project-config.md`, and `work/README.md` symlink. The spike found no Vibe-native bootstrap convention, recommending that bootstrap remain shell/documentation-driven. However, the bootstrap artifacts and their creation logic need to be migrated out of `.opencode/` to a Vibe-compatible location.

## Functional Requirements

- Create a Vibe-compatible bootstrap mechanism that preserves the existing `work/` artifact structure
- Generate default `AGENTS.md` with Vibe as the active supported runtime (once replacement is proven)
- Generate default `work/project-config.md` 
- Create or maintain the `work/README.md` symlink behavior
- Support new project initialization from scratch

## Technical Requirements

### Implementation Approach

- Create a new bootstrap script at `work/init.sh` or similar (outside `.opencode/`)
- Review `.opencode/custom/init/init.sh` for required functionality:
  - Creates `work/` directory tree (backlog/, ideas/, etc.)
  - Creates default `AGENTS.md`
  - Creates default `work/project-config.md`
  - Creates `work/README.md` symlink to `.opencode/custom/init/README.md`
  - May create additional scaffold files
- Decide on Vibe-era defaults for generated files:
  - `AGENTS.md` should reference `.vibe/` as active workflow once AF-005 is complete
  - `work/project-config.md` should reference Vibe conventions
- Update symlink targets to be Vibe-compatible

### Decisions

- Keep bootstrap as shell-driven (no Vibe-native equivalent exists)
- Place bootstrap script in `work/init.sh` to keep it artifact-adjacent
- Generated `AGENTS.md` will initially reference both `.opencode/` (legacy) and `.vibe/` (active) until full replacement
- After AF-005 (docs update), generated `AGENTS.md` will reference only `.vibe/`

### Constraints

- Do not modify `.opencode/custom/init/init.sh` until replacement is validated
- Preserve exact `work/` directory structure creation
- Maintain backward compatibility: existing projects initialized with old init should still work

## Acceptance Criteria

- `work/init.sh` or equivalent bootstrap script created and validated
- Script creates identical `work/` directory structure to current init
- Script generates appropriate default `AGENTS.md` for Vibe workflow
- Script generates appropriate default `work/project-config.md`
- Script creates `work/README.md` symlink (target to be determined)
- Existing `.opencode/custom/init/init.sh` remains untouched until validation passes
- Bootstrap script works from clean repository state
