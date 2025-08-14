#!/bin/bash

# -----------------------------------------------------------------------------
# Script Name: 06-add-pr-content.sh
#
# Description:
#   Adds one or more timeline comments to an existing Pull Request (PR) using the
#   GitHub CLI (`gh`). Also demonstrates assigning the PR, labeling, and adding an
#   inline review comment. No local git operations are performed.
#
# Usage:
#   1. Ensure you are authenticated with `gh auth login`.
#   2. Set REPO_NAME in a `.env` file in the same directory.
#   3. Optionally set PR_NUMBER, COMMENT_COUNT, COMMENT_TEXT as env vars.
#   4. Run this script: `bash 06-add-pr-content.sh`
#
# Requirements:
#   - GitHub CLI (`gh`) installed and authenticated.
#   - The target repository and PR must exist under your GitHub account.
# -----------------------------------------------------------------------------

# Source the utility functions
source _utils.sh

#######################################################
### 1. Initialize repo context. 
#######################################################
ghlab_repo_init

#######################################################
### 2. Configuration
#######################################################
PR_NUMBER=${PR_NUMBER:-1}                       # Default PR number
COMMENT_COUNT=${COMMENT_COUNT:-1}               # How many comments to post
COMMENT_TEXT=${COMMENT_TEXT:-"Automated comment added via script."}

#######################################################
### 3. Validate PR exists
#######################################################
echo -e "${PURPLE}* Checking if PR #$PR_NUMBER exists in $FULL_REPO_NAME...${NO_COLOR}"
if ! gh pr view "$PR_NUMBER" --repo "$FULL_REPO_NAME" >/dev/null 2>&1; then
	echo -e "${RED}❌ ERROR: PR #$PR_NUMBER not found in $FULL_REPO_NAME.${NO_COLOR}" >&2
	exit 1
fi

echo -e "${YELLOW}✍️ Adding $COMMENT_COUNT comment(s) to PR #$PR_NUMBER in $FULL_REPO_NAME...${NO_COLOR}"

#######################################################
### 4. Add comments
#######################################################
echo -e "${PURPLE}* Adding comments to PR #$PR_NUMBER in $FULL_REPO_NAME...${NO_COLOR}"
for (( i=1; i<=COMMENT_COUNT; i++ )); do
	BODY="$COMMENT_TEXT (seq:$i time:$(ts))"
	if gh pr comment "$PR_NUMBER" --repo "$FULL_REPO_NAME" --body "$BODY" >/dev/null 2>&1; then
		echo -e "${GREEN}✅ Comment $i posted: ${CYAN}$BODY${NO_COLOR}"
	else
		echo -e "${RED}❌ WARNING: Failed to post comment $i.${NO_COLOR}" >&2
	fi
done

#######################################################
### 5. Assign PR to myself
#######################################################
echo -e "${PURPLE}* Assigning PR #$PR_NUMBER to myself...${NO_COLOR}"
gh pr edit "$PR_NUMBER" --repo "$FULL_REPO_NAME" --add-assignee "$REPO_OWNER"

#######################################################
### 6. Add label to PR
#######################################################
echo -e "${PURPLE}* Adding label 'bug' to PR #$PR_NUMBER in $FULL_REPO_NAME...${NO_COLOR}"
gh pr edit "$PR_NUMBER" --repo "$FULL_REPO_NAME" --add-label "bug"

#######################################################
### 7. Add inline review comment
#######################################################
echo -e "${PURPLE}* Adding inline review comment to PR #$PR_NUMBER in $FULL_REPO_NAME...${NO_COLOR}"
gh pr review "$PR_NUMBER" \
	--repo "$FULL_REPO_NAME" \
	--comment \
	--body "Automated inline review comment - general review comment"


echo -e "${GREEN}✅ Done. View PR: https://github.com/$FULL_REPO_NAME/pull/$PR_NUMBER${NO_COLOR}"
