# Ensure every new story receives a short ID with project prefix

## Type

feature

## Context

Currently stories are identified only by their date-prefixed filenames (e.g., `2026-06-22-story-title.md`). This makes it difficult to reference stories in discussions, commit messages, and other artifacts. A short ID system similar to Linear's issue IDs (e.g., `PROJ-123`) would improve traceability and make cross-references more concise.

## Functional Requirements

- Every new story recorded must receive a unique short ID at creation time.
- Short ID format must be `<PROJECT_PREFIX>-<SEQUENTIAL_NUMBER>`.
- Project prefix must be configurable with a default value appropriate for AiFact.
- Sequential number must be globally unique across all story directories (`backlog`, `planned`, `in-progress`, `done`).
- Short ID must appear in the story filename for uniqueness.
- Short ID must appear in the story title for human visibility.

## Technical Requirements

- Modify the record-story workflow to generate and assign short IDs automatically.
- Store the sequential counter persistently in a durable location (e.g., `work/.story-counter`).
- Update the story filename format to incorporate the short ID prefix.
- Update the story title to include the short ID.
- Ensure backward compatibility: existing stories without short IDs remain unchanged.
- Only apply short IDs to newly created stories, not retroactively to existing ones.
- Maintain the existing date-based filename component for chronological sorting.

## Acceptance Criteria

- New stories have filenames in format: `<PREFIX>-<NNN>-YYYY-MM-DD-slug.md` (e.g., `AF-001-2026-06-22-story-title.md`).
- New stories have titles in format: `# <PREFIX>-<NNN> <Original Title>` (e.g., `# AF-001 Ensure every new story receives a short ID`).
- The sequential counter increments correctly for each new story regardless of which backlog directory it's saved to.
- No existing stories are modified by this change.
- The counter persists across Vibe sessions.

## Analysis

### Likely Impact

- Primary implementation lane: `.vibe/skills/record-story/SKILL.md` - this skill contains the save rules that generate story filenames and must be modified to incorporate short ID generation.
- `work/.story-counter` or similar - new durable file needed to persist the sequential counter across Vibe sessions.
- Story filename format - will change from `YYYY-MM-DD-<slug>.md` to `<PREFIX>-<NNN>-YYYY-MM-DD-<slug>.md`.
- Story title format - will need to include the short ID prefix.

### Possible Adjacent Touchpoints

- `.opencode/skills/record-story/SKILL.md` - the legacy version has similar save rules; may want to keep consistent if both workflows coexist temporarily.
- Existing stories in `work/backlog/**/*` - must remain unchanged per backward compatibility requirement.

### Existing Patterns / Prior Art

- `.vibe/skills/record-story/SKILL.md` - closest pattern; already implements date-based filename generation that we will extend.
- No existing counter or ID generation mechanism found in the repo.

### Layer Boundaries

- Touch first: `.vibe/skills/record-story/SKILL.md` save rules and template.
- Touch first: Create persistent counter storage (e.g., `work/.story-counter`).
- Avoid unless evidence emerges: retroactively modifying existing stories.
- Avoid unless evidence emerges: changing the overall story artifact format beyond filename and title.

### Verification Plan

**Unit Tests**:

- Verify counter file is created on first story recording.
- Verify counter increments on subsequent story recordings.

**Integration Tests**:

- Verify new story filename includes short ID prefix.
- Verify new story title includes short ID prefix.

**E2E / Manual Validation**:

- Record a new story and verify it receives ID AF-001.
- Record a second story and verify it receives ID AF-002.
- Verify both stories have correct filenames and titles.
- Verify existing stories remain unchanged.

**Additional Checks (as applicable)**:

- Verify counter persists after Vibe session restart.
- Verify short ID uniqueness across all backlog directories.

## Validation update (2026-06-22 21:58)

* Validation passed with no regressions found.
* Gate result: PASS.
* Baseline checks passed or had no unrelated failures observed.
* Touched-scope coverage: no material regression.
* Security review: not applicable.
* Retained exploratory artifacts: work/backlog/backlog/AF-001-2026-06-22-test-short-id-generation.md, work/backlog/backlog/AF-002-2026-06-22-test-short-id-sequential.md, work/.story-counter.
* Validated checklist items: New story filenames include short ID prefix (AF-001, AF-002), new story titles include short ID prefix, counter increments correctly (1->2->3), existing stories remain unchanged, counter file persists at work/.story-counter.
