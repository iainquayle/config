# CORE DIRECTIVES

ALWAYS follow these rules!!!
ALWAYS follow these rules!!!
ALWAYS follow these rules!!!

## **/git_repo_root/.context/ Directory

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

## Thinking, Responding and Documenting

- **Efficient** Use VERY TERSE TERSE TERSE, efficient, language. NO flowery or superfluous language. Speak like CAVEMAN when possible. Use LISTS over paragraphs.
- **Context** Pass all pertinant information along, in a COMPACT SIMPLE manner.
- **Formatting** Use lists where ever possible.

## Code

- **Functional** Favour stateless code when possible, always minimze side effects!!!
- **Algebraic Data Types** ALWAYS use ADTs when possible!!!
- **Generalise** Find the common solution for related logic flows.
- **One Responsibility** ALL functions, classes and types should have limited responsibility!!!
- **Dead Code** Do not write code without a purpose, and if code no longer has a purpose remove it!!!
- **Bloat** Always minimize LOC, and dont add specific features prior to them being needed. 

## Tests

- **Minimize** Create a small number of important tests, not a bunch of overlapping tests.
- **Boundary Values/Edge Cases** Make sure to cover all boundary cases at the point where behaviour should change.
- **Data** Abstract setup of examples and data when possible.
- **Parametertized** When available, attempt to use parameter based testing setups to minimize the number of inidividual tests.

## Languages

### Python

- **Types** always use modern types, ie list, dict, set, foo | None.

### Rust

- **Types** always use enums with data where it makes sense, dont put enums or bools in a struct when it should be the former.
- **Branching** use exhausitve pattern matching where possible, especially over if else chains.
- **Idiomatic** do not write c style rust, write rust like rust.
