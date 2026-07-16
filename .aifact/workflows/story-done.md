# Story Done

## Purpose

Finalize a completed story by moving it to done state, merging its feature branch back into its parent branch, and cleaning up. This completes the AiFact story lifecycle.

## Core Steps

1. Read the invoked story file
2. Validate the story is in work/stories/in-progress/ directory
3. Validate the story has a Validation section with **Status**: pass
4. Extract the story ID, Type, and slug from the file content or filename
5. Derive the feature branch name from Type and slug: `<type>/<slug>`
6. Discover the parent branch (the branch the feature branch was created from)
7. Checkout the parent branch and pull latest changes
8. Merge the feature branch into the parent branch (regular merge, not squash)
9. Delete the feature branch after successful merge
10. Move the story file from work/stories/in-progress/ to work/stories/done/
11. Commit the story file move with conventional commit message
12. Report the story path, merged commit hash, deleted branch name, and status

## Constraints

- Only operate on stories in work/stories/in-progress/ directory
- Require Validation section with **Status**: pass as hard constraint
- Extract story Type and slug from story file content or filename
- Derive branch name from Type and slug: `<type>/<slug>`
- Discover parent branch via git operations to find branch point, or fall back to `main` if indeterminate
- Merge feature branch into parent branch using regular merge
- Delete feature branch after successful merge
- Do not auto-push to remote
- File system writes limited to work/stories/ and git operations
- Handle merge conflicts as blockers (report without resolution)

## Output Contract

- Story file moved from work/stories/in-progress/ to work/stories/done/
- Feature branch merged into parent branch
- Feature branch deleted after successful merge
- Git commit with message: "chore: move <story-id> to done"
- Return story path, merged commit hash, deleted branch name, and status
- On failure: report error type (Validation | Operation | Blocker) with details