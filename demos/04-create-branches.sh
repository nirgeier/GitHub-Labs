#!/bin/bash

# -----------------------------------------------------------------------------
# Script Name: 04-create-branches.sh
#
# Description:
#   This script creates multiple branches in a specified GitHub repository using
#   utility functions sourced from _utils.sh. It is intended to automate the
#   process of branch creation for demonstration or testing purposes.
#
# Usage:
#   1. Ensure the _utils.sh script is present and contains the required functions.
#   2. Set up the repository context as needed (e.g., via environment variables).
#   3. Run the script: ./04-create-branches.sh
#
# Requirements:
#   - GitHub CLI (`gh`) must be installed and authenticated.
#   - The _utils.sh script must be available in the same directory.
# -----------------------------------------------------------------------------

# Load utility functions
source _utils.sh

#######################################################
### Create branches
#######################################################
echo -e "${YELLOW}✅ Creating branches in repository $FULL_REPO_NAME..."

ghlab_create_branches \
      feature-branch  \
      bugfix-branch   \
      pr-branch-1     \
      pr-branch-2

echo -e "${GREEN}✅ Branches in repository $FULL_REPO_NAME created successfully."
