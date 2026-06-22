---
name: create-guideline
description: Create or update a project guideline following strict formatting rules. Replaces opencode create-guideline command.
user-invocable: true
allowed-tools:
  - read
  - write_file
  - bash
---

# Create Guideline Skill

Create or update a project guideline following strict formatting rules.

**Topic:** Provided as user arguments when invoked

## Purpose

Facilitate creation of concise, project-specific guidelines with principles, pitfalls, and decisions.

## Hard Constraints

- Topic is required (from user arguments)
- Principles and Pitfalls sections are required
- Content must be imperative and project-specific
- Content must be under 20 lines
- No generic explanations

## Execute

1. **Confirm topic**
   - Topic is provided via `$ARGUMENTS` or user input
   - If no topic provided, stop and prompt: "Guideline topic required. Provide a topic."

2. **Load project context**
   - Read `work/project-config.md` for project context

3. **Check for existing guideline**
   - List files in `work/guidelines/`
   - Check if any existing guideline matches the topic
   - If multiple guidelines appear to match, ask exactly one targeted question to disambiguate

4. **Decide action**
   - Update existing guideline if topic materially overlaps
   - Create new guideline if topic is distinct

5. **Gather content iteratively**
   - Principles (required) - core rules or best practices
   - Pitfalls (required) - common mistakes or anti-patterns to avoid
   - Decisions (optional) - specific choices made for this project
   - Keep each section concise

6. **Format content**
   - Use imperative voice
   - Be project-specific
   - Keep total content under 20 lines
   - No generic explanations or filler

7. **Write guideline file**
   - Filename: slugified topic with `.md` extension
   - Location: `work/guidelines/`
   - Use standard guideline template structure:
     ```markdown
     # <Topic>
     
     ## Principles
     
     - <principle 1>
     - <principle 2>
     
     ## Pitfalls
     
     - <pitfall 1>
     - <pitfall 2>
     
     ## Decisions
     
     - <decision 1>
     ```
   - Omit Decisions section if empty

8. **Save and validate**
   - Save file to `work/guidelines/<slug>.md`
   - Verify file was created
   - Return saved file path

## Constraints

- Rewriting or restructuring full guideline is allowed when updating
- Content must always be project-specific
- Never exceed 20 lines of content
- Use `bash` tool for file operations when needed
