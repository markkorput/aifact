# Commit

## Purpose

Create a conventional commit from current changes following project conventions. This workflow packages staged changes into a meaningful commit with a descriptive message.

## Core Steps

1. Read the current git status to understand what is staged
2. Verify only intended changes are staged
3. Generate a conventional commit message based on the changes:
   - Use standard types: feat, fix, chore, docs, style, refactor, perf, test
   - Include a brief, imperative description
   - Reference any related stories or issues
4. Create the commit with the generated message
5. Return the commit hash and message for verification

## Constraints

- Only commit staged changes
- Do not commit if there are unstaged changes that should be included
- Commit message must follow conventional commit format
- Commit message must be 50-72 characters for the subject line
- Commit message body is optional but should provide context when needed
- Do not use commit messages like "fix", "update", "changes" without specificity
- Respect project-specific commit conventions from project-config.md

## Output Contract

- A new git commit containing all staged changes
- Commit message follows conventional commit format
- Return the commit hash (SHA)
- Return the commit message
- Return the number of files changed
