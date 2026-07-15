# Rename work/backlog folder to work/stories

**Type**: chore

## Context
The current `work/backlog` directory name is not aligned with the semantic structure of the repository. Renaming it to `work/stories` better reflects its purpose as the location for all story artifacts (backlog, planned, in-progress, done).

## Functional Requirements
- Rename `work/backlog` directory to `work/stories`
- Maintain all subdirectories (backlog, planned, in-progress, done) under the new parent directory
- Preserve all existing story files and their content
- Update any references to `work/backlog` in documentation, workflows, and configuration files

## Technical Requirements
- Perform the rename operation at the filesystem level
- Ensure git tracks the rename as a move operation (not delete+create)
- Verify all story files remain accessible after the rename
- Update any hardcoded paths in workflow files, skills, and documentation
- Maintain backward compatibility by updating any scripts or tools that reference the old path

## Acceptance Criteria
- [ ] Directory `work/backlog` no longer exists
- [ ] Directory `work/stories` exists with the same subdirectory structure
- [ ] All story files are accessible under the new path
- [ ] Git history preserves the rename as a move operation
- [ ] All cross-references to `work/backlog` are updated to `work/stories`
- [ ] Workflows and skills that reference the backlog path are updated
