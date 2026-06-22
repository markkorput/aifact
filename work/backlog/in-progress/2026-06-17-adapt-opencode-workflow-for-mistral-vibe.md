# Evaluate Minimal Mistral Vibe Workflow Replacement

## Type

spike

## Context

The AiFact repository currently contains an artifact-based AI workflow oriented around OpenAI's opencode framework. The durable workflow artifacts live under `work/`, while the workflow implementation, commands, skills, bootstrap assets, and agent instructions are organized around `.opencode/` conventions and opencode-specific tool names.

The intended target is now Mistral's Vibe coding agent, not a dual opencode/Vibe distribution. The repository should eventually be refocused so its workflow files, documentation, bootstrap assets, and examples describe Vibe as the primary and only supported agent runtime.

The first step should not be a broad translation of the current `.opencode/` topology into a speculative `.vibe/` topology. The first step should prove a minimal Vibe-native workflow, learn Vibe's actual repo-local conventions, and record the replacement decisions before removing or reshaping the full active workflow surface.

## Review Findings

- The story correctly frames the desired end state as replacement, not coexistence.
- The current active repo rules still name `.opencode/` as the workflow implementation in `AGENTS.md` and `work/project-config.md`.
- The current workflow is concretely opencode-shaped: `.opencode/agent/`, `.opencode/commands/`, `.opencode/skills/`, `.opencode/custom/init/`, and `.opencode/scripts/` are all part of the active workflow surface.
- The docs surface is broader than the initial story implied: `README.md` points to `docs/**/*.md`, and those docs contain opencode/OpenAI-era references that must be accounted for during replacement.
- Bootstrap is a hidden risk because the current init command calls `.opencode/custom/init/init.sh`, which creates `work/`, default `AGENTS.md`, and `work/README.md` symlink behavior.
- The role and command files cannot be safely translated by path and terminology alone because they include opencode-specific frontmatter, model fields, delegation assumptions, command references, and tool guidance.
- There is no ADR yet documenting Vibe as the supported runtime or the fate of `.opencode/`.

## Functional Requirements

- Build the smallest useful Vibe-native workflow slice before replacing the full opencode workflow.
- Discover and document Vibe's actual conventions for repo-local skills, commands, subagents, workflow instructions, and configuration.
- Preserve the artifact-first approach with `work/` as the durable source of truth.
- Prove a minimal phase-based lifecycle in Vibe: brainstorm -> record-story -> story-start -> story-analyzer -> story-implementer -> story-validator.
- Preserve existing artifact formats for stories, ideas, ADRs, guidelines, project config, and releases unless a Vibe limitation requires an explicit decision.
- Avoid presenting Vibe as a long-term alternative to opencode; this spike should prepare the replacement path.
- Do not remove or archive the active opencode workflow until the minimal Vibe workflow is proven and the replacement decision is recorded.

## Technical Requirements

### Implementation Approach

Start with a minimal Vibe workflow evaluation, not a full topology translation.

The spike should produce:

- A verified description of Vibe's supported repo-local conventions.
- A minimal Vibe-native workflow structure using those conventions.
- A minimal set of Vibe workflow instructions or skills needed to run one story through analysis, implementation, and validation.
- A compatibility matrix for existing AiFact roles and command capabilities.
- A recommended replacement plan for the active opencode workflow surface.

### Minimal Vibe Workflow Slice

The MVP should include only the capabilities needed to evaluate Vibe conventions and prove the core lifecycle:

- brainstorm
- record-story
- story-start
- story-analyzer
- story-implementer
- story-validator

Defer full replacement of these capabilities until after the MVP proves the conventions:

- story-builder
- story-reviewer
- story-done
- story-pr
- story-execute-orchestrator
- story-ship-orchestrator
- browser-validator
- external-ideas-reviewer
- lightweight-command-runner
- ad-hoc-implementer
- release
- change
- commit
- create-guideline
- refresh-project-config
- agent-browser
- record-adr
- record-guideline
- record-idea

### Convention Discovery

Before creating a broad `.vibe/` tree, verify and record:

- Where Vibe expects repo-local instructions, skills, commands, subagents, or workflow files.
- Which frontmatter or metadata fields Vibe supports.
- How Vibe invokes skills and task/subagent behavior.
- How Vibe exposes editing, shell, search, web, and browser-adjacent tools.
- Whether Vibe supports command entry points analogous to the current `.opencode/commands/` files.
- Whether Vibe supports a repo-local bootstrap/init pattern or whether bootstrap should remain shell/documentation-driven.

### Active Workflow Surface to Evaluate

The replacement plan must explicitly account for:

- `AGENTS.md`
- `README.md`
- `docs/**/*.md`
- `work/project-config.md`
- `.opencode/agent/**`
- `.opencode/commands/**`
- `.opencode/skills/**`
- `.opencode/custom/init/**`
- `.opencode/scripts/**`
- any future Vibe-native workflow directory or config files

