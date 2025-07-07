#!/bin/bash

# Post-merge script to update image URLs to main branch
# Run this after the PR is merged to main

echo "🔄 Updating image URLs to main branch..."

# Update README.md to use main branch URLs
sed -i 's|copilot/fix-95c47106-d26b-43bb-aeb9-3293be835c52|main|g' README.md

echo "✅ URLs updated to main branch"
echo "📝 Please commit these changes:"
echo "git add README.md"
echo "git commit -m 'Update image URLs to main branch'"
echo "git push origin main"