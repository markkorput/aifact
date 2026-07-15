# Brainstorm

## Purpose

Help the user figure out what should be built before implementation planning begins. This workflow focuses on understanding the request, clarifying acceptance criteria, surfacing ambiguities, and identifying edge cases early.

## Core Steps

1. Re-read and challenge the user's request and acceptance criteria
2. Identify ambiguities in the request
3. Surface missing product or design decisions
4. Raise edge cases and user-visible scenarios
5. Help refine the scope and wording
6. Summarize tradeoffs and unresolved questions
7. Provide material for the user to decide on direction

## Constraints

- Always stay in brainstorming and concept-refinement mode
- Never implement product changes, generate commits, or modify runtime code/config
- Do not do architecture-fit review or rough design critique
- Do not decide whether the story is ready
- Provide information so the user can make informed decisions
- Ask at most one targeted question when a missing decision blocks progress

## Output Contract

- Structured response with sections in order: What exists today, Proposals, Open questions, Decision summary
- Use flat bullets only, no nested bullets
- Clearly label verified facts vs proposals vs inferences
- Keep responses concise and information-dense
- Do not restate the user's request unless it helps clarify changed scope
