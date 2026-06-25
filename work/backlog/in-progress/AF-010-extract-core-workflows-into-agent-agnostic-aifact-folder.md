# AF-010 Extract core workflows into agent-agnostic .aifact/ folder

## Type

feature

## Context

The AiFact repository currently contains an opencode-specific workflow implementation in `.opencode/` and a partial Mistral Vibe port in `.vibe/`. This has resulted in significant duplication of workflow logic across both harnesses, making maintenance difficult and creating inconsistency risks.

Examples of duplication:
- `brainstorm`: `.opencode/agent/brainstorm.md` and `.vibe/skills/brainstorm/SKILL.md`
- `story-reviewer`: `.opencode/agent/story-reviewer.md` and `.vibe/skills/story-reviewer/SKILL.md`
- `commit`: `.opencode/commands/commit.md` and `.vibe/skills/commit/SKILL.md`
- `record-story`: `.opencode/skills/record-story/SKILL.md` and `.vibe/skills/record-story/SKILL.md`
- And others across the story lifecycle

The workflow logic is nearly identical but formatted differently for each harness (different frontmatter, tool names, execution style). This creates a maintenance burden and makes it difficult to ensure consistency.

## Functional Requirements

Create a portable, harness-agnostic core workflow framework in `.aifact/` that:

- Contains core workflow definitions that are tool-agnostic and harness-independent
- Allows each harness (opencode, vibe) to provide its own thin adapter layer
- Maintains backward compatibility by not modifying existing `.opencode/` or `.vibe/` files
- Enables the entire `.aifact/` folder to be copied into any project for reuse
- Supports activation via a pointer file at project root that references the desired harness within `.aifact/`

## Technical Requirements

### Implementation approach

1. Create `.aifact/` directory at repository root with the following structure:
   ```
   .aifact/
   ├── workflows/            # Core workflow definitions (tool-agnostic)
   │   ├── record-story.md
   │   ├── create-guideline.md
   │   ├── commit.md
   │   ├── refresh-project-config.md
   │   ├── brainstorm.md
   │   ├── story-start.md
   │   ├── story-reviewer.md
   │   ├── story-analyzer.md
   │   ├── story-implementer.md
   │   └── story-validator.md
   │
   ├── harnesses/            # Full harness implementations
   │   ├── opencode/         # Complete opencode harness files
   │   │   ├── agent/
   │   │   │   ├── brainstorm.md
   │   │   │   └── ...
   │   │   ├── commands/
   │   │   │   ├── commit.md
   │   │   │   └── ...
   │   │   └── skills/
   │   │       └── ...
   │   │
   │   └── vibe/             # Complete vibe harness files
   │       └── skills/
   │           ├── brainstorm/
   │           │   └── SKILL.md
   │           └── ...
   │
   ├── README.md
   └── init
   ```

2. Core workflow files in `.aifact/workflows/`:
   - Use pure narrative markdown format (Option A)
   - Describe WHAT each workflow should accomplish, not HOW (no tool calls)
   - Include: Purpose, Core Steps, Constraints, Output Contract
   - Be harness-agnostic and human-readable

3. Harness-specific files in `.aifact/harnesses/{harness}/`:
   - Reference the core workflow files directly
   - Add harness-specific frontmatter and metadata
   - Provide harness-specific adaptations and directives
   - Be complete, working implementations for that harness

4. Usage pattern:
   - Copy `.aifact/` into a project
   - Run the init script to generate harness-specific pointer files at harness-specific locations
   - Init script prompts before overwriting existing pointer files or `.aifact/` directory; use `-f`/`--force` to skip prompts
   - Pointer files reference the desired harness implementations within `.aifact/harnesses/`

### Decisions with rationale

1. **Location: `.aifact/` at repository root**
   - Rationale: Creates clear separation from legacy harness implementations; explicitly names the framework; enables portability; both harnesses can easily discover and reference it
   - Alternatives considered: `work/workflows/` (blurs artifact/definition boundary), `.shared/` (new convention without clear purpose)

