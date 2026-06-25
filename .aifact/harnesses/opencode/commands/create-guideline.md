---
description: Create or update a project guideline following strict formatting rules.
agent: create-guideline
mode: all
model: openai/gpt-5.5
---

# Create Guideline for AiFact

> **Core Workflow**: See `../../../workflows/create-guideline.md` for the harness-agnostic workflow definition.

Create or update a project guideline following strict formatting rules.

## Execute

1. Read `work/project-config.md` first
2. Determine if creating new guideline or updating existing
3. For new guidelines:
   - Generate unique ID (GL-XXX format)
   - Create guideline file in work/guidelines/
4. For updates:
   - Read existing guideline
   - Preserve valid existing content
   - Apply updates to relevant sections
5. Validate guideline follows conventions
6. Write guideline with proper structure
7. Return path to created/updated guideline

## Constraints

- Guideline files must be in work/guidelines/
- File names: GL-<ID>-<slugified-title>.md
- Guidelines must be actionable rules, not suggestions
- Must not conflict with project-config.md or existing guidelines
- Updates must preserve existing valid content
- Do not delete guideline files
- File system writes limited to work/guidelines/

## Output Contract

- Markdown file in work/guidelines/
- Contains: title, ID, Purpose, Rules/Behavior, Examples (if applicable), Related Guidelines
- Return absolute path to guideline file
- Return confirmation of creation or update
- Report any errors with clear messages
