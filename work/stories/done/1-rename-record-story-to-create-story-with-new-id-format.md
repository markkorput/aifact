# Rename record-story workflow and skill to create-story with new ID format

**Type**: chore

## Context
The current `record-story` workflow and Vibe skill need to be renamed to `create-story` to better reflect their purpose (creating stories rather than just recording them). Additionally, the story ID format should be standardized to `XX[X]-DDDD` (2-3 letter prefix followed by a 4-digit number) for consistency and traceability across the project.

## Functional Requirements
- Rename `.aifact/workflows/record-story.md` to `.aifact/workflows/create-story.md`
- Rename `.vibe/skills/record-story/` directory to `.vibe/skills/create-story/`
- Update the skill name in `SKILL.md` metadata from `record-story` to `create-story`
- Update all cross-references in `work/project-config.md` and any other files referencing `record-story`
- Implement new ID format: `<PREFIX>-<NUMBER>` where prefix is 2-3 uppercase letters and number is 4+ digits

## Technical Requirements
- Prefix discovery: Auto-detect project prefix from existing stories, default to most recent story's prefix
- Empty repository: Prompt user for prefix, suggest 2-letter and 3-letter options based on project folder name
- Prefix override: Allow user to explicitly specify a prefix
- Number assignment: Global sequential numbering derived from existing stories (find max number + 1)
- Case handling: Normalize all prefixes to uppercase
- Filename pattern: `<ID>-<YYYY-MM-DD>-<slug>.md` (includes creation date)
- Date source: Use current date when creating new stories

## Acceptance Criteria
- [ ] All `record-story` references are updated to `create-story` in workflows and skills
- [ ] New story IDs follow the `XX[X]-DDDD` format (extending to more digits as needed)
- [ ] Prefix auto-discovery works correctly from existing stories
- [ ] Empty repository flow prompts user with suggested prefixes
- [ ] User can override the default prefix
- [ ] Sequential numbering derives from existing stories without persistent counter
- [ ] All story filenames include creation date in `YYYY-MM-DD` format
- [ ] All existing cross-references are updated (project-config.md, etc.)

---

## Analysis

### Primary Implementation Lane
Rename and refactor the story creation workflow/skill from `record-story` to `create-story`, and implement the new ID format with date-stamped filenames.

### Execution Paths
- Vibe skill loading (`/.vibe/skills/`) — must find `create-story` after rename
- Story creation invocation — users will call `/create-story` instead of `/record-story`
- Story file generation — new filename pattern `<ID>-<YYYY-MM-DD>-<slug>.md` affects how stories are stored and discovered
- Prefix discovery — new logic scans existing stories to determine project prefix

### File Touchpoints with Line-Level Evidence
| File | Line | Current | Change |
|------|------|---------|--------|
| `.aifact/workflows/record-story.md` | 1 | `# Record Story` | Rename file to `create-story.md`, update title to `# Create Story` |
| `.aifact/workflows/record-story.md` | 10 | Generate a unique story ID following project conventions | Update to specify `XX[X]-<N>` format with prefix discovery and date in filename |
| `.aifact/workflows/record-story.md` | 21 | `<ID>-<slugified-title>.md` | Update to `<ID>-<YYYY-MM-DD>-<slug>.md` |
| `.vibe/skills/record-story/SKILL.md` | 2 | `name: record-story` | Rename directory and file to `create-story/`, update to `name: create-story` |
| `.vibe/skills/record-story/SKILL.md` | 3,15 | Description and text references to `record-story` | Update all to `create-story` |
| `.vibe/skills/record-story/SKILL.md` | 13 | Core workflow reference `.aifact/workflows/record-story.md` | Update to `.aifact/workflows/create-story.md` |
| `work/project-config.md` | 16 | List includes `record-story` | Replace with `create-story` |
| `work/project-config.md` | 17 | List includes `record-story` | Replace with `create-story` |

### Adjacent Touchpoints Worth Defending
- `.aifact/workflows/create-guideline.md` — uses `GL-<ID>` pattern, unrelated to story IDs
- `.aifact/workflows/story-start.md` — references story files by path, not by creation mechanism
- `.aifact/workflows/story-analyzer.md` — analyzes existing stories, agnostic to ID format
- `.vibe/skills/create-guideline/` — separate skill, no dependency on record-story

### Boundaries
- **Do not modify**: Existing stories in `work/stories/**/` (per record-story constraint)
- **Do not change**: Other workflow/skill files except to update `record-story` references
- **Preserve**: Core story creation behavior (capture request, generate ID, structure story)
- **Isolate**: ID format logic to create-story workflow/skill only

---

## Implementation Notes

### Changes Made (commit cd85f13)

**Renamed files:**
- `.aifact/workflows/record-story.md` → `.aifact/workflows/create-story.md`
- `.vibe/skills/record-story/SKILL.md` → `.vibe/skills/create-story/SKILL.md`

**Updated workflow (.aifact/workflows/create-story.md):**
- Title: `# Record Story` → `# Create Story`
- Step 2: Updated ID generation to specify `<PREFIX>-<NUMBER>` format with prefix discovery rules and global sequential numbering
- Constraint: Updated filename pattern from `<ID>-<slugified-title>.md` to `<ID>-<YYYY-MM-DD>-<slugified-title>.md`

**Updated skill (.vibe/skills/create-story/SKILL.md):**
- Metadata: `name: record-story` → `name: create-story`
- Description: Updated to reference new ID format and date-stamped filename
- Core workflow reference: Updated to `.aifact/workflows/create-story.md`
- Added `bash` to allowed-tools for filesystem operations
- Added Implementation Details section with algorithms for prefix discovery, override, number assignment, date, ID format, and filename pattern

**Updated project-config.md:**
- Lines 16-17: Replaced all `record-story` references with `create-story`

### Verification
- All 8 touchpoints from Analysis have been addressed
- No modifications to existing stories in `work/stories/**/`
- Other workflows/skills unchanged except reference updates
- Core story creation behavior preserved
