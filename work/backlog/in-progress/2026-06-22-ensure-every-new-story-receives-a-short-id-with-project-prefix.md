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
