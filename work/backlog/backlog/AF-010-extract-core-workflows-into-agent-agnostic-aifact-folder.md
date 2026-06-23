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
- Supports activation via symlinking the desired harness folder to the project root

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
   └── README.md
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
   - Symlink the desired harness: `ln -s .aifact/harnesses/opencode .opencode`
   - Optionally symlink or copy AGENTS.md: `ln -s .aifact/AGENTS.md .`

### Decisions with rationale

1. **Location: `.aifact/` at repository root**
   - Rationale: Creates clear separation from legacy harness implementations; explicitly names the framework; enables portability; both harnesses can easily discover and reference it
   - Alternatives considered: `work/workflows/` (blurs artifact/definition boundary), `.shared/` (new convention without clear purpose)

2. **Abstraction level: Tool-agnostic core workflows**
   - Rationale: Maximizes reusability across harnesses; core workflows describe intent not implementation; harness adapters handle tool-specific details
   - Alternatives considered: Shallow sharing (minimal benefit), Deep sharing (too rigid)

3. **Reference mechanism: Direct reference**
   - Rationale: Simplest approach; harness files point to core workflows and add their own adaptations; no build step or preprocessing required
   - Alternatives considered: Include directives (requires preprocessing), Generative approach (complex build system), Manual sync (reintroduces duplication)

4. **Backward compatibility: Additive strategy**
   - Rationale: Zero risk to existing workflows; clear distinction between framework development (`.aifact/`) and current usage (`.opencode/`, `.vibe/`, `work/`); allows parallel development and testing
   - Alternatives considered: Gradual migration (complex transition), Big Bang (high risk)

5. **Core workflow format: Pure narrative markdown (Option A)**
   - Rationale: Most readable and maintainable; harness files can add their own structure; keeps core workflows as human-readable specifications
   - Alternatives considered: Structured frontmatter (unnecessary complexity), YAML+Markdown hybrid (over-engineered)

6. **Harness folder contents: Full implementations**
   - Rationale: Enables `.aifact/` to be self-contained and portable; each harness folder contains everything needed for that harness to work; supports the symlink activation pattern
   - Alternatives considered: Adapter-only files (would require existing harness files to reference `.aifact/`, complicating the portability goal)

### Rejected alternatives

- **Modifying existing `.opencode/` or `.vibe/` files**: Too risky; breaks current usage; hard to test
- **Shared includes directory**: More granular but harder to maintain consistency; doesn't solve the portability goal as cleanly
- **Workflow DSL (YAML/JSON)**: More structured but requires new tooling and learning curve; markdown is sufficient
- **Standardizing on one tool name set**: Would require changing one harness's conventions; better to let each harness use its native tool names

### Constraints

- Do not modify any existing files in `.opencode/`, `.vibe/`, or `work/`
- Core workflows must be completely harness-agnostic (no tool calls, no harness-specific metadata)
- Harness implementations must be self-contained and workable via symlink
- The solution must support multiple harnesses simultaneously (opencode, vibe, potentially future harnesses)

### Validation requirements

- Each core workflow in `.aifact/workflows/` must be human-readable and understandable without harness context
- Each harness implementation must correctly reference its corresponding core workflow
- The symlink activation pattern must work: copying `.aifact/` and symlinking a harness folder should produce a working setup
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
- [ ] Symlink activation test: copying `.aifact/` to a test project and symlinking a harness folder works correctly

---

## Review findings (2026-06-24)

### Architecture fit concerns

- **Harness discovery problem**: Symlink activation pattern creates circular dependency. Harness files in `.aifact/harnesses/opencode/` need to reference core workflows in `.aifact/workflows/`, but after symlinking `.aifact/harnesses/opencode` to `.opencode`, relative paths like `../../workflows/` would be needed, which breaks portability.
- **Constraint violation risk**: Symlinking harness folders to project root would overwrite existing `.opencode/` and `.vibe/` directories, violating the "do not modify any existing files" constraint (line 121).
- **Portability vs. existing state**: Existing projects have `.opencode/` and `.vibe/` folders. Symlink activation pattern requires replacing existing directories with symlinks, which is destructive, not additive.

### Failure modes

- **Symlink activation failure**: If user symlinks `.aifact/harnesses/opencode` to `.opencode`, existing `.opencode/` directory (with `node_modules/`, `package.json`, etc.) would be obscured. Story doesn't specify whether harness folders include supporting infrastructure.
- **Reference integrity failure**: Core workflows use pure narrative markdown. Harness implementations need to reference these, but story doesn't specify the mechanism. Relative paths would break when `.aifact/` is copied or symlinked.
- **Version drift**: Existing `.opencode/` files remain unchanged (backward compatibility), but new harness files in `.aifact/` could evolve separately, creating two sources of truth.

### Hidden complexity

- **Harness folder completeness**: Structure shows only workflow files in harness folders (lines 49-64), but real harnesses need infrastructure (`node_modules/`, `scripts/`, `custom/init/`). Gap not addressed.
- **AGENTS.md symlink conflict**: Story suggests symlinking AGENTS.md (line 84), but repo root already has `AGENTS.md`. This would overwrite it.
- **README.md symlink**: Repo already has `README.md -> .opencode/custom/init/README.md`. New structure doesn't specify how this is handled.

### Simpler approaches

- Git submodules instead of copying `.aifact/` into projects would preserve versioning and updates.
- Include directives (preprocessor-based) could inject harness-specific sections into core workflows, though story rejects preprocessing (line 97).
- Start with Foundation group only (4 workflows per lines 136-140) instead of all 9 workflows.

### Open questions

1. How do harness files reference core workflows? Relative paths break with symlinks, absolute paths aren't portable.
2. What happens to existing harness infrastructure (`node_modules/`, `scripts/`, `custom/init/`)?
3. How is the AGENTS.md conflict resolved when symlinking?
4. How is the README.md symlink handled with the new structure?

### Suggested story revisions

- Clarify reference mechanism between harness files and core workflows (relative paths won't work with symlinks)
- Address conflict between symlink activation and existing `.opencode/`/`.vibe/` directories
- Specify whether harness folders include only workflow definitions or full infrastructure
- Remove or clarify the AGENTS.md symlink suggestion which conflicts with existing file
- Clarify README.md handling in new structure
