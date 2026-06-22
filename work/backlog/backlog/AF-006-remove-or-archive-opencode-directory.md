# AF-006 Remove or archive .opencode/ after Vibe parity and stale-reference cleanup

## Type

chore

## Context

The spike recommends deleting `.opencode/` after Vibe parity is proven, rather than keeping it as a long-term alternative. This story removes or archives the opencode workflow surface once all dependencies are replaced and validated. This is the final step in the Vibe replacement process.

## Functional Requirements

- Remove or archive the `.opencode/` directory after Vibe parity is proven
- Ensure no active workflow dependencies remain on `.opencode/` files
- Preserve historical reference if archiving rather than deleting
- Clean up any opencode-specific configuration or references

## Technical Requirements

### Implementation Approach

- Verify completion of all prerequisite stories:
  - AF-002: Core workflow roles replaced
  - AF-003: Command capabilities replaced or retired
  - AF-004: Bootstrap behavior replaced
  - AF-005: Documentation updated
- Run comprehensive stale-reference check:
  - Search for `.opencode`, `opencode`, `@.opencode/`, opencode-specific frontmatter
  - Search for `OpenAI`, `Codex` hardcoded model references
  - Verify no active workflow files depend on opencode
- Decide: delete vs archive
  - Deletion: Clean removal, no historical artifact
  - Archive: Move to `archive/opencode/` or similar for historical reference
- Update git history if archiving (move, don't copy)
- Update any remaining references in configuration files

### Decisions (from spike)

- Recommended fate: **delete** rather than archive
- Rationale: Avoid presenting opencode as a long-term alternative
- If archiving, use explicit archival location with clear exclusion from active workflow

### Constraints

- Do not perform until all prerequisite stories are complete and validated
- Do not perform until stale-reference cleanup is complete (part of AF-005)
- Do not break any existing git history or tags
- Preserve any `.opencode/` content that may have historical or reference value in a clearly marked archive location

## Acceptance Criteria

- `.opencode/` directory is either:
  - Deleted completely, OR
  - Moved to `archive/opencode/` with clear documentation that it's historical only
- No active workflow files reference `.opencode/`
- No active documentation references opencode as an active workflow
- Git history reflects the removal/archival appropriately
- All Vibe workflow files are in place and functional
