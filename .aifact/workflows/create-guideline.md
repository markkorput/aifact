# Create Guideline

## Purpose

Create or update a project guideline that defines how agents should behave in specific contexts. Guidelines are durable rules that agents must follow when performing work in the repository.

## Core Steps

1. Determine if this is a new guideline or an update to an existing one
2. For new guidelines:
   - Generate a unique guideline ID
   - Create the guideline file in the appropriate location
3. For updates:
   - Read the existing guideline
   - Preserve existing content that remains valid
   - Apply updates to relevant sections
4. Validate the guideline follows project conventions
5. Write the guideline file with proper structure
6. Return the path to the created/updated guideline

## Constraints

- Guideline files must be placed in `work/guidelines/`
- Guideline file names must follow the pattern: `GL-<ID>-<slugified-title>.md`
- Guidelines must be written as actionable rules, not suggestions
- Guidelines must not conflict with existing guidelines or project-config.md
- Updates must preserve existing valid content
- Do not delete guideline files, only update or create new ones

## Output Contract

- A markdown file in `work/guidelines/`
- Guideline contains: title, ID, Purpose, Rules/Behavior, Examples (if applicable), Related Guidelines
- Return the absolute path to the guideline file
- Return confirmation of creation or update
