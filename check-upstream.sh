#!/bin/bash

echo "🔍 Checking for upstream updates..."
echo "================================="

# Fetch latest from upstream
git fetch upstream

echo ""
echo "📊 Your current version vs upstream:"
echo "Your version: $(git log --oneline -1 main)"
echo "Upstream version: $(git log --oneline -1 upstream/main)"

echo ""
echo "📈 New commits in upstream (last 30 days):"
git log upstream/main --oneline --since="30 days ago" | head -10

echo ""
echo "🔄 Commits you have that upstream doesn't:"
git log --oneline main ^upstream/main | head -5

echo ""
echo "⬇️  Commits upstream has that you don't:"
git log --oneline upstream/main ^main | head -5

echo ""
echo "📁 Files that differ between versions:"
git diff --name-only main upstream/main | head -10

echo ""
echo "💡 Next steps:"
echo "  - Review upstream changes above"
echo "  - If you see important updates, follow UPSTREAM_INTEGRATION_GUIDE.md"
echo "  - For emergencies: git cherry-pick <commit-hash>"
echo "  - For full integration: create test branch first"

echo ""
echo "✅ Check complete!"