### Compatibility Matrix

Create a matrix for each existing role and command capability with one of these outcomes:

- Vibe-native equivalent exists
- Adapt with changed mechanics
- Retire from the Vibe workflow
- Defer until a later story
- Blocked by missing or unknown Vibe capability

The matrix should call out bootstrap behavior, docs impact, handoff mechanics, tool usage, and artifact write paths where relevant.

### Replacement Decision

Record a decision recommendation for the fate of `.opencode/`:

- delete it after Vibe parity is proven,
- move it to an explicitly archival location,
- or keep a historical reference with clear exclusion from active workflow instructions.

The recommendation should include the impact on `AGENTS.md`, `work/project-config.md`, README/docs, bootstrap behavior, and stale-reference checks.

### Follow-up Story Breakdown

Do not treat full Vibe replacement as one implementation story. After this spike, split the remaining work into smaller stories such as:

- Replace core workflow roles with Vibe-native equivalents after the MVP proves conventions.
- Replace or retire command capabilities using Vibe-supported command or workflow mechanics.
- Replace bootstrap/init behavior for Vibe while preserving the `work/` artifact structure.
- Update README, docs, `AGENTS.md`, and `work/project-config.md` to make Vibe the active supported runtime.
- Remove, archive, or explicitly de-activate `.opencode/` after the replacement decision is recorded.
- Replace advanced capabilities separately: PR workflow, release workflow, browser validation, external ideas review, and optional agent-browser support.

## Acceptance Criteria

### Phase 1: Vibe Convention Discovery

- [ ] Vibe's repo-local conventions for skills, commands, subagents/tasks, workflow instructions, config, and bootstrap are verified from Vibe behavior or authoritative docs.
- [ ] Findings are recorded in the story under a `## Vibe convention findings` section or in a linked artifact under `work/`.
- [ ] The story identifies which opencode concepts have no direct Vibe equivalent.
- [ ] No broad `.opencode/` deletion, archival move, or full topology translation is performed during discovery.

### Phase 2: Minimal Vibe Workflow MVP

- [ ] Minimal Vibe-native workflow files are created only for the MVP slice.
- [ ] MVP includes brainstorm, record-story, story-start, story-analyzer, story-implementer, and story-validator behavior.
- [ ] MVP preserves writes to the existing `work/` artifact structure.
- [ ] MVP avoids copying opencode frontmatter, model fields, command references, and tool instructions unless they are valid Vibe conventions.
- [ ] MVP can run or be manually exercised against one small story from brainstorm through validation.

### Phase 3: Replacement Planning

- [ ] Compatibility matrix is created for all current workflow roles and command capabilities.
- [ ] Bootstrap/init behavior is explicitly evaluated, including how `work/`, `AGENTS.md`, and `work/README.md` should be created or maintained.
- [ ] Documentation cleanup scope includes `README.md`, `docs/**/*.md`, `AGENTS.md`, and `work/project-config.md`.
- [ ] A recommendation is recorded for deleting, archiving, or retaining `.opencode/` as historical reference.
- [ ] A follow-up backlog story set is identified for full Vibe replacement after the MVP is proven, instead of treating replacement as one large translation story.

## Verification Plan

### Convention Checks

- Verify Vibe can discover and use the minimal repo-local workflow files in the chosen structure.
- Verify the chosen structure follows Vibe-supported conventions rather than a renamed opencode topology.
- Verify unsupported opencode concepts are documented instead of silently copied.

### Workflow Checks

- Exercise brainstorm -> record-story in Vibe.
- Exercise story-start -> story-analyzer -> story-implementer -> story-validator in Vibe.
- Verify the resulting artifacts persist in the existing `work/` locations.
- Verify the MVP does not require `.opencode/` commands or agents at runtime.

### Replacement Readiness Checks

- Search active docs and workflow instructions for stale `opencode`, `.opencode`, `OpenAI`, `Codex`, and hardcoded model references.
- Verify the compatibility matrix accounts for every current role and command capability before full replacement work begins.
- Verify the `.opencode/` fate recommendation is explicit enough to split into implementation stories.

## Dependencies

- Vibe CLI installed and configured.
- Access to the required Mistral model configuration for Vibe.
- Git installed for version control operations.
- Optional: gh CLI for later PR workflow replacement.
- Optional: agent-browser CLI for later browser validation replacement.

## Constraints

- Do not maintain opencode as a long-term active supported workflow in this repository.
- Do not translate the full `.opencode/` topology before validating Vibe conventions.
- Do not remove or archive `.opencode/` until the MVP is proven and a replacement decision is recorded.
- Maintain compatibility with the existing `work/` directory structure.
- Prefer Vibe-native conventions over one-for-one opencode shape preservation.

## Notes

