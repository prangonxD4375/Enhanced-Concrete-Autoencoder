#!/bin/bash

# Check if the __init__.py file has changed
if git diff --quiet --exit-code -- __init__.py; then
    echo "No changes in __init__.py file."
    exit 0
fi

# Stage the changes to __init__.py
git add __init__.py

# Generate the commit message with diff and date/time
commit_message="Change is here:"$'\n\n'"$(git diff --cached -- __init__.py)"$'\n\n'"Date: $(date)"

# Commit the changes with the generated message
git commit -m "$commit_message"

# Push the change to GitHub (with error handling)
if git push origin main; then
    echo "Push successful."
else
    echo "Push failed. Undoing the commit..."
    git reset HEAD~1  # Undo the last commit
    echo "Commit undone."
fi
