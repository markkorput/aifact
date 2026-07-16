# Rename work/backlog folder to work/stories

**Type**: chore

## Context
The current `work/backlog` directory name is not aligned with the semantic structure of the repository. Renaming it to `work/stories` better reflects its purpose as the location for all story artifacts (backlog, planned, in-progress, done).

## Functional Requirements
- Rename `work/backlog` directory to `work/stories`
- Maintain all subdirectories (backlog, planned, in-progress, done) under the new parent directory
- Preserve all existing story files and their content
- Update any references to `work/backlog` in documentation, workflows, and configuration files

## Technical Requirements
- Perform the rename operation at the filesystem level
- Ensure git tracks the rename as a move operation (not delete+create)
- Verify all story files remain accessible after the rename
- Update any hardcoded paths in workflow files, skills, and documentation
- Maintain backward compatibility by updating any scripts or tools that reference the old path

## Acceptance Criteria
- [ ] Directory `work/backlog` no longer exists
- [ ] Directory `work/stories` exists with the same subdirectory structure
- [ ] All story files are accessible under the new path
- [ ] Git history preserves the rename as a move operation
- [ ] All cross-references to `work/backlog` are updated to `work/stories`
- [ ] Workflows and skills that reference the backlog path are updated

## Analysis

### Likely Impact
Primary lane is the filesystem rename of `work/backlog` to `work/stories`. In-scope files requiring path updates:
- `AGENTS.md:16`
- `work/project-config.md:19,44`
- `.aifact/workflows/create-story.md:27`
- `.aifact/workflows/refresh-project-config.md:14`
- `.aifact/workflows/story-reviewer.md:23`
- `.aifact/workflows/story-start.md:12,21,22,31`
- `.aifact/workflows/story-validator.md:30`
- `.vibe/skills/create-story/SKILL.md:3,16,22,35,46`
- `.vibe/skills/story-reviewer/SKILL.md:21`
- `.vibe/skills/story-start/SKILL.md:19,20`
- `.vibe/skills/story-validator/SKILL.md:20`
- Story files in `work/backlog/**/*` that self-reference the path

### Possible Adjacent Touchpoints
- Any scripts or tools with hardcoded `work/backlog` paths
- Idea files in `work/ideas/` that may reference backlog paths

### Existing Patterns / Prior Art
Repo uses git for all tracking. Standard git move operation will preserve history. No application runtime code exists, only markdown artifacts and workflow definitions.

### Layer Boundaries
- Start with filesystem rename via `git mv` to ensure git tracks as move
- Then update all references in documentation, workflows, and skills
- Do not modify story file content (only their container path changes)
- Stop at workflow/skill/documentation layer — no application code to update

### Verification Plan
- `git status` shows rename detection, not delete+create
- All story files accessible at `work/stories/**/*`
- `grep -r "work/backlog"` returns no results (excluding `.git/`)
- All workflows and skills pass their own validation checks

## Implementation

### Changes Made

**Directory rename:**
- `work/backlog/` → `work/stories/` (with all subdirectories: backlog, planned, in-progress, done)

**Documentation updates:**
- `AGENTS.md:16`: Updated reference from `work/backlog/` to `work/stories/`
- `work/project-config.md:19`: Updated story state paths to use `work/stories/`
- `work/project-config.md:44`: Updated pattern from `work/backlog/**/*` to `work/stories/**/*`
- `work/project-config.md:45`: Updated keyword from `backlog` to `stories`

**Workflow updates:**
- `.aifact/workflows/create-story.md:27`: Output contract updated to `work/stories/<state>/`
- `.aifact/workflows/refresh-project-config.md:14`: Updated to `work/stories/`
- `.aifact/workflows/story-reviewer.md:23`: Constraint updated to `work/stories/`
- `.aifact/workflows/story-start.md:12,21,22,31`: Multiple references updated to `work/stories/`
- `.aifact/workflows/story-validator.md:30`: Constraint updated to `work/stories/`

**Skill updates:**
- `.vibe/skills/create-story/SKILL.md:3,16,22`: Description and constraint updated to `work/stories/`
- `.vibe/skills/create-story/SKILL.md:35,46`: Scan paths updated to `work/stories/**/*`
- `.vibe/skills/story-reviewer/SKILL.md:21`: Constraint updated to `work/stories/`
- `.vibe/skills/story-start/SKILL.md:19,20`: Constraints updated to `work/stories/`
- `.vibe/skills/story-validator/SKILL.md:20`: Constraint updated to `work/stories/`

**Story file updates:**
- `work/stories/backlog/AI-0003-2026-07-16-create-story-done-workflow.md`: Updated all `work/backlog` references to `work/stories`
- `work/stories/in-progress/1-rename-record-story-to-create-story-with-new-id-format.md`: Updated boundary constraints

### Verification Results

- [x] Directory `work/backlog` no longer exists
- [x] Directory `work/stories` exists with the same subdirectory structure
- [x] All story files are accessible under the new path
- [x] Git history preserves the rename as a move operation (18 files changed, all tracked as renames)
- [x] All cross-references to `work/backlog` are updated to `work/stories` (except in AI-0002 itself which documents the change)
- [x] Workflows and skills that reference the backlog path are updated

### Commit
`b25730f` - chore: rename work/backlog to work/stories

---

## Validation (2026-07-16 00:55)

**Status**: pass

**Acceptance Criteria**:
- [x] Directory `work/backlog` no longer exists - Verified via `ls work/backlog` returns "No such file or directory"
- [x] Directory `work/stories` exists with the same subdirectory structure - Verified via `find work/stories -type d` shows backlog, planned, in-progress, done
- [x] All story files are accessible under the new path - Verified via `find work/stories -name "*.md"` returns 3 story files
- [x] Git history preserves the rename as a move operation - Verified via `git show b25730f --stat` shows `{backlog => stories}` for all 18 changed files
- [x] All cross-references to `work/backlog` are updated to `work/stories` - Verified via `grep -r "work/backlog"` returns only matches in AI-0002 itself
- [x] Workflows and skills that reference the backlog path are updated - Verified via commit b25730f changed 18 files including all workflows and skills

**Verification Results**:
- Directory rename verification: pass
- Story file accessibility: pass
- Cross-reference updates: pass
- Workflow/skill updates: pass

**Issues Found**:
- None

**Recommendation**: ready
