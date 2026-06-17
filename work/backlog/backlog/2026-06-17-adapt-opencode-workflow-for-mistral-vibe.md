# Replace Opencode Workflow with Mistral Vibe Workflow

## Type

spike

## Context

The AiFact repository currently contains an artifact-based AI workflow oriented around OpenAI's opencode framework. The durable workflow artifacts live under `work/`, while the workflow implementation, commands, skills, bootstrap assets, and agent instructions are organized around `.opencode/` conventions and opencode-specific tool names.

The intended target is now Mistral's Vibe coding agent, not a dual opencode/Vibe distribution. The repository should be refocused so its workflow files, documentation, bootstrap assets, and examples describe Vibe as the primary and only supported agent runtime.

Mistral Vibe has a different tool model and file convention than opencode. The replacement should preserve AiFact's artifact-first, phase-based delivery approach while removing opencode-specific runtime assumptions from the active workflow and user-facing documentation.

## Functional Requirements

- Replace the active opencode-oriented workflow with a Vibe-oriented workflow
- Preserve the artifact-first approach with `work/` as the durable source of truth
- Preserve the phase-based story lifecycle: brainstorm -> start -> analyze -> implement -> validate -> done -> PR
- Preserve current workflow capabilities where they remain relevant: brainstorming, story recording, lifecycle execution, validation, PR creation, release support, and guideline/ADR/idea recording
- Support Vibe-native tools and conventions instead of opencode-specific tools and conventions
- Update user-facing documentation so new users are guided to Vibe, not opencode
- Remove or archive opencode-oriented files from the active workflow surface rather than presenting Vibe as an additional alternative

## Technical Requirements

### Implementation Approach

Replace the active opencode workflow surface with a Vibe workflow surface. The expected end state is that repository instructions, bootstrap assets, workflow definitions, and examples all target Vibe.

Candidate Vibe structure:

.vibe/
├── agents/              # Vibe-compatible agent profiles, if Vibe supports this convention
├── commands/            # Vibe-compatible command entry points, if supported
├── skills/              # Vibe-compatible reusable skills
│   ├── agent-browser/   # Browser automation support adapted for Vibe
│   ├── record-adr/
│   ├── record-guideline/
│   ├── record-idea/
│   └── record-story/
├── workflow/            # Workflow orchestration, if needed
├── config/              # Vibe-specific configuration
└── scripts/             # Support scripts that remain necessary for Vibe

The final structure should follow Vibe's actual supported conventions. If Vibe does not support a direct equivalent for any opencode concept, adapt the workflow to the closest Vibe-native primitive rather than preserving the opencode shape.

### Replacement Rules

1. Runtime Identity:
   - Replace opencode terminology with Vibe terminology in active files and docs
   - Do not describe Vibe as an optional alternative to opencode
   - Remove opencode model references and opencode-specific agent mode concepts from the active workflow

2. Tool References:
   - Replace opencode tool references with Vibe-native equivalents where available
   - Replace `apply_patch` guidance with Vibe editing guidance
   - Replace `multi_tool_use.parallel` guidance with Vibe-appropriate task/tool usage guidance
   - Replace opencode-specific web/tool references with Vibe-supported web and task tools

3. File and Path References:
   - Replace active `.opencode/` path references with Vibe paths
   - Update `README.md`, `AGENTS.md`, bootstrap assets, command references, and project configuration to describe the Vibe workflow
   - Remove stale opencode-oriented setup instructions from user-facing documentation

4. Workflow Preservation:
   - Preserve the durable `work/` artifact model
   - Preserve story, idea, ADR, guideline, release, and project config artifact formats unless a Vibe-specific requirement justifies changing them
   - Preserve phase responsibilities while adapting handoff mechanics to Vibe

### Skill-Specific Adaptations

| Current Capability | Replacement Strategy | Complexity |
|--------------------|----------------------|------------|
| record-adr | Port to Vibe-native skill format while preserving artifact output | Low |
| record-guideline | Port to Vibe-native skill format while preserving strict guideline formatting | Low |
| record-idea | Port to Vibe-native skill format while preserving idea location and grouping behavior | Low |
| record-story | Port to Vibe-native skill format while preserving backlog template behavior | Low |
| agent-browser | Rework around Vibe web/task capabilities plus browser CLI fallback where needed | Medium |

