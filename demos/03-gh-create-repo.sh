#!/bin/bash

# -----------------------------------------------------------------------------
# Script Name: 03-gh-create-repo.sh
#
# Description:
#   This script initializes environment variables from a .env file, deletes any
#   existing GitHub repository with the specified name, and then creates a new
#   public repository using the GitHub CLI (`gh`).
#
# Usage:
#   Ensure a .env file exists in the same directory with the variable REPO_NAME
#   set to the desired repository name.
#
#   Example .env:
#     REPO_NAME=my-new-repo
#
#   Run the script:
#     ./03-gh-create-repo.sh
#
# Requirements:
#   - GitHub CLI (`gh`) must be installed and authenticated.
#   - The .env file must be present and contain the REPO_NAME variable.
# -----------------------------------------------------------------------------

# Source the utility functions
source _utils.sh

#######################################################
### 1. Initialize repo context. 
#######################################################
ghlab_delete_repo_if_exists 

#######################################################
### 2. Initialize repo context. 
###    This function is set in _utils.sh
#######################################################

ghlab_repo_init
