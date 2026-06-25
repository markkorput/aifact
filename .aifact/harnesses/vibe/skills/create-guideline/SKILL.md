---
name: create-guideline
description: Create or update a project guideline following strict formatting rules.
user-invocable: true
allowed-tools:
  - read_file
  - write_file
  - glob
---

# Create Guideline

> **Core Workflow**: See `../../../../workflows/create-guideline.md` for the harness-agnostic workflow definition.

Create or update a project guideline following strict formatting rules.

## Purpose

Create or update a project guideline that defines how agents should behave in specific contexts.

## Hard Constraints

- Guideline files must be placed in `work/guidelines/`
- Guideline file names must follow: GL-<ID>-<slugified-title>.md
- Guidelines must be actionable rules, not suggestions
- Guidelines must not conflict with existing guidelines or project-config.md
- Updates must preserve existing valid content
- Do not delete guideline files

## Execute

1. Read `work/project-config.md` first
2. Determine if creating new or updating existing
3. For new: generate unique ID, create file in work/guidelines/
4. For updates: read existing, preserve valid content, apply updates
5. Validate guideline follows conventions
6. Write guideline with structure: title, ID, Purpose, Rules/Behavior, Examples, Related Guidelines
7. Return path to created/updated guideline

## Output Contract

- Markdown file in work/guidelines/
- Contains all required sections
- Return absolute path to guideline file
- Return confirmation of creation or update
