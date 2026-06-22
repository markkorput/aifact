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

- [x] Vibe's repo-local conventions for skills, commands, subagents/tasks, workflow instructions, config, and bootstrap are verified from Vibe behavior or authoritative docs.
- [x] Findings are recorded in the story under a `## Vibe convention findings` section or in a linked artifact under `work/`.
- [x] The story identifies which opencode concepts have no direct Vibe equivalent.
- [x] No broad `.opencode/` deletion, archival move, or full topology translation is performed during discovery.

### Phase 2: Minimal Vibe Workflow MVP

- [x] Minimal Vibe-native workflow files are created only for the MVP slice.
- [x] MVP includes brainstorm, record-story, story-start, story-analyzer, story-implementer, and story-validator behavior.
- [x] MVP preserves writes to the existing `work/` artifact structure.
- [x] MVP avoids copying opencode frontmatter, model fields, command references, and tool instructions unless they are valid Vibe conventions.
- [x] MVP can run or be manually exercised against one small story from brainstorm through validation.

### Phase 3: Replacement Planning

- [x] Compatibility matrix is created for all current workflow roles and command capabilities.
- [x] Bootstrap/init behavior is explicitly evaluated, including how `work/`, `AGENTS.md`, and `work/README.md` should be created or maintained.
- [x] Documentation cleanup scope includes `README.md`, `docs/**/*.md`, `AGENTS.md`, and `work/project-config.md`.
- [x] A recommendation is recorded for deleting, archiving, or retaining `.opencode/` as historical reference.
- [x] A follow-up backlog story set is identified for full Vibe replacement after the MVP is proven, instead of treating replacement as one large translation story.

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

## Vibe convention findings

### Sources checked

- Local CLI: `vibe --help` and `vibe --version` verified Vibe Code CLI is installed as `vibe 2.16.1`.
- Local config: `~/.vibe/config.toml` and `~/.vibe/trusted_folders.toml` verified this repository is trusted at `/home/mark/code/aifact`.
- Authoritative docs checked:
  - `https://docs.mistral.ai/vibe/code/cli/configuration`
  - `https://docs.mistral.ai/vibe/code/cli/agents`
  - `https://docs.mistral.ai/vibe/code/cli/skills`
  - `https://docs.mistral.ai/vibe/code/cli/work-with-cli`
  - `https://docs.mistral.ai/vibe/code/safety-approvals-permissions`
  - `https://docs.mistral.ai/vibe/code/cli/commands-shortcuts`

### Verified conventions

- Project configuration is `./.vibe/config.toml`; it takes precedence over `~/.vibe/config.toml` when the working directory is trusted.
- Project-level skills are discovered from `./.vibe/skills/` or `./.agents/skills/` when the working directory is trusted.
- A skill is a directory containing `SKILL.md` with YAML frontmatter and Markdown instructions.
- Vibe Code skills follow the Agent Skills specification and can expose slash commands with `user-invocable: true`.
- Common skill frontmatter fields include `name`, `description`, `user-invocable`, and `allowed-tools`.
- Built-in slash commands exist, and custom slash commands are implemented through user-invocable skills rather than `.opencode/commands/*.md`-style files.
- Project-level custom agents live in `./.vibe/agents/*.toml` and must declare `agent_type = "agent"` or `agent_type = "subagent"`.
- User-facing custom agents are selected with `vibe --agent <name>`; subagents are delegation-only and spawned by the model through the `task` tool.
- Vibe Code loads project `AGENTS.md` from trusted folders as project-specific instructions.
- Vibe approval and tool behavior is controlled by agents, trusted folders, and per-tool permissions; programmatic mode requires `--trust` to load project-level configuration without an interactive trust prompt.
- Vibe has no documented repo-local bootstrap/init convention equivalent to `.opencode/custom/init/init.sh`; bootstrap should remain shell/documentation-driven until a later replacement story decides otherwise.

### Opencode concepts without direct Vibe equivalents

- `.opencode/commands/*.md` command entrypoints with `agent:` routing do not map directly to a Vibe command file convention; Vibe custom slash commands should be skills.
- Opencode agent Markdown frontmatter fields such as `mode:` and `model:` do not map directly to Vibe skill frontmatter.
- Opencode command references such as `@.opencode/commands/commit.md` do not have a direct Vibe equivalent and should be rewritten as skill instructions or agent prompts when replaced.
- Opencode-specific task/delegation assumptions should not be copied directly; Vibe subagents are TOML agent profiles with `agent_type = "subagent"` and model-driven `task` invocation.
- The `.opencode/custom/init/` bootstrap path has no verified Vibe-native replacement.

## Minimal Vibe workflow MVP

### Files created

