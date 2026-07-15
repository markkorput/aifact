---
name: create-story
description: Create a new AiFact user story under work/backlog/backlog using the standard story template with XX[X]-DDDD ID format and date-stamped filename.
user-invocable: true
allowed-tools:
  - read_file
  - write_file
  - glob
  - bash
---

# Create Story

> **Core Workflow**: See `.aifact/workflows/create-story.md`

Create a new AiFact user story under work/backlog/backlog using the standard story template with `<PREFIX>-<NUMBER>` ID format and `<ID>-<YYYY-MM-DD>-<slug>.md` filename pattern.

## Hard Constraints (Vibe-specific)

- Do not modify existing stories
- Do not auto-start stories
- File system writes limited to work/backlog/
- Story ID must be unique and follow `<PREFIX>-<NUMBER>` format
- Filename must follow `<ID>-<YYYY-MM-DD>-<slug>.md` pattern
- Prefix must be 2-3 uppercase letters
- Number is globally sequential (derived from existing stories)

## Execution

Follow steps from core workflow using Vibe tool names (`read_file`, `write_file`, `glob`, `bash`).

### Implementation Details

1. **Prefix Discovery**:
   - Scan all `.md` files in `work/backlog/**/*`
   - Extract ID from each filename (first component before first hyphen)
   - Extract prefix from ID (letters before dash)
   - If multiple prefixes found, use prefix from story with latest date in filename
   - If no stories exist (empty repo), prompt user for prefix with 2-letter and 3-letter suggestions from project folder name

2. **Prefix Override**:
   - If user explicitly provides a prefix (e.g., `/create-story PREFIX: <request>`), use that prefix
   - Normalize to uppercase

3. **Number Assignment**:
   - Scan all `.md` files in `work/backlog/**/*`
   - For each, extract ID from filename and parse number component
   - Find maximum number value
   - Next number = max + 1, formatted with leading zeros to minimum 4 digits (extends beyond 4 as needed)

4. **Date**:
   - Use current date in `YYYY-MM-DD` format

5. **ID Format**:
   - Combine prefix and number: `<PREFIX>-<NUMBER>` (e.g., `AI-0001`, `AIF-0002`)

6. **Filename**:
   - Pattern: `<ID>-<YYYY-MM-DD>-<slugified-title>.md`
   - Example: `AI-0001-2024-07-16-fix-login-bug.md`
