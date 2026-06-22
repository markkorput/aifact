---
name: change
description: Record a finished non-feature change as a story and commit. Replaces opencode change command.
user-invocable: true
allowed-tools:
  - read
  - bash
  - write_file
---

# Change Skill

Record a finished non-feature change as a story, branch, and commit.

## Purpose

Capture small, coherent non-feature changes (bug fixes, refactors, chores, docs, perf improvements) as durable story artifacts and commit them with proper conventions.

## Hard Constraints

- Only handle non-feature changes (bug, chore, refactor, performance, docs)
- Never discard or move existing git changes
- Do not modify source code files
- Never continue when worktree contains multiple unrelated changes
- Never continue when worktree represents feature work

## Execute

1. **Verify safe branch**
   - Run `git rev-parse --abbrev-ref HEAD` using `bash` tool
   - If current branch is `HEAD`, `main`, or `master`, stop and report: "Refusing to run on detached HEAD or main/master. Create a feature branch first."

2. **Build effective change set**
   - Get staged changes: `git diff --cached --name-only`
   - Get unstaged changes to tracked files: `git diff --name-only`
   - Get untracked files: `git ls-files --others --exclude-standard`
   - Combine all three sets
   - Exclude any file named `changes.md` or `Index.md` in any directory
   - Exclude any file in `.opencode` directory
   - If effective change set is empty, stop and report: "No eligible changes found."

3. **Validate single coherent change**
   - Review the combined diff using `git diff` and `git diff --cached`
   - The diff must read as a single coherent change: fix, refactor, performance improvement, docs update, or chore
   - If the diff contains multiple unrelated changes, stop and report: "Worktree contains multiple unrelated changes. Please commit changes separately."
   - If the diff appears to be feature work, stop and report: "This command only supports non-feature work. Use feature workflow for new functionality."

4. **Classify change type**
   - Examine the diff content and intent
   - `bug` - when primary intent is correctness or defect resolution
   - `chore` - routine maintenance, build/config changes
   - `refactor` - code restructuring without behavior change
   - `perf` - performance improvements
   - `docs` - documentation updates
   - If type cannot be determined, stop and ask user for classification

5. **Reverse-engineer story**
   - Infer what changed and why from the diff
   - Draft story content:
     - Title: concise description of the change
     - Context: why this change was needed
     - Functional Requirements: what the change achieves
     - Technical Requirements: implementation approach
     - Acceptance Criteria: how to verify the change
   - Keep scope to non-feature work only

6. **Create branch if needed**
   - If current branch doesn't reflect the change intent, derive a branch name from the inferred title
   - Branch name format: `<type>/<slugified-title>`
   - Create and checkout the branch using `git checkout -b <branch-name>`

7. **Record the story**
   - Use date prefix: `YYYY-MM-DD-<slug>`
   - Save to `work/backlog/done/YYYY-MM-DD-<slug>.md`
   - Use the standard story template from `work/project-config.md` domain rules

8. **Verify commit scope**
   - Check that staged changes + new story file still represent one coherent change
   - If additional unrelated changes appeared, stop and report: "Unrelated changes detected. Please review."

9. **Commit changes**
   - Stage all changes: `git add -A`
   - Create Conventional Commit message: `<type>: <subject>`
   - Subject: derived from story title, imperative, lowercase, max 72 characters, no trailing period
   - Commit using `git commit -m "<message>"`

10. **Report results**
    - eligible files considered
    - excluded files ignored
    - saved story path
    - selected type
    - branch name used
    - commit hash and message
    - short rationale

## Constraints

- Use `bash` tool for all git operations
- Do not use direct shell execution
- Preserve observable facts from the diff over assumptions
- Always use Conventional Commit format
- Never output `feature` or `spike` type for this command
