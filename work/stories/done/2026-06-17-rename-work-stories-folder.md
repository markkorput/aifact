# Rename Work Stories Folder

## Type

chore

## Context

The workflow previously stored story state under a backlog-named root. The repository now uses `work/stories/` as the story-state root so the durable artifact location is named for the artifact type rather than the workflow queue.

## Functional Requirements

- Move existing story-state directories from the old backlog-named root to `work/stories/`.
- Update human-facing documentation and repo guidance to reference `work/stories/`.
- Keep existing story lifecycle subfolders (`backlog`, `planned`, `in-progress`, and `done`) intact under the new root.

## Technical Requirements

- Preserve existing tracked story artifacts and `.gitkeep` files through the folder move.
- Update `AGENTS.md`, `docs/`, and `work/project-config.md` so workflow documentation points to the renamed story folder.
- Update existing moved story content that referenced the old done-story path.
- Verify no remaining old story-root path references exist in the repository.

## Acceptance Criteria

- `work/stories/` contains the expected story-state subfolders.
- The old story root no longer exists.
- Repository references to the old story-root path are removed.
- The change is committed on a non-main branch with a concise Conventional Commit message.
