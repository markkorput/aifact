# Create story-done workflow and vibe-skill

**Type**: chore

## Context
The current AiFact story lifecycle has workflows for creation, starting, reviewing, analyzing, implementing, and validating stories. However, there is no workflow to finalize a completed story after validation passes. Stories remain in in-progress with their feature branches unmerged. A dedicated 'story-done' workflow is needed to complete the lifecycle by moving validated stories to done, merging their feature branches back into their parent branch, and cleaning up. This story is specifically about creating the workflow and skill files, not about applying story-done to itself.

## Functional Requirements
- Create `.aifact/workflows/story-done.md` workflow definition
- Create `.vibe/skills/story-done/SKILL.md` corresponding Vibe skill
- Finalize story after successful implementation and validation
- Move story file from `work/stories/in-progress/` to `work/stories/done/`
- Merge feature branch back into its parent branch (branch it was originally branched from)
- Delete feature branch after successful merge
- Commit the story file move with conventional commit message

## Technical Requirements
- Only operate on stories in `work/stories/in-progress/` directory
- Require Validation section with **Status**: pass as hard constraint
- Extract story Type and slug from story file content or filename
- Derive branch name from Type and slug: `<type>/<slug>` (reuse same pattern as story-start)
- Discover parent branch via `git show-branch -a | grep '*'` to find branch point, or fall back to `main` if indeterminate
- Checkout parent branch and pull latest changes
- Merge feature branch into parent branch (regular merge, not squash)
- Delete feature branch after merge
- Move story file to `work/stories/done/`
- Git commit message format: `chore: move <story-id> to done`
- Return story path, merged commit hash, deleted branch name, and status
- Handle merge conflicts as blockers (report without resolution)
- Do not auto-push to remote
- File system writes limited to work/stories/ and git operations

## Acceptance Criteria
- [ ] `.aifact/workflows/story-done.md` exists with proper workflow definition
- [ ] `.vibe/skills/story-done/SKILL.md` exists with proper skill implementation
- [ ] story-done workflow moves validated story files to done directory
- [ ] Feature branches are merged into their parent branch (not hardcoded to main)
- [ ] Feature branches are deleted after successful merge
- [ ] Story file move is committed with conventional commit message
- [ ] Workflow requires Validation section with **Status**: pass
- [ ] Merge conflicts are reported as blockers
- [ ] Workflow does not auto-push to remote
- [ ] Workflow only operates on stories in work/stories/in-progress/ directory
- [ ] project-config.md is updated with new workflow and skill references

## Analysis

### Likely Impact
Primary lane is creating two new files that complete the story lifecycle: `.aifact/workflows/story-done.md` and `.vibe/skills/story-done/SKILL.md`. In-scope files:
- `.aifact/workflows/story-done.md` (new)
- `.vibe/skills/story-done/SKILL.md` (new)
- `work/project-config.md:16-17` (add new workflow/skill references)

### Possible Adjacent Touchpoints
- Any workflows or skills that enumerate available workflows/skills may need updates to include story-done
- Story files in `work/stories/in-progress/` that will use this workflow after implementation

### Existing Patterns / Prior Art
Closest patterns to follow are the existing paired workflow/skill definitions:
- `.aifact/workflows/story-start.md` and `.vibe/skills/story-start/SKILL.md` for story state transitions and git operations
- `.aifact/workflows/story-validator.md` and `.vibe/skills/story-validator/SKILL.md` for Validation section format
- All skills use YAML frontmatter with `name`, `description`, `user-invocable: true`, and `allowed-tools` list
- Workflows use Purpose, Core Steps, Constraints, Output Contract structure
- Branch naming follows `<type>/<slug>` pattern established in story-start
- Git operations use standard git commands via bash tool

### Layer Boundaries
- Start with creating the workflow definition file with proper Core Steps for story finalization
- Then create the corresponding Vibe skill that implements the workflow using Vibe tool names
- Update project-config.md to reference the new workflow and skill
- Do not implement the story-done logic on itself — this story only creates the workflow and skill files
- Do not modify existing workflows or skills beyond adding references in project-config.md

### Verification Plan
- Verify `.aifact/workflows/story-done.md` follows established workflow format
- Verify `.vibe/skills/story-done/SKILL.md` follows established skill format with proper YAML frontmatter
- Verify `work/project-config.md` includes new workflow and skill in appropriate sections
- Verify no syntax errors in markdown files
- Verify all acceptance criteria are addressed by the created files

## Implementation

### Changes Made

**New workflow definition:**
- Created `.aifact/workflows/story-done.md` with Purpose, Core Steps, Constraints, and Output Contract sections following established workflow format

**New Vibe skill:**
- Created `.vibe/skills/story-done/SKILL.md` with YAML frontmatter (name, description, user-invocable: true, allowed-tools)
- Includes Hard Constraints and Execution sections with Implementation Notes for parent branch discovery, branch name derivation, validation check, git operations, and merge conflict handling

**Project config update:**
- Updated `work/project-config.md:16-17` to add `story-done` to the list of workflows and skills

### Verification Results

- [x] `.aifact/workflows/story-done.md` exists with proper workflow definition - Verified file exists with correct structure (Purpose, Core Steps, Constraints, Output Contract)
- [x] `.vibe/skills/story-done/SKILL.md` exists with proper skill implementation - Verified file exists with YAML frontmatter, Hard Constraints, and Execution sections
- [x] `work/project-config.md` includes new workflow and skill references - Verified `story-done` appears in both workflow and skill lists at lines 16-17
- [x] No syntax errors in markdown files - Verified proper heading hierarchy and YAML frontmatter structure
- [x] All acceptance criteria addressed by created files - All 10 acceptance criteria are covered by the implemented workflow and skill definitions
