# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repository Contains

This repository contains an **Agent Skill** and **Subagent** for Claude Code called `building-apple-platform-products`.

- **Skill**: Teaches Claude the xcodebuild and swift build command patterns (reference documentation)
- **Agent**: Executes build commands autonomously, discovering schemes and destinations as needed

## Repository Structure

```
skills/
└── building-apple-platform-products/
    ├── SKILL.md          # Entry point with YAML frontmatter
    └── references/       # Detailed documentation loaded on-demand

agents/
└── apple-platform-builder.md   # Autonomous build executor
```

**Skill components**:
- **SKILL.md**: Quick reference tables and links to reference files
- **references/**: Progressive disclosure—Claude loads these only when needed

**Agent**: Discovers project structure, constructs correct commands, executes autonomously

## Key Design Principles

1. **Reference manual style**: Use tables and clear categories, not decision trees
2. **Standalone Swift packages only**: `swift build`/`swift test` do NOT work for Swift Package Manager submodules in Xcode projects—must use `xcodebuild` with the appropriate scheme
3. **Simulator name volatility**: Device names change with Xcode releases; always document `xcrun simctl list devices available`
4. **No code signing complexity**: Scope is Build, Test & Archive; distribution/signing is out of scope

## File Organization

Every reference file follows this structure:

1. **Title** — H1 with one-line purpose
2. **Important note** — `**Important**:` callout for critical constraints
3. **Core content** — Topic-specific sections
4. **Quick Reference** — Table with Goal | Command columns
5. **Complete Example** — Minimal example + Full CI example
6. **Troubleshooting** — Cause/Solution format for topic-specific errors

Conventions:
- Emphasis markers use `**Keyword**:` format (e.g., `**Important**:`, `**Cause**:`)
- Tables use Goal | Command format (what you want → how to get it)
- Code blocks have no trailing blank lines
- `troubleshooting.md` is an index pointing to other files' Troubleshooting sections

## Installation

```bash
# Install skill (reference documentation)
cp -r skills/building-apple-platform-products ~/.claude/skills/

# Install agent (autonomous executor)
cp agents/apple-platform-builder.md ~/.claude/agents/
```
