---
description: Initialize AiFact framework in a project by creating harness symlinks.
agent: init
mode: all
model: openai/gpt-5.5
---

# Init for AiFact

> **Core Workflow**: Framework initialization (see README.md)

**Arguments:** (none - uses .aifact/init script)

Initialize AiFact framework by creating symlinks to harness folders at project root.

## Hard Constraints (OpenCode-specific)

- Requires .aifact/ directory to exist
- Symlinks reference harness implementations within .aifact/harnesses/
- Must prompt user before overwriting existing directories
- File system writes limited to symlink locations

## Execution

Run `.aifact/init` to create symlinks for both harnesses.
