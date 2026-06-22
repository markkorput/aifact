---
name: story-start
description: Use to start an AiFact story by moving it to in-progress and preparing the matching branch.
user-invocable: true
allowed-tools:
  - read_file
  - bash
---

# Story Start

Start one planned or backlog story.

## Execute

1. Read the invoked story path.
2. Accept only stories from `work/backlog/backlog/` or `work/backlog/planned/`.
3. If the story is already in `work/backlog/in-progress/` or `work/backlog/done/`, stop and report a blocker.
4. Move the story to `work/backlog/in-progress/` using `git mv` when tracked, otherwise `mv`.
5. Read the moved story and extract title and `## Type`.
6. Derive branch name `<type>/<slug>`.
7. Create or checkout that branch unless already on it.
8. Stage only the moved story file.
9. Inspect staged entries before committing; stop if unrelated files are staged.
10. Commit the move as `chore: move <story-title> to in-progress`.
11. Run `git status` and report the story path, branch, commit status, and blockers.

## Constraints

- Do not modify source code files.
- Do not discard existing user changes.
- Do not commit unrelated changes.
