# Story Start

## Purpose

Kick off story implementation by moving a planned or backlog story to in-progress state and preparing the development environment with the appropriate feature branch.

## Core Steps

1. Read the invoked story file
2. Validate the story path is from backlog or planned directory
3. Extract the story title and Type from the file
4. Move the story file to work/stories/in-progress/
5. Derive a branch name from the title and type: <type>/<slugified-title>
6. Check out the branch (create if doesn't exist)
7. Stage only the moved story file
8. Commit the move with a conventional commit message
9. Report the story path, branch name, commit hash, and status

## Constraints

- Accept only stories from work/stories/backlog/ or work/stories/planned/
- Never move stories from work/stories/in-progress/ or work/stories/done/
- Never discard existing user changes
- Never commit unrelated changes
- Do not modify source code files
- Branch name must follow the format: <type>/<slug>
- Type must be one of: feature, bug, chore, spike

## Output Contract

- Story file moved to work/stories/in-progress/
- New branch created or checked out matching <type>/<slug> pattern
- Git commit with message: "chore: move <story-title> to in-progress"
- Return story path, branch name, commit hash, and status
- On failure: report error type (Validation | Operation | Blocker) with details
