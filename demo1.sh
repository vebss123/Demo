#!/bin/bash

# Set your GitHub and CodeCommit repository URLs
GITHUB_REPO_URL="https://github.com/vebss123/Demo.git"
CODECOMMIT_REPO_URL="https://git-codecommit.us-east-1.amazonaws.com/v1/repos/DemoRepo"

# Clone the GitHub repository
git clone "$GITHUB_REPO_URL" temp_repo
cd temp_repo

# Configure Git to push to the CodeCommit repository
git remote add codecommit "$CODECOMMIT_REPO_URL"

# Fetch the latest changes from GitHub
git fetch origin


# Get the name of the branch that was pushed
BRANCH=$(git rev-parse --symbolic --abbrev-ref $1)

echo "Branch name: $BRANCH"


# Push the changes to CodeCommit
git push codecommit "$BRANCH"

# Clean up temporary repository
cd ..
rm -rf temp_repo