2. **Abstraction level: Tool-agnostic core workflows**
   - Rationale: Maximizes reusability across harnesses; core workflows describe intent not implementation; harness adapters handle tool-specific details
   - Alternatives considered: Shallow sharing (minimal benefit), Deep sharing (too rigid)

3. **Reference mechanism: Direct reference**
   - Rationale: Simplest approach; harness files contain literal file path references to core workflows in markdown format optimized for AI agent consumption; no build step or preprocessing required
   - Alternatives considered: Include directives (requires preprocessing), Generative approach (complex build system), Manual sync (reintroduces duplication)

4. **Backward compatibility: Additive strategy**
   - Rationale: Zero risk to existing workflows; clear distinction between framework development (`.aifact/`) and current usage (`.opencode/`, `.vibe/`, `work/`); allows parallel development and testing
   - Alternatives considered: Gradual migration (complex transition), Big Bang (high risk)

5. **Core workflow format: Pure narrative markdown (Option A)**
   - Rationale: Most readable and maintainable; harness files can add their own structure; keeps core workflows as human-readable specifications
   - Alternatives considered: Structured frontmatter (unnecessary complexity), YAML+Markdown hybrid (over-engineered)

6. **Harness folder contents: Full implementations**
   - Rationale: Enables `.aifact/` to be self-contained and portable; each harness folder contains everything needed for that harness to work; supports the pointer-based activation pattern
   - Alternatives considered: Adapter-only files (would require existing harness files to reference `.aifact/`, complicating the portability goal)

7. **Activation mechanism: Harness-specific pointer files with user prompts**
   - Rationale: Avoids overwriting existing harness directories at project root; init script generates harness-specific pointer files in harness-specific locations that reference implementations within `.aifact/harnesses/`; prompts user before overwriting existing files or directories; `-f`/`--force` flag skips prompts; enables clean discovery without symlink conflicts
   - Alternatives considered: Symlinking harness folders to root (overwrites existing directories), Standardized pointer file (incompatible with harness-specific discovery conventions), Silent overwrite (risky, no user control)

8. **Top-level `.aifact/` files: README.md, init**
   - Rationale: README.md provides human-oriented documentation; init script generates harness-specific pointer files for activation; AGENTS.md is harness-specific and lives only in harness folders
   - Alternatives considered: No top-level files (lacks discoverability), All files in subdirectories (less convenient)

### Rejected alternatives

- **Modifying existing `.opencode/` or `.vibe/` files**: Too risky; breaks current usage; hard to test
- **Shared includes directory**: More granular but harder to maintain consistency; doesn't solve the portability goal as cleanly
- **Workflow DSL (YAML/JSON)**: More structured but requires new tooling and learning curve; markdown is sufficient
- **Standardizing on one tool name set**: Would require changing one harness's conventions; better to let each harness use its native tool names

### Constraints

- Do not modify any existing files in `.opencode/`, `.vibe/`, or `work/`
- Core workflows must be completely harness-agnostic (no tool calls, no harness-specific metadata)
- Harness implementations must be self-contained and workable via pointer file
- The solution must support multiple harnesses simultaneously (opencode, vibe, potentially future harnesses)
- Versioning and update mechanisms for `.aifact/` are out of scope for this story

### Validation requirements

- Each core workflow in `.aifact/workflows/` must be human-readable and understandable without harness context
- Harness implementations must refer to and follow the core workflows, using relative paths from `.aifact/harnesses/{harness}/` to `.aifact/workflows/`
- The pointer activation pattern must work: copying `.aifact/`, running the init script, and verifying harness discovery should produce a working setup
- Existing `.opencode/` and `.vibe/` workflows must continue to work unchanged

## Acceptance Criteria

- [ ] `.aifact/` directory exists at repository root with README.md
- [ ] `.aifact/workflows/` contains core workflow definitions for at least the Foundation group:
  - [ ] `record-story.md`
  - [ ] `create-guideline.md`
  - [ ] `commit.md`
  - [ ] `refresh-project-config.md`
