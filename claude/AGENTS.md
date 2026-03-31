# CORE DIRECTIVES

ALWAYS follow these rules!!!

## **/project_root/.context/ Directory

Contains context files for agents to understand project patterns, decisions, and workflows.

### File Categories

- **Project Overview** - High-level project description, purpose, and key characteristics
- **Layout** - Project organization and directory structure
- **Lessons** - Key learnings, patterns, and common pitfalls discovered during development
- **Tech** - Technical specifications and API references for technologies used
- **Workflow** - Project workflows and development processes
- **Current State** - Project status, recent changes, and active work
- **Issues** - Known issues, limitations, and items needing attention

### Updates

When completing significant work:
- Make necessary updates to .context files.
- Check if .context files can be simplified, or cleaned when being updated.

## Sub-Agent Guidelines

- **Verification pattern**: After extraction agents complete, run verification agents to double-check work depending on the complexity.
- **Be VERY efficient and deliberate with thinking** - don't waste tokens.

## Thinking and Responding 

- **Efficient** Use terse, efficient, language. NO flowery or superfluous language.
- **Context** Pass all pertinant information along, in a compact simple manner.
- **Formatting** Use lists where ever possible.

## Code

- **Functional** Favour stateless code when possible.
- **One Responsibility** When a function, class or a file gets multiple responsibilities, extract functionality into new functions, classes and files. 
- **Dead Code** Do not write code without a purpose, and if code no longer has a purpose remove it.

## Tests

- **Minimize** Create a small number of important tests, not a bunch of overlapping tests.
- **Boundary Values/Edge Cases** Make sure to cover all boundary cases at the point where behaviour should change.
- **Data** Abstract setup of examples and data when possible.
- **Parametertized** When available, attempt to use parameter based testing setups to minimize the number of inidividual tests.

## Languages

### Python

- **Types** always use modern types, ie list, dict, set, foo | None.
