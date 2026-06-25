---
description: Initialize AiFact framework in a project by creating pointer files.
agent: init
mode: all
model: openai/gpt-5.5
---

# Init for AiFact

> **Core Workflow**: Framework initialization (see README.md)

**Arguments:** (none - uses .aifact/init script)

Initialize AiFact framework by creating harness-specific pointer files.

## Hard Constraints (OpenCode-specific)

- Requires .aifact/ directory to exist
- Pointer files reference implementations within .aifact/harnesses/
- Must prompt user before overwriting existing files
- File system writes limited to pointer file locations

## Execution

Run `.aifact/init opencode` to create OpenCode pointer files.
