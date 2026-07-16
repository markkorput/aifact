# Create Story

## Purpose

Create a new user story artifact in the backlog for trackable work items. This workflow captures the user's request as a durable, actionable story that can be analyzed, implemented, reviewed, and validated.

## Core Steps

1. Capture the user request as a story title
2. Generate a unique story ID with format `<PREFIX>-<NUMBER>` where PREFIX is 2-3 uppercase letters and NUMBER is 4+ digits. Discover prefix from existing stories (default to most recent), prompt user if empty repo with suggestions from project folder name, allow explicit override. NUMBER is globally sequential derived from existing stories (max + 1).
3. Extract the core user need from the request
4. Structure the story with standard sections: Context, Functional Requirements, Technical Requirements, Acceptance Criteria
5. Place the story in the appropriate backlog directory based on its state
6. Return the created story path and ID for user reference

## Constraints

- Story ID must be unique within the backlog
- Story must contain a clear title that describes the user need
- Story must be placed in a valid backlog directory (backlog, planned, in-progress, done)
- Story file name must follow the pattern: `<ID>-<YYYY-MM-DD>-<slugified-title>.md` where YYYY-MM-DD is the creation date
- Do not modify existing stories
- Do not auto-start stories (moving to in-progress requires explicit action)

## Output Contract

- A new markdown file in the appropriate `work/stories/<state>/` directory
- Story file contains: title, Type, Context, Functional Requirements, Technical Requirements, Acceptance Criteria
- Return the absolute path to the created story file
- Return the story ID