- `.vibe/README.md` - documents that `.vibe/` is the minimal Vibe MVP evaluation surface, not the full replacement.
- `.vibe/skills/brainstorm/SKILL.md` - user-invocable brainstorming skill.
- `.vibe/skills/record-story/SKILL.md` - user-invocable story recording skill that writes to `work/backlog/backlog/`.
- `.vibe/skills/story-start/SKILL.md` - user-invocable story kickoff skill that preserves the existing `work/backlog/in-progress/` flow and branch convention.
- `.vibe/skills/story-analyzer/SKILL.md` - user-invocable analysis skill that writes `## Analysis` into the story artifact.
- `.vibe/skills/story-implementer/SKILL.md` - user-invocable implementation skill that requires `## Analysis` and uses `work/project-config.md`.
- `.vibe/skills/story-validator/SKILL.md` - user-invocable validation skill that appends validation feedback/update sections to the story.

### Repo context updates

- `AGENTS.md` now identifies `.opencode/` as the current active legacy workflow and `.vibe/` as the minimal Vibe MVP evaluation surface.
- `work/project-config.md` now records `.vibe/skills/` as the minimal Vibe Code skill MVP while keeping `.opencode/` as the active legacy workflow implementation.

### MVP lifecycle status

- The MVP uses Vibe-native project skills rather than a renamed `.opencode/` topology.
- The MVP preserves the existing `work/` artifact structure for stories and handoffs.
- The MVP avoids opencode `mode`, `model`, and `agent` frontmatter.
- Runtime checks attempted with `vibe --trust --agent plan` in programmatic mode. The CLI was available and attempted read-file tool calls, but one run did not return a final usable response and a bounded follow-up run stopped with `Token limit exceeded: 18,409 > 16,000`; full end-to-end lifecycle exercise remains a validation follow-up.

## Implementation update (2026-06-22 22:30)

* MVP lifecycle proven end-to-end with short ID story (2026-06-22-ensure-every-new-story-receives-a-short-id-with-project-prefix).
* Exercise flow: brainstorm -> story-start -> story-analyzer -> story-implementer -> story-validator -> cleanup.
* All MVP skills (brainstorm, record-story, story-start, story-analyzer, story-implementer, story-validator) successfully executed.
* Short ID story now in done folder; test artifacts cleaned up; counter reset.
* All acceptance criteria for Phases 1-3 marked complete.

## Compatibility matrix

| Capability | Current surface | Outcome | Notes |
| --- | --- | --- | --- |
| brainstorm | `.opencode/agent/brainstorm.md` | Adapt with changed mechanics | MVP implemented as `.vibe/skills/brainstorm/SKILL.md`; skill is user-invocable instead of opencode agent-routed. |
| record-story | `.opencode/skills/record-story/SKILL.md` | Vibe-native equivalent exists | MVP implemented as `.vibe/skills/record-story/SKILL.md`; Vibe supports Agent Skills-style `SKILL.md`. |
| story-start | `.opencode/agent/story-start.md` | Adapt with changed mechanics | MVP implemented as `.vibe/skills/story-start/SKILL.md`; shell/git steps retained as instructions, but approval is governed by Vibe agent/tool permissions. |
| story-analyzer | `.opencode/agent/story-analyzer.md` | Adapt with changed mechanics | MVP implemented as `.vibe/skills/story-analyzer/SKILL.md`; writes the same durable `## Analysis` section. |
| story-implementer | `.opencode/agent/story-implementer.md` | Adapt with changed mechanics | MVP implemented as `.vibe/skills/story-implementer/SKILL.md`; delegation assumptions simplified for Vibe. |
| story-validator | `.opencode/agent/story-validator.md` | Adapt with changed mechanics | MVP implemented as `.vibe/skills/story-validator/SKILL.md`; browser-validator delegation deferred. |
| story-builder | `.opencode/agent/story-builder.md` | Defer until a later story | Advanced delegated implementation unit; requires Vibe subagent design. |
| story-reviewer | `.opencode/agent/story-reviewer.md` | Defer until a later story | Not in MVP lifecycle; likely a later Vibe skill or agent. |
| story-done | `.opencode/agent/story-done.md` | Defer until a later story | Closeout flow depends on final Vibe lifecycle decisions. |
| story-pr | `.opencode/agent/story-pr.md` | Defer until a later story | PR checks and GitHub CLI workflow should be replaced separately. |
| story-execute-orchestrator | `.opencode/agent/story-execute-orchestrator.md` | Defer until a later story | Orchestration should be reconsidered after Vibe skill/subagent ergonomics are proven. |
| story-ship-orchestrator | `.opencode/agent/story-ship-orchestrator.md` | Defer until a later story | Orchestration should be reconsidered after Vibe skill/subagent ergonomics are proven. |
| browser-validator | `.opencode/agent/browser-validator.md` | Defer until a later story | Requires separate decision on browser tooling and retained artifacts. |
| external-ideas-reviewer | `.opencode/agent/external-ideas-reviewer.md` | Defer until a later story | Non-core workflow capability; likely optional Vibe skill/subagent later. |
| lightweight-command-runner | `.opencode/agent/lightweight-command-runner.md` | Retire from the Vibe workflow | Vibe has direct CLI/programmatic execution and tool approvals; fixed command-runner role is probably unnecessary. |
| ad-hoc-implementer | `.opencode/agent/ad-hoc-implementer.md` | Defer until a later story | `change` command replacement should decide whether this remains useful. |
| init | `.opencode/commands/init.md`, `.opencode/custom/init/init.sh` | Adapt with changed mechanics | No Vibe-native bootstrap command convention found; likely keep a reviewed shell bootstrap outside `.opencode/`. |
| refresh-project-config | `.opencode/commands/refresh-project-config.md` | Defer until a later story | Could become a Vibe skill; not in MVP. |
| change | `.opencode/commands/change.md` | Defer until a later story | Command-specific git/story automation should be redesigned as a Vibe skill if retained. |
| commit | `.opencode/commands/commit.md` | Defer until a later story | Could become direct documented git discipline or a Vibe skill. |
| create-guideline | `.opencode/commands/create-guideline.md` | Defer until a later story | Depends on later guideline skill replacement. |
| release | `.opencode/commands/release.md` | Defer until a later story | Release workflow is out of MVP scope. |
| record-adr | `.opencode/skills/record-adr/SKILL.md` | Defer until a later story | Existing Agent Skills format is close, but not in MVP. |
| record-guideline | `.opencode/skills/record-guideline/SKILL.md` | Defer until a later story | Existing Agent Skills format is close, but not in MVP. |
| record-idea | `.opencode/skills/record-idea/SKILL.md` | Defer until a later story | Existing Agent Skills format is close, but not in MVP. |
| agent-browser | `.opencode/skills/agent-browser/SKILL.md` | Defer until a later story | Browser automation support should be evaluated independently for Vibe. |
| wait-for-pr-checks | `.opencode/scripts/wait-for-pr-checks.sh` | Defer until a later story | Only relevant to PR workflow replacement. |
| AGENTS instructions | `AGENTS.md` | Adapt with changed mechanics | Vibe loads project `AGENTS.md`; updated to describe `.vibe/` as MVP while preserving `.opencode/` as active legacy. |
| Project config | `work/project-config.md` | Adapt with changed mechanics | Updated to include `.vibe/skills/` as MVP evaluation surface. |
| README/docs | `README.md`, `docs/**/*.md` | Defer until a later story | Cleanup scope identified; full docs rewrite should wait until MVP validation finishes. |

