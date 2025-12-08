#!/bin/bash
set -euo pipefail

# Release script for Apple Platform Build Tools Claude Code Plugin
#
# Usage: ./scripts/release.sh <version>
# Example: ./scripts/release.sh 1.0.1

if [ $# -ne 1 ]; then
    echo "Usage: $0 <version>"
    echo "Example: $0 1.0.1"
    exit 1
fi

VERSION="$1"
MARKETPLACE_JSON=".claude-plugin/marketplace.json"

# Validate version format (basic semver)
if ! [[ "$VERSION" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Error: Version must be in format X.Y.Z (e.g., 1.0.1)"
    exit 1
fi

# Check for uncommitted changes
if ! git diff --quiet || ! git diff --cached --quiet; then
    echo "Error: You have uncommitted changes. Please commit or stash them first."
    exit 1
fi

# Check we're on main branch
BRANCH=$(git branch --show-current)
if [ "$BRANCH" != "main" ]; then
    echo "Warning: You're on branch '$BRANCH', not 'main'. Continue? (y/N)"
    read -r response
    if [[ ! "$response" =~ ^[Yy]$ ]]; then
        exit 1
    fi
fi

# Update version in marketplace.json
echo "Updating version to $VERSION in $MARKETPLACE_JSON..."
sed -i '' "s/\"version\": \"[^\"]*\"/\"version\": \"$VERSION\"/" "$MARKETPLACE_JSON"

# Commit
echo "Committing..."
git add "$MARKETPLACE_JSON"
git commit -m "Release $VERSION"

# Tag
echo "Creating tag $VERSION..."
git tag "$VERSION"

# Push
echo "Pushing to origin..."
git push
git push --tags

echo ""
echo "Released $VERSION"
echo "GitHub Action will create the release at:"
echo "https://github.com/kylehughes/apple-platform-build-tools-claude-code-plugin/releases/tag/$VERSION"
