---
name: commit
description: Create a Conventional Commit from current changes.
user-invocable: true
allowed-tools:
  - bash
  - git
---

# Commit

> **Core Workflow**: See `../../../../workflows/commit.md` for the harness-agnostic workflow definition.

**Arguments:** $ARGUMENTS (optional commit message hint)

Create a conventional commit from current changes following project conventions.

## Purpose

Create a Conventional Commit from current changes. Replaces opencode commit command.

## Hard Constraints

- Only commit staged changes
- Do not commit if there are unstaged changes that should be included
- Commit message must follow conventional commit format
- Do not modify files outside git operations

## Execute

1. Read `work/project-config.md` first
2. Check git status for staged changes
3. Verify only intended changes are staged
4. Generate conventional commit message (feat, fix, chore, docs, style, refactor, perf, test)
5. Create commit with message
6. Return commit hash and message

## Output Contract

- New git commit with staged changes
- Commit message follows conventional commit format
- Return commit hash (SHA)
- Return commit message
- Return number of files changed
