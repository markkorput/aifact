#!/usr/bin/env bash
set -euo pipefail

# Bootstrap script for AiFact workflow
# Creates the work/ directory structure for a new project

ROOT_DIR="$(pwd)"

# Directories to create under work/
DIRS=(
  "backlog"
  "backlog/backlog"
  "backlog/done"
  "backlog/in-progress"
  "backlog/planned"
  "ideas"
  "ideas/ideas"
  "releases"
  "adr"
  "guidelines"
)

# Create work/ directory if it doesn't exist
mkdir -p "$ROOT_DIR/work"

# Create all subdirectories
for dir in "${DIRS[@]}"; do
  mkdir -p "$ROOT_DIR/work/$dir"
done

# Create Inbox.md if it doesn't exist
if [ ! -f "$ROOT_DIR/work/ideas/Inbox.md" ]; then
  cat <<'EOF' > "$ROOT_DIR/work/ideas/Inbox.md"
# Inbox
EOF
fi

# Create project-config.md if it doesn't exist
if [ ! -f "$ROOT_DIR/work/project-config.md" ]; then
  cat <<'EOF' > "$ROOT_DIR/work/project-config.md"
# Project Config

This file is the canonical, human-readable source of truth for repo structure, guideline loading, review triggers, and repo-level command rules.

If another repo document conflicts with this file, follow this file.

## Purpose

- Use this file as rule, not background reading.
- Humans read it to understand expected agent behavior.
- Agents read it to decide which guidelines, reviews, and commands apply.

## Repo Structure

- Top-level layout is minimal: `.opencode/` holds the current active legacy workflow implementation, `.vibe/` holds the minimal Vibe MVP evaluation surface, `work/` holds durable project artifacts, and `README.md` describes the framework.
- `.opencode/agent/` contains the primary agent definitions for the workflow.
- `.opencode/commands/` contains command entry points.
- `.opencode/skills/` contains reusable skills.
- `.opencode/custom/init/` contains the repo bootstrap assets.
- `.opencode/scripts/` contains support scripts used by workflow automation.
- `.vibe/skills/` contains the minimal Vibe Code skill MVP used to evaluate the replacement path.
- `work/project-config.md` is the main repo-local operating context file.
- `work/backlog/backlog/`, `work/backlog/planned/`, `work/backlog/in-progress/`, and `work/backlog/done/` hold story state.
- `work/ideas/ideas/` and `work/ideas/Inbox.md` hold early-stage ideas.
- `work/guidelines/`, `work/adr/`, and `work/releases/` exist but currently contain only scaffold files.

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
- Patterns: `.opencode/agent/**/*`, `.opencode/commands/**/*`, `.opencode/skills/**/*`, `.opencode/scripts/**/*`, `.vibe/skills/**/*`
- Keywords: `agent`, `command`, `skill`, `workflow`, `orchestrator`, `validator`

### Work Artifacts

- Guideline: none currently present under `work/guidelines/`
- Patterns: `work/project-config.md`, `work/backlog/**/*`, `work/ideas/**/*`, `work/adr/**/*`, `work/releases/**/*`
- Keywords: `story`, `backlog`, `idea`, `adr`, `release`, `project config`

### Bootstrap and Prompt Assets

- Guideline: none currently present under `work/guidelines/`
- Patterns: `.opencode/custom/init/**/*`, `README.md`
- Keywords: `init`, `bootstrap`, `readme`, `prompt`, `guideline`

## Technology Rules

- Markdown is the primary artifact format for agent definitions, commands, skills, and human-readable documentation.
- Shell scripting is used for bootstrap and support automation.

## Review Rules

- No dedicated review guideline files are currently present under `work/guidelines/`.
- Use repo-grounded review when changes affect agent instructions, command behavior, workflow bootstrap assets, or durable story state.

## Loading Rules

### Always Load

- Always load `work/project-config.md`.
- Load additional guideline files only when they exist and match the current task.

### Analysis

- Start from the affected area: `.opencode/` for workflow behavior.
- When `work/guidelines/` gains task-relevant files, load only the files that match the affected area.

### Implementation

- Use the affected file paths to choose the matching domain above.
- Treat `work/` artifacts as durable handoff material and `.opencode/` files as workflow implementation assets.
- Do not assume application runtime conventions that are not present in this repository.

### Validation

- If no guideline exists for the changed area, prefer repo structure and adjacent artifacts over invented policy.

## Command Rules

- No command rules.

## Agent Usage Rule

- Read this file first when you need repo structure, guideline loading rules, review triggers, or repo-level command rules.
- Load only the guideline files that match the current task.
- Do not invent rules outside this file and the loaded guideline files.
EOF
fi

# Create AGENTS.md if it doesn't exist
if [ ! -f "$ROOT_DIR/AGENTS.md" ]; then
  cat <<'EOF' > "$ROOT_DIR/AGENTS.md"
# AGENTS

## Main rule

- Treat files in `work/` as the durable source of truth.
- Start new delivery work with `brainstorm`.
- Prefer repo artifacts over chat memory.

## Important locations

- `.opencode/agent/` - agent definitions
- `.opencode/commands/` - command entry points
- `.opencode/skills/` - reusable skills
- `.opencode/custom/init/` - bootstrap assets and README source
- `.vibe/skills/` - minimal Vibe Code skill MVP for replacement evaluation
- `work/project-config.md` - repo operating context
- `work/backlog/` - story state
- `work/ideas/` - idea capture

## Agent behavior

- Read `work/project-config.md` first.
- Load only guidance relevant to the current task.
- Do not invent repo policy when the repository does not define it.
- Keep workflow decisions and delivery state in repo artifacts.
EOF
fi

# Add .gitkeep to empty directories
for dir in "${DIRS[@]}"; do
  if [ -d "$ROOT_DIR/work/$dir" ] && [ -z "$(ls -A "$ROOT_DIR/work/$dir")" ]; then
    touch "$ROOT_DIR/work/$dir/.gitkeep"
  fi
done

echo "AiFact workflow initialized successfully in $ROOT_DIR/work/"
