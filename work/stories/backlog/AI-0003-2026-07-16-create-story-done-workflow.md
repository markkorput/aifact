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
