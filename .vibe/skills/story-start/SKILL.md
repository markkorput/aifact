---
name: story-start
description: Start an AiFact story by moving it to in-progress and preparing the matching branch. Preserves artifact-first handoffs.
user-invocable: true
allowed-tools:
  - read_file
  - bash
---

# Story Start

Start one planned or backlog story by moving it to in-progress and creating the feature branch.

## Purpose

Kick off story implementation by moving it to the in-progress state and preparing the development environment.

## Hard Constraints

- Accept only stories from `work/backlog/backlog/` or `work/backlog/planned/`.
- Never move stories from `work/backlog/in-progress/` or `work/backlog/done/`.
- Never discard existing user changes.
- Never commit unrelated changes.
- Do not modify source code files.

## Execute

1. **Read the invoked story path**
   - If path argument is missing or empty, report error: "No story path provided"
   - If path is not absolute, resolve it relative to repo root

2. **Resolve the source story path safely**
   - Accept stories from `work/backlog/backlog/` or `work/backlog/planned/`.
   - If the argument points to `work/backlog/in-progress/` or `work/backlog/done/`, stop and report blocker: "Story already in in-progress or done"
   - If the path cannot be read or file does not exist, stop and report blocker: "Story file not found"

3. **Move the story file to `work/backlog/in-progress/`**
   - If the source file is tracked by git, use `git mv`.
   - If untracked, use `mv` and then stage only the moved story file.
   - If move operation fails, stop and report error with details.

4. **Read the moved story and extract title and `## Type`**
   - Read the file at the new location.
   - Extract the title from the first line (remove `#` prefix).
   - Extract the Type value from the `## Type` section.
   - If Type is missing or invalid (not one of: feature, bug, chore, spike), stop and report error: "Invalid or missing Type"

5. **Derive branch name**
   - Slugify the title: lowercase, replace spaces and special chars with hyphens.
   - Branch name format: `<type>/<slug>` (e.g., `feature/add-user-auth`)

6. **Resolve branch state**
   - If the current branch already matches `<branch-name>`, keep it.
   - Else if `<branch-name>` already exists locally, check it out.
   - Else create and check out `git checkout -b <branch-name>`.
   - If branch checkout/create fails, stop and report error.

7. **Stage only the moved story file for the kickoff commit**
   - Use `git add <moved-story-path>`
   - Verify only the story file is staged

8. **Inspect staged entries before commit**
   - Run `git status --short` or `git diff --cached --name-only`
   - If staged content includes files beyond the moved story, stop and report blocker: "Unrelated files staged"
   - List the unexpected files in the error message

9. **Commit the move with a concise Conventional Commit message**
   - Message format: `chore: move <story-title> to in-progress`
   - Use git commit with the message
   - If commit fails, stop and report error

10. **Run `git status` and report**
    - Report the story path
    - Report the branch name
    - Report the commit status
    - Report any blockers

## Error Handling

- All errors are reported with clear messages
- Operations stop immediately on any error
- Blocker conditions prevent further execution
- User is informed of the exact failure point

## User Feedback

On success:
- Story path: `<absolute-path-to-story>`
- Branch: `<branch-name>`
- Commit: `<commit-hash>` with message
- Status: Ready for implementation

On failure:
- Error type: Validation | Operation | Blocker
- Error message: `<specific-details>`
- Suggested action: `<how-to-resolve>`

## Return Format

- Action taken or error encountered
- Current story path
- Branch status
- Commit status
- Blockers (if any)
