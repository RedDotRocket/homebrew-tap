# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Homebrew tap repository for the AgentUp tool, a Python-based application for building and deploying AI agents. The repository contains a single Homebrew formula that packages and installs AgentUp via Homebrew.

## Repository Structure

```
homebrew-tap/
├── Formula/
│   └── agentup.rb          # Homebrew formula for AgentUp
├── .github/workflows/      # CI/CD automation
│   ├── tests.yml          # Test bot for formula validation
│   └── publish.yml        # Auto-merge workflow for releases
└── README.md              # Standard tap installation instructions
```

## Core Architecture

This is a standard Homebrew tap repository with:

- **Formula Definition**: `Formula/agentup.rb` defines the AgentUp package installation
- **Python Virtualenv**: Uses Homebrew's Python virtualenv integration for isolated installation
- **CI/CD Pipeline**: Automated testing across macOS and Ubuntu using `brew test-bot`
- **Auto-publishing**: PR-based workflow for formula updates using `brew pr-pull`

## Development Commands

### Testing Formula Changes
```bash
# Validate formula syntax
brew test-bot --only-tap-syntax

# Test formula installation locally
brew install --build-from-source ./Formula/agentup.rb

# Test the installed formula
brew test agentup

# Audit formula for issues
brew audit --strict --online agentup
```

### Local Development
```bash
# Tap this repository locally
brew tap reddotrocket/agentup

# Install from local tap
brew install agentup

# Uninstall for testing
brew uninstall agentup
brew untap reddotrocket/agentup
```

### CI/CD Workflow
- **Testing**: GitHub Actions runs `brew test-bot` on PRs across macOS 13, macOS 15, and Ubuntu 22.04
- **Publishing**: PRs labeled with `pr-pull` trigger automatic merge via `brew pr-pull`
- **Bottles**: Binary bottles are built and uploaded for supported platforms

## Formula Maintenance

The AgentUp formula:
- Installs from PyPI source distribution (`agentup-0.3.0.tar.gz`)
- Requires Python 3.11
- Uses SHA256 verification for package integrity
- Includes basic smoke test (`agentup --help`)

When updating the formula:
1. Update the `url` to point to the new version
2. Update the `sha256` hash for the new package
3. Test locally before submitting PR
4. CI will validate across all supported platforms