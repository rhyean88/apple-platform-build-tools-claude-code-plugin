# Apple Platform Build Tools Claude Code Plugin

[![Agent Skill](https://img.shields.io/badge/Claude_Code_Plugin-555?logo=claude)](https://code.claude.com/docs/en/plugins)
[![Latest Release](https://img.shields.io/github/v/release/kylehughes/apple-platform-build-tools-claude-code-plugin)](https://github.com/kylehughes/apple-platform-build-tools-claude-code-plugin/releases)

*Build, test, and archive Swift packages and Xcode projects for Apple platforms with Claude Code.*

## About

Apple Platform Build Tools Claude Plugin is a Claude Code plugin containing an Agent Skill and a Subagent for building Apple platform products.

- **Agent Skill**: Reference documentation for `xcodebuild` and `swift build` command patterns.
- **Subagent**: Autonomous executor that discovers schemes, runs builds, and returns concise results. Uses the Agent Skill.

## Usage

The Subagent is useful for delegating build and test commands from your main programming agent. It can report the results of these commands without exposing the build logs. This keeps the main agent on track and prevents its context window from being polluted.

The Agent Skill is useful for understanding `xcodebuild` and `swift` options, debugging build failures, or constructing complex commands manually or by an agent when more control is needed than the Subagent provides.

### Automatic

The Agent Skill and Subagent are both exposed to Claude Code, along with descriptions about when to use them. Theoretically, Claude should know to read the Agent Skill when composing a complex `xcodebuild` command, or to invoke the Subagent when a build needs to be run. This is nondeterministic in practice and may change with Claude models and Claude Code versions.

### Manual

To explicitly invoke the Agent Skill or Subagent, use natural language in Claude Code.

e.g.

> use the builder agent to build the app

> check with the builder agent that the tests pass

> use the build skill to help me write an xcodebuild command for CI

## What's Included

### Agent Skill: `building-apple-platform-products`

Quick-reference tables and detailed documentation for:

- Project discovery (schemes, targets, configurations)
- Swift Package Manager commands
- `xcodebuild` commands (build, test, archive)
- Destination specifiers for all Apple platforms
- Test filtering, parallel execution, coverage
- CI configuration and code signing
- Troubleshooting common errors

### Subagent: `apple-platform-builder`

Autonomous build executor that:

- Discovers project structure automatically
- Constructs correct commands for the project type
- Handles errors using troubleshooting guidance
- Returns success/failure with only relevant details
- Uses the `building-apple-platform-products` skill

## Installation

### Claude Code

#### Personal Usage

To install this plugin for your personal use in Claude Code:

1. Add the marketplace:
   ```bash
   /plugin marketplace add kylehughes/apple-platform-build-tools-claude-code-plugin
   ```

2. Install the plugin:
   ```bash
   /plugin install apple-platform-build-tools@apple-platform-build-tools-claude-code-plugin
   ```

#### Project Configuration

To automatically provide this plugin to everyone working in a repository, configure the repository's `.claude/settings.json`:

```json
{
  "enabledPlugins": {
    "apple-platform-build-tools@apple-platform-build-tools-claude-code-plugin": true
  },
  "extraKnownMarketplaces": {
    "apple-platform-build-tools-claude-code-plugin": {
      "source": {
        "source": "github",
        "repo": "kylehughes/apple-platform-build-tools-claude-code-plugin"
      }
    }
  }
}
```

When team members open the project, Claude Code will prompt them to install the plugin.

### Manual Installation

The raw Agent Skill and Subagent content is available in this repository's `skills/` and `agents/` directories.

## Contributions

Apple Platform Build Tools Claude Code Plugin is not accepting source contributions at this time. Bug reports will be considered.

## Author

[Kyle Hughes](https://kylehugh.es)

[![Bluesky][bluesky_image]][bluesky_url]  
[![LinkedIn][linkedin_image]][linkedin_url]  
[![Mastodon][mastodon_image]][mastodon_url]

[bluesky_image]: https://img.shields.io/badge/Bluesky-0285FF?logo=bluesky&logoColor=fff
[bluesky_url]: https://bsky.app/profile/kylehugh.es
[linkedin_image]: https://img.shields.io/badge/LinkedIn-0A66C2?logo=linkedin&logoColor=fff
[linkedin_url]: https://www.linkedin.com/in/kyle-hughes
[mastodon_image]: https://img.shields.io/mastodon/follow/109356914477272810?domain=https%3A%2F%2Fmister.computer&style=social
[mastodon_url]: https://mister.computer/@kyle

## License

Apple Platform Build Tools Claude Code Plugin is available under the **MIT License**. See `LICENSE` for details.
