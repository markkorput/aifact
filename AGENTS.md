# AGENTS
This repository defines an artifact-based AI workflow.

## Main rule

- Treat files in `work/` as the durable source of truth.
- Treat `.opencode/` as the current active legacy workflow implementation until Vibe replacement is proven.
- Treat `.vibe/` as the minimal Vibe MVP evaluation surface, not the full replacement yet.
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