- [ ] `.aifact/harnesses/opencode/` contains full opencode implementations that reference core workflows
- [ ] `.aifact/harnesses/vibe/` contains full vibe implementations that reference core workflows
- [ ] Core workflow files use pure narrative markdown format without tool calls
- [ ] Harness files reference core workflows and add harness-specific adaptations
- [ ] Documentation in `.aifact/README.md` explains the structure and usage pattern
- [ ] Existing `.opencode/`, `.vibe/`, and `work/` files remain unchanged and functional
- [ ] Activation test: copying `.aifact/` to a test project, running the init script, and verifying harness discovery works correctly

---

## Analysis

### Likely Impact

- Primary implementation lane: `.aifact/` directory creation -> `.aifact/workflows/` core definitions -> `.aifact/harnesses/{opencode,vibe}/` implementations -> `.aifact/init` activation script -> `.aifact/README.md` documentation
- `.aifact/` - New root directory for the framework (verified: does not exist yet)
- `.aifact/workflows/*.md` - Core workflow definitions in pure narrative markdown (10 files specified)
- `.aifact/harnesses/opencode/` - Full opencode harness implementation directory structure
- `.aifact/harnesses/vibe/` - Full vibe harness implementation directory structure
- `.aifact/init` - Activation script for generating harness-specific pointer files
- `.aifact/README.md` - Human-oriented documentation explaining structure and usage

### Possible Adjacent Touchpoints

- `.opencode/agent/**/*`, `.opencode/commands/**/*`, `.opencode/skills/**/*` - Existing opencode harness files that serve as source material for `.aifact/harnesses/opencode/` (must not be modified per constraint)
- `.vibe/skills/**/SKILL.md` - Existing vibe harness files that serve as source material for `.aifact/harnesses/vibe/` (must not be modified per constraint)

### Existing Patterns / Prior Art

- `.opencode/agent/brainstorm.md` and `.vibe/skills/brainstorm/SKILL.md` - Example of duplicated workflow logic across harnesses; demonstrates the need for core workflow extraction
- `.opencode/custom/init/init.sh` - Existing bootstrap pattern; `.aifact/init` should follow similar user-prompt-before-overwrite behavior
- Directory structures: `.opencode/agent/`, `.opencode/commands/`, `.opencode/skills/` for opencode; `.vibe/skills/{skill-name}/SKILL.md` for vibe

### Layer Boundaries

- Touch first: `.aifact/` directory structure and core workflow files
- Avoid unless evidence emerges: Any modifications to existing `.opencode/` or `.vibe/` files (explicit constraint in story)

### Verification Plan

**Unit Tests**:
- Verify each core workflow file in `.aifact/workflows/` is pure narrative markdown without tool calls
- Verify harness files reference core workflows using relative paths

**Integration Tests**:
- Verify `.aifact/harnesses/opencode/` contains complete, working implementations
- Verify `.aifact/harnesses/vibe/` contains complete, working implementations

**E2E / Manual Validation**:
- Copy `.aifact/` to a test project and run init script
- Verify harness discovery works correctly for both opencode and vibe
- Verify existing `.opencode/` and `.vibe/` workflows remain unchanged and functional

**Additional Checks (as applicable)**:
- Verify backward compatibility: existing workflows continue to work unchanged

## Implementation update (2026-06-26 00:00)

- Addressed: All acceptance criteria implemented
  - `.aifact/` directory created with README.md
  - 10 core workflow definitions created in `.aifact/workflows/`
  - Full opencode implementations in `.aifact/harnesses/opencode/`
  - Full vibe implementations in `.aifact/harnesses/vibe/`
  - Core workflows use pure narrative markdown format
  - Harness files reference core workflows with relative paths
  - Documentation explains structure and usage pattern
  - Existing `.opencode/`, `.vibe/`, and `work/` files remain unchanged
  - Activation script `.aifact/init` created and tested
- Not addressed: None
- Status: done
