---
name: story-start
description: Start one planned or backlog story by moving it to in-progress and creating the feature branch.
user-invocable: true
allowed-tools:
  - read_file
  - bash
  - git
---

# Story Start

> **Core Workflow**: See `../../../../workflows/story-start.md` for the harness-agnostic workflow definition.

Start one planned or backlog story by moving it to in-progress and creating the feature branch.

## Purpose

Kick off story implementation by moving it to in-progress state and preparing the development environment.

## Hard Constraints

- Accept only stories from work/backlog/backlog/ or work/backlog/planned/
- Never move stories from work/backlog/in-progress/ or work/backlog/done/
- Never discard existing user changes
- Never commit unrelated changes
- Do not modify source code files

## Execute

1. Read the invoked story path
2. Resolve source path safely
3. Move story to work/backlog/in-progress/
4. Extract title and Type from moved story
5. Derive branch name: <type>/<slugified-title>
6. Check out branch (create if doesn't exist)
7. Stage only the moved story file
8. Inspect staged entries before commit
9. Commit with message: "chore: move <story-title> to in-progress"
10. Report story path, branch, commit, status

## Error Handling

- All errors reported with clear messages
- Operations stop immediately on any error
- Blocker conditions prevent further execution

## Output Contract

On success:
- Story path
- Branch name
- Commit hash with message
- Status: Ready for implementation

On failure:
- Error type: Validation | Operation | Blocker
- Error message with details
- Suggested action
