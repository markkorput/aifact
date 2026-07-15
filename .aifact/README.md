# AiFact Core Workflow Framework

This directory contains the portable, harness-agnostic AiFact workflow framework.

## Structure

```
.aifact/
├── workflows/            # Core workflow definitions (tool-agnostic)
│   ├── brainstorm.md
│   ├── commit.md
│   ├── create-guideline.md
│   ├── refresh-project-config.md
│   ├── record-story.md
│   ├── story-analyzer.md
│   ├── story-implementer.md
│   ├── story-reviewer.md
│   ├── story-start.md
│   └── story-validator.md
│
├── harnesses/            # Full harness implementations
│   ├── opencode/         # Complete opencode harness files
│   │   ├── agent/
│   │   │   ├── brainstorm.md
│   │   │   ├── story-analyzer.md
│   │   │   ├── story-implementer.md
│   │   │   ├── story-reviewer.md
│   │   │   ├── story-start.md
│   │   │   └── story-validator.md
│   │   ├── commands/
│   │   │   ├── commit.md
│   │   │   ├── create-guideline.md
│   │   │   ├── refresh-project-config.md
│   │   │   └── init.md
│   │   └── skills/
│   │       └── record-story.md
│   │
│   └── vibe/             # Complete vibe harness files
│       └── skills/
│           ├── brainstorm/
│           │   └── SKILL.md
│           ├── commit/
│           │   └── SKILL.md
│           ├── create-guideline/
│           │   └── SKILL.md
│           ├── refresh-project-config/
│           │   └── SKILL.md
│           ├── record-story/
│           │   └── SKILL.md
│           ├── story-analyzer/
│           │   └── SKILL.md
│           ├── story-implementer/
│           │   └── SKILL.md
│           ├── story-reviewer/
│           │   └── SKILL.md
│           ├── story-start/
│           │   └── SKILL.md
│           └── story-validator/
│               └── SKILL.md
│
├── README.md
└── init                  # Activation script
```

## Usage Pattern

1. Copy the entire `.aifact/` folder into your project root
2. Run the init script to create symlinks to harness folders:
   ```bash
   ./.aifact/init [-f|--force]
   ```
3. The init script will create symlinks at project root pointing to the harness implementations within `.aifact/harnesses/`

## Key Principles

- **Core workflows** (`.aifact/workflows/`) are pure narrative markdown describing WHAT each workflow accomplishes, not HOW
- **Harness implementations** (`.aifact/harnesses/{harness}/`) add harness-specific frontmatter, metadata, and tool directives
- **Portability**: The entire `.aifact/` folder can be copied to any project for reuse
- **Backward compatibility**: Existing `.opencode/` and `.vibe/` files remain unchanged

## Activation

The init script creates symlinks for both harnesses at project root:
- `.opencode` -> `.aifact/harnesses/opencode/`
- `.vibe` -> `.aifact/harnesses/vibe/`

Use `-f` or `--force` to skip confirmation prompts.

## Core Workflows

The Foundation group workflows are:
- `brainstorm` - Repo-grounded brainstorming for shaping work
- `commit` - Create conventional commits from current changes
- `create-guideline` - Create or update a project guideline
- `refresh-project-config` - Refresh project config from repo state
- `record-story` - Record a new user story
- `story-analyzer` - Analyze a story for implementation scoping
- `story-implementer` - Implement an analyzed story
- `story-reviewer` - Review a drafted story before code-impact analysis
- `story-start` - Start a story by moving to in-progress
- `story-validator` - Validate an implemented story

Each core workflow follows the same structure: Purpose, Core Steps, Constraints, Output Contract.
