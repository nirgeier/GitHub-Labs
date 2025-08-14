#!/bin/bash

# -----------------------------------------------------------------------------
# Script Name: 05-create-pr.sh
#
# Description:
#   Automates the process of creating a pull request on GitHub using the GitHub
#   CLI (`gh`) and API, without any local git operations. The script:
#     - Loads environment variables from a .env file (expects REPO_NAME).
#     - Checks authentication and repository existence.
#     - Resolves the default branch.
#     - Creates a remote feature branch from the default branch.
#     - Adds or updates three text files with random content via the GitHub
#       Contents API (each file is a separate commit).
#     - Opens a pull request from the feature branch to the default branch.
#
# Usage:
#   1. Ensure you are authenticated with `gh auth login`.
#   2. Set REPO_NAME in a `.env` file in the same directory.
#   3. Run this script: `bash 05-create-pr.sh`
#
# Requirements:
#   - GitHub CLI (`gh`) installed and authenticated.
#   - The target repository must exist under your GitHub account.
#
# Notes:
#   - No local git operations are performed; all actions use the GitHub API.
#   - If the files already exist, they will be updated.
#   - If the pull request already exists, its URL will be displayed.
# -----------------------------------------------------------------------------

# Task 05 - Create PR using GitHub CLI (gh) ONLY (no local git operations)
# Creates a feature branch, adds files with random content via GitHub API, and opens a PR.

# Source the utility functions
source _utils.sh

#######################################################
### 1. Initialize repo context. 
###    This function is set in _utils.sh
#######################################################

ghlab_repo_init

#######################################################
### 2. Create feature branch 
#######################################################
PR_BRANCH="feature/add-content-1"
ghlab_create_branches "$PR_BRANCH" || exit 1

#######################################################
### 3. Add files via GitHub Contents API 
#######################################################
ghlab_add_random_files_to_branch "$PR_BRANCH" 3

#######################################################
# 4. Create Pull Request via API
#######################################################

# PR data
PR_TITLE="Add random text files"
PR_BODY="This PR adds three files with random text for demonstration (created entirely via gh api)."
ghlab_create_pull_request "$PR_BRANCH" "$PR_TITLE" "$PR_BODY"

echo -e "${GREEN}✅ PR Created. Feature branch: $PR_BRANCH, Target Branch: $DEFAULT_BRANCH${NO_COLOR}"