This is a convention-discovery and MVP replacement spike. The deliverable is not full workflow parity. Success is measured by: (1) Vibe conventions are verified, (2) a minimal Vibe-native lifecycle can use the existing `work/` artifacts, (3) hidden replacement complexity is captured in a compatibility matrix, and (4) the next full replacement story can be estimated without assuming that opencode topology maps directly to Vibe.

## Analysis

### Likely Impact

- Primary implementation lane: Vibe convention discovery -> minimal Vibe-native workflow files for the MVP slice -> artifact-preserving lifecycle exercise -> compatibility/replacement notes recorded in the story or linked `work/` artifact.
- Current active runtime surface is `.opencode/`-centered: `work/project-config.md` names `.opencode/agent/`, `.opencode/commands/`, `.opencode/skills/`, `.opencode/custom/init/`, and `.opencode/scripts/` as workflow implementation areas.
- Minimal MVP source material should come first from `.opencode/agent/brainstorm.md`, `.opencode/skills/record-story/SKILL.md`, `.opencode/agent/story-start.md`, `.opencode/agent/story-analyzer.md`, `.opencode/agent/story-implementer.md`, and `.opencode/agent/story-validator.md` because those are the exact lifecycle roles named by the story.
- The new Vibe-native workflow location/config is intentionally unknown until discovery; do not create a broad `.vibe/` mirror before Vibe repo-local conventions are verified.
- Bootstrap behavior is likely in scope for evaluation, not full replacement: `.opencode/commands/init.md` delegates to `.opencode/custom/init/init.sh`, and that script creates `work/`, default `AGENTS.md`, `work/project-config.md`, and the `work/README.md` symlink.

### Possible Adjacent Touchpoints

- `AGENTS.md` - currently tells agents to treat `.opencode/` as the workflow implementation; may need a spike note or deferred replacement callout, but full rewrite should wait until Vibe MVP is proven.
- `README.md` and `docs/**/*.md` - active docs describe `.opencode/` commands/agents and OpenAI-era assumptions; likely inputs to the compatibility matrix and stale-reference scan rather than first-pass full doc replacement.
- `.opencode/commands/*.md` - command files show opencode-specific command entrypoint assumptions and agent routing; use them to classify capability outcomes, not as direct files to translate during the MVP.
- `.opencode/custom/init/README.md` and prompt reference files - may need compatibility review because bootstrap/docs still include OpenAI/Codex-era prompt assets.

### Existing Patterns / Prior Art

- `.opencode/agent/story-analyzer.md` - closest pattern for durable handoff behavior: reads a story, performs bounded repo lookup, and writes `## Analysis` back into the story.
- `.opencode/agent/story-implementer.md` and `.opencode/agent/story-validator.md` - closest examples for phase contracts that consume prior story sections and keep verification source-of-truth in `work/project-config.md`.
- `.opencode/agent/story-start.md` - concrete kickoff mechanics for story movement, branch naming, and safe staging; reuse only if Vibe supports equivalent shell/git workflow assumptions.
- `.opencode/skills/record-story/SKILL.md` - minimal reusable story recording contract; likely easiest MVP capability to adapt once Vibe skill/instruction conventions are known.
- `.opencode/custom/init/init.sh` - prior art for preserving the durable `work/` artifact structure; do not treat its `.opencode` path or symlink target as Vibe-compatible without discovery.

### Layer Boundaries

- Touch first: newly discovered Vibe repo-local workflow/config files, MVP role/skill instructions for the six named lifecycle capabilities, and story-linked discovery/planning artifacts under `work/`.
- Touch first for evidence only: `.opencode/agent/**`, `.opencode/skills/**`, `.opencode/commands/**`, and `.opencode/custom/init/**` as source material for the compatibility matrix and replacement plan.
- Avoid unless evidence emerges: deleting, archiving, or mass-renaming `.opencode/`; rewriting all docs; changing durable story/idea/ADR/guideline formats; replacing release/PR/browser/advanced agents outside the MVP slice.
- Avoid unless Vibe discovery requires it: changing `work/project-config.md` and `AGENTS.md` to declare Vibe as active before the MVP is proven and the replacement decision is recorded.

### Verification Plan

**E2E / Manual Validation**:

- Manually exercise the minimal Vibe lifecycle against a small story: brainstorm -> record-story -> story-start -> story-analyzer -> story-implementer -> story-validator.
- Confirm each exercised phase reads/writes the existing `work/` artifact locations and does not require `.opencode/` agents or commands at runtime.

**Additional Checks (as applicable)**:

- Verify Vibe conventions from authoritative docs or observed CLI behavior before creating repo-local workflow files.
- Confirm the compatibility matrix accounts for every current agent, skill, command, bootstrap script, and support script named by `work/project-config.md` and the story.
- Run a stale-reference check for `opencode`, `.opencode`, `OpenAI`, `Codex`, hardcoded model fields, and opencode-specific frontmatter before recommending full replacement work.
