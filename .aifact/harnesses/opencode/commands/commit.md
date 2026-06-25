---
description: Create a Conventional Commit from current changes.
agent: commit
mode: all
model: openai/gpt-5.5
---

# Commit for AiFact

> **Core Workflow**: See `../../../workflows/commit.md` for the harness-agnostic workflow definition.

**Arguments:** `$ARGUMENTS` (optional commit message hint)

Create a conventional commit from current changes following project conventions.

## Execute

1. Read `work/project-config.md` first
2. Check git status to understand staged changes
3. Verify only intended changes are staged
4. Generate conventional commit message:
   - Determine type from changes (feat, fix, chore, docs, style, refactor, perf, test)
   - Create brief, imperative description
   - Reference related stories if found in changes
5. Create the commit
6. Return commit hash and message

## Constraints

- Only commit staged changes
- Do not commit if there are unstaged changes that should be included
- Commit message must follow conventional commit format
- Commit message subject line: 50-72 characters
- Do not use vague messages like "fix", "update", "changes"
- Respect project-specific conventions from project-config.md
- File system writes limited to git operations only

## Output Contract

- New git commit with all staged changes
- Commit message follows conventional commit format
- Return commit hash (SHA)
- Return commit message
- Return number of files changed
- Report any errors with clear messages
