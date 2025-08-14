#!/bin/bash

# -----------------------------------------------------------------------------
# Script Name: 01-gh-login.sh
#
# Description:
#   This script performs authentication with GitHub using the GitHub CLI (`gh`).
#   It logs in to GitHub and refreshes authentication with the required scope
#   for deleting repositories.
#
# Usage:
#   Run the script directly:
#     ./01-gh-login.sh
#
# Requirements:
#   - GitHub CLI (`gh`) must be installed and authenticated.
# -----------------------------------------------------------------------------

# Perform gh login and authenticate
gh auth login
gh auth refresh -h github.com -s delete_repo -s admin:ssh_signing_key