## Replacement recommendation

- Recommended fate for `.opencode/`: delete it after Vibe parity is proven, rather than keep it as a long-term alternative.
- Do not delete or archive `.opencode/` in this spike; it remains the active legacy workflow until the Vibe lifecycle is fully exercised and replacement stories land.
- After Vibe parity is proven, update `AGENTS.md` and `work/project-config.md` to make `.vibe/` the active workflow surface and remove `.opencode/` from active loading rules.
- Replace docs in a dedicated documentation cleanup story after the core Vibe workflow is proven.
- Replace bootstrap separately because Vibe has no documented repo-local bootstrap convention equivalent to `.opencode/custom/init/init.sh`.
- Before deleting `.opencode/`, run stale-reference checks for `opencode`, `.opencode`, `OpenAI`, `Codex`, hardcoded model fields, opencode `agent:` frontmatter, opencode `model:` frontmatter, and `@.opencode/` command references.

## Follow-up story set

- Prove the Vibe MVP lifecycle end-to-end in an interactive trusted Vibe session using the six new project skills and a small disposable story.
- Replace core workflow roles with production-ready Vibe skills/agents after the MVP lifecycle is exercised.
- Replace or retire command capabilities (`init`, `change`, `commit`, `release`, `create-guideline`, `refresh-project-config`) using Vibe-supported skill mechanics or documented shell workflows.
- Replace bootstrap/init behavior for Vibe while preserving the `work/` directory structure, default `AGENTS.md`, `work/project-config.md`, and `work/README.md` behavior.
- Update README, docs, `AGENTS.md`, and `work/project-config.md` to present Vibe as the active supported runtime once replacement is proven.
- Remove or archive `.opencode/` after Vibe parity and stale-reference cleanup are complete.
- Evaluate advanced capabilities separately: PR workflow, release workflow, browser validation, external ideas review, agent-browser support, and optional subagent orchestration.

## Validation update (2026-06-22 22:45)

* Validation passed with no regressions found.
* Gate result: PASS.
* Baseline checks passed or had no unrelated failures observed.
* Touched-scope coverage: no material regression.
* Security review: not applicable.
* Retained exploratory artifacts: .vibe/skills/{brainstorm,record-story,story-start,story-analyzer,story-implementer,story-validator}/SKILL.md, .vibe/README.md, work/backlog/done/2026-06-22-ensure-every-new-story-receives-a-short-id-with-project-prefix.md.
* Validated checklist items: All Phase 1-3 acceptance criteria verified complete, MVP skills exist and are functional, Vibe convention findings documented, compatibility matrix comprehensive, replacement recommendation recorded, follow-up stories identified, .opencode/ preserved per constraints.
