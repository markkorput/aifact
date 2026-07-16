# Project Config

This file is the canonical, human-readable source of truth for repo structure, guideline loading, review triggers, and repo-level command rules.

If another repo document conflicts with this file, follow this file.

## Purpose

- Use this file as rule, not background reading.
- Humans read it to understand expected agent behavior.
- Agents read it to decide which guidelines, reviews, and commands apply.

## Repo Structure

- Top-level layout is minimal: `.aifact/` holds the workflow definitions, `.vibe/` holds the Vibe workflow implementation, `AGENTS.md` defines agent behavior, and `work/` holds durable project artifacts.
- `.aifact/workflows/` contains the core workflow definitions such as `brainstorm`, `commit`, `create-guideline`, `create-story`, `refresh-project-config`, `story-analyzer`, `story-implementer`, `story-reviewer`, `story-start`, and `story-validator`.
- `.vibe/skills/` contains reusable Vibe skills such as `brainstorm`, `commit`, `create-guideline`, `create-story`, `refresh-project-config`, `story-analyzer`, `story-implementer`, `story-reviewer`, `story-start`, and `story-validator`.
- `work/project-config.md` is the main repo-local operating context file.
- `work/stories/backlog/`, `work/stories/planned/`, `work/stories/in-progress/`, and `work/stories/done/` hold story state.
- `work/ideas/ideas/` and `work/ideas/Inbox.md` hold early-stage ideas.
- `work/guidelines/`, `work/adr/`, and `work/releases/` exist but currently contain only scaffold files.
- `work/README.md` is a symlink to `../.opencode/custom/init/README.md` (currently broken as `.opencode/` does not exist).

## Output Rules

- Be concise.
- Start with action, not explanation.
- Use bullets instead of long paragraphs.
- No filler.
- Use structured output when possible.
- Keep sections short unless technical detail is required.

## Domain Rules

### Workflow Definition

- Guideline: none currently present under `work/guidelines/`
- Patterns: `.aifact/workflows/**/*`, `.vibe/skills/**/*`
- Keywords: `workflow`, `skill`, `vibe`, `agent`

### Work Artifacts

- Guideline: none currently present under `work/guidelines/`
- Patterns: `work/project-config.md`, `work/stories/**/*`, `work/ideas/**/*`, `work/adr/**/*`, `work/releases/**/*`
- Keywords: `story`, `stories`, `idea`, `adr`, `release`, `project config`

### Bootstrap and Prompt Assets

- Guideline: none currently present under `work/guidelines/`
- Patterns: `AGENTS.md`
- Keywords: `agent`, `behavior`, `guideline`

## Technology Rules

- Markdown is the primary artifact format for workflow definitions, skills, and human-readable documentation.
- No shell scripts, build tools, or application runtime stack are currently present in this repository.
- The workflow is implemented through Vibe skills (`.vibe/skills/`) and workflow definitions (`.aifact/workflows/`).

## Review Rules

- No dedicated review guideline files are currently present under `work/guidelines/`.
- Use repo-grounded review when changes affect agent instructions, command behavior, workflow bootstrap assets, or durable story state.
- If future review-specific guidelines are added under `work/guidelines/`, reference them here instead of inventing new review policy in prompts.

## Loading Rules

### Always Load

- Always load `work/project-config.md`.
- Load additional guideline files only when they exist and match the current task.

### Analysis

- Start from the affected area: `.aifact/` and `.vibe/` for workflow behavior.
- When `work/guidelines/` gains task-relevant files, load only the files that match the affected area.

### Implementation

- Use the affected file paths to choose the matching domain above.
- Treat `work/` artifacts as durable handoff material and `.aifact/`/`.vibe/` files as workflow implementation assets.
- Do not assume application runtime conventions that are not present in this repository.

### Validation

- If no guideline exists for the changed area, prefer repo structure and adjacent artifacts over invented policy.

## Command Rules

- No command rules.

## Agent Usage Rule

- Read this file first when you need repo structure, guideline loading rules, review triggers, or repo-level command rules.
- Load only the guideline files that match the current task.
- Do not invent rules outside this file and the loaded guideline files.
