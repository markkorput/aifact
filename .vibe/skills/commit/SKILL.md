---
name: commit
description: Create a Conventional Commit from current changes. Replaces opencode commit command.
user-invocable: true
allowed-tools:
  - bash
---

# Commit Skill

Create a Conventional Commit from current git changes.

## Purpose

Create properly formatted commits following Conventional Commit conventions.

## Hard Constraints

- Do not commit on detached HEAD or main/master
- Do not commit likely secret files
- Do not commit without changes
- Always use Conventional Commit format

## Execute

1. **Check for changes**
   - Run `git status --short` using `bash` tool
   - If there are no changes, stop and output: "No changes to commit."

2. **Verify safe branch**
   - Run `git rev-parse --abbrev-ref HEAD` using `bash` tool
   - If current branch is `HEAD`, `main`, or `master`, stop and output: "Refusing to commit on detached HEAD or main/master."

3. **Stage all changes**
   - Run `git add -A` using `bash` tool

4. **Check staged files**
   - Run `git diff --cached --name-only` using `bash` tool
   - If output is empty, stop and output: "No changes to commit."

5. **Check for secret files**
   - Check staged paths against secret file patterns:
     - `.env`, `.env.*`
     - `*.pem`, `*.key`, `*.p12`, `*.pfx`
     - `credentials*.json`, `secrets*.json`
   - If any staged path matches, stop and output: "Refusing to commit likely secret files: <matched-files>"

6. **Create commit message**
   - Write one concise Conventional Commit message in format `type: subject`
   - Allowed types: `feat`, `fix`, `docs`, `style`, `refactor`, `perf`, `test`, `build`, `ci`, `chore`, `revert`
   - No scope
   - Imperative, lowercase subject
   - Max 72 characters
   - No trailing period
   - If message cannot be automatically determined, prompt user for message

7. **Commit**
   - Run `git commit -m "<message>"` using `bash` tool

8. **Report status**
   - Run `git status` using `bash` tool
   - Output only command results

## Constraints

- Use `bash` tool only for all operations
- Output only command results and error messages
- No commentary or explanation
