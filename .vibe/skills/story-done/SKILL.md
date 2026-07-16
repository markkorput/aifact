---
name: story-done
description: Finalize a completed AiFact story by moving it to done, merging its feature branch, and cleaning up.
user-invocable: true
allowed-tools:
  - read_file
  - grep
  - glob
  - bash
  - git
---

# Story Done

> **Core Workflow**: See `.aifact/workflows/story-done.md`

Finalize a completed story by moving it to done state, merging its feature branch back into its parent branch, and cleaning up.

## Hard Constraints (Vibe-specific)

- Only operate on stories in work/stories/in-progress/ directory
- Require Validation section with **Status**: pass as hard constraint
- Do not auto-push to remote
- File system writes limited to work/stories/ and git operations
- Handle merge conflicts as blockers (report without resolution)

## Execution

Follow steps from core workflow using Vibe tool names (`read_file`, `grep`, `glob`, `bash`, `git`).

### Implementation Notes

1. **Parent Branch Discovery**: Use `git show-branch -a` or `git log --graph --oneline --all` to determine the parent branch. The parent branch is the branch from which the feature branch was created. Fall back to `main` if indeterminate.

2. **Branch Name Derivation**: Extract Type from story file (line matching `**Type**: <type>`). Extract slug from filename (remove date and ID prefix, use the descriptive part). Combine as `<type>/<slug>`.

3. **Validation Check**: Use `grep` to verify the story contains a Validation section with `**Status**: pass`.

4. **Git Operations**: Use `bash` tool for git commands:
   - `git checkout <parent-branch>`
   - `git pull`
   - `git merge <feature-branch>`
   - `git branch -d <feature-branch>`
   - `git mv <source> <destination>` for story file move
   - `git commit -m "chore: move <story-id> to done"`

5. **Merge Conflict Handling**: If `git merge` reports conflicts, report as Blocker error type with details and stop without resolution.