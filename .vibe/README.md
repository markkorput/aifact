# Vibe MVP Workflow Evaluation

This directory contains the minimal Vibe-native workflow slice for evaluating AiFact on Mistral Vibe Code.

## Status

- This is an MVP evaluation surface, not the full active replacement yet.
- `.opencode/` remains intact while Vibe conventions and lifecycle fit are proven.
- The durable artifact structure remains under `work/`.

## Included skills

- `brainstorm`
- `record-story`
- `story-start`
- `story-analyzer`
- `story-implementer`
- `story-validator`

Vibe Code discovers these as project-level skills from `./.vibe/skills/` when the working directory is trusted.