### Workflow Roles to Replace

- brainstorm.md
- story-start.md
- story-builder.md
- story-analyzer.md
- story-reviewer.md
- story-implementer.md
- story-execute-orchestrator.md
- story-validator.md
- story-done.md
- story-pr.md
- story-ship-orchestrator.md
- browser-validator.md
- external-ideas-reviewer.md
- lightweight-command-runner.md
- ad-hoc-implementer.md

### Command Capabilities to Replace

- init.md
- change.md
- commit.md
- create-guideline.md
- refresh-project-config.md
- release.md

## Acceptance Criteria

### Phase 1: Replacement Structure & Core Workflow
- [ ] Vibe-native workflow directory structure created
- [ ] Active opencode-oriented workflow files removed, archived, or replaced so the active workflow surface targets Vibe
- [ ] Core workflow roles replaced for Vibe: brainstorm, story-analyzer, story-implementer, story-validator
- [ ] Record skills replaced for Vibe: record-story, record-idea, record-adr, record-guideline
- [ ] `AGENTS.md` updated to reference the Vibe workflow as the active workflow
- [ ] `work/project-config.md` updated so repo structure, domain rules, and loading rules reference Vibe instead of opencode
- [ ] Basic workflow tested in Vibe: brainstorm -> record-story -> story-start -> story-analyzer -> story-implementer

### Phase 2: Complete Workflow Role Replacement
- [ ] All existing workflow roles have Vibe-native equivalents or an explicit removal decision
- [ ] Handoff patterns are adapted to Vibe task/subagent mechanics
- [ ] Tool references are updated throughout active workflow files
- [ ] Model-specific OpenAI/opencode instructions are removed or replaced with Mistral/Vibe-appropriate guidance

### Phase 3: Commands, Bootstrap & Documentation
- [ ] All command capabilities are replaced with Vibe-native equivalents or explicitly retired
- [ ] Bootstrap/init assets install or explain the Vibe workflow, not opencode
- [ ] README and user-facing docs describe Vibe as the supported runtime
- [ ] Any migration guidance explains replacement from opencode to Vibe, not long-term coexistence
- [ ] Browser validation and external ideas review either work in Vibe or are documented as deferred/unsupported

### Phase 4: Validation & Cleanup
- [ ] Full end-to-end workflow tested with a real story using Vibe
- [ ] Artifacts persist correctly in `work/`
- [ ] Active docs and workflow files no longer instruct users to configure or use opencode
- [ ] Stale opencode-only files are removed or moved out of the active workflow path
- [ ] Remaining historical opencode references are clearly archival, not active instructions

## Verification Plan

### Unit Checks
- Exercise each Vibe workflow role individually with sample inputs
- Verify each Vibe skill produces correct artifacts in `work/`
- Exercise each Vibe command or command-equivalent in isolation

### Integration Checks
- Test brainstorm -> record-story flow in Vibe
- Test story-start -> story-analyzer -> story-implementer -> story-validator flow in Vibe
- Test complete story lifecycle from backlog to done in Vibe

### Replacement Checks
- Verify artifact formats remain compatible with existing `work/` files
- Verify handoff between phases works correctly in Vibe
- Verify documentation and bootstrap instructions no longer point users to opencode as the active runtime

## Dependencies

- Vibe CLI installed and configured
- Access to the required Mistral model configuration for Vibe
- Git installed for version control operations
- Optional: gh CLI for PR workflows
- Optional: agent-browser CLI for complex browser automation

## Constraints

- Do not maintain opencode as an active supported workflow in this repository
- Maintain artifact compatibility with the `work/` directory structure
- Keep the same phase-based workflow model unless a Vibe limitation requires an explicit product decision
- Prefer Vibe-native conventions over direct one-for-one opencode shape preservation
- Test each component before integrating into the full workflow

## Notes

This is a meta-workflow replacement task. The deliverable is not application functionality but the repository workflow infrastructure and documentation needed for Vibe to be the supported AiFact runtime. Success is measured by: (1) Vibe can successfully execute the full story workflow, (2) artifacts are created in the correct locations with correct formats, (3) the workflow feels natural to Vibe users, and (4) active repository instructions no longer present opencode as the supported workflow.
