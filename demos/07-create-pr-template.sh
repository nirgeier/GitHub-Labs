#!/bin/bash

# -----------------------------------------------------------------------------
# Script Name: 07-create-pr-template.sh
#
# Description:
#   Creates or updates a repository-wide Pull Request template file at
#   .github/pull_request_template.md using only the GitHub CLI (gh) / API.
#   No local git clone is required; the file is written directly via the
#   GitHub Contents API (creating intermediate directories if needed).
#
# Usage:
#   1. Ensure you are authenticated with `gh auth login`.
#   2. Set REPO_NAME in a `.env` file in the same directory.
#   3. Optionally set PR_TEMPLATE_PATH, COMMIT_MESSAGE as env vars.
#   4. Run this script: `bash 07-create-pr-template.sh`
#
# Requirements:
#   - GitHub CLI (`gh`) installed and authenticated.
#   - The target repository must exist under your GitHub account.
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
PR_TEMPLATE_PATH=${PR_TEMPLATE_PATH:-.github/pull_request_template.md}
COMMIT_MESSAGE=${COMMIT_MESSAGE:-"Add/Update pull request template"}

echo -e "${YELLOW}📦 Target repo: $FULL_REPO_NAME (default branch: $DEFAULT_BRANCH)${NO_COLOR}"
echo -e "${YELLOW}📄 Template path: $PR_TEMPLATE_PATH${NO_COLOR}"

#######################################################
### 3. Template Content
#######################################################
TEMPLATE_CONTENT=$(cat <<'EOF'
## Description
<!-- Briefly describe the changes introduced by this PR -->

## Related Issue
<!-- Link the issue this PR closes or relates to , if any-->
Fixes #<issue_number>

## Type of Change
<!-- Leave only the relevant one and delete the others -->
- [ ] 🐛 Bug fix 
- [ ] ✨ New feature
- [ ] 📚 Documentation update
- [ ] 🛠️ Enhancement
- [ ] ♻️ Refactoring
- [ ] 🔥 Hotfix
- [ ] Other (please describe):

## Checklist
- [ ] I have tested my changes locally
- [ ] I have updated documentation if needed
- [ ] My code follows the project style guidelines
- [ ] I have linked the related issue
- [ ] I need to go home 😊

## Screenshots (if applicable)
<!-- Add before/after screenshots for UI changes -->

## Additional Notes
<!-- Anything else reviewers should know -->
EOF
)

#######################################################
### 4. Check for existing template file
#######################################################
# Base64 encode (GitHub API expects raw base64 without newlines)
CONTENT_B64=$(printf "%s" "$TEMPLATE_CONTENT" | base64 | tr -d '\n')

# Attempt to get existing file SHA (if file already exists) on default branch
echo -e "${YELLOW}🔍 Checking for existing template...${NO_COLOR}"
EXISTING_SHA=$(gh api "repos/$FULL_REPO_NAME/contents/$PR_TEMPLATE_PATH?ref=$DEFAULT_BRANCH" --jq .sha 2>/dev/null || true)

if [ -n "$EXISTING_SHA" ]; then
  echo -e "${PURPLE}📝 Existing template found. $EXISTING_SHA. Updating...${NO_COLOR}"
else
  echo -e "${YELLOW}🆕 No existing template found. Creating new template...${NO_COLOR}"
fi

#######################################################
### 5. Create/Update template file
#######################################################
echo -e "${YELLOW}✍️ Creating/updating template file...${NO_COLOR}"
if gh api "repos/$FULL_REPO_NAME/contents/$PR_TEMPLATE_PATH" \
    -X PUT \
    -f message="$COMMIT_MESSAGE" \
    -f content="$CONTENT_B64" \
    -f branch="$DEFAULT_BRANCH" \
    ${EXISTING_SHA:+ -f sha="$EXISTING_SHA"} >/dev/null 2>&1; then
  echo -e "${GREEN}✅ Pull Request template successfully written to $PR_TEMPLATE_PATH on $DEFAULT_BRANCH.${NO_COLOR}"
else
  echo -e "${RED}❌ ERROR: Failed to write PR template.${NO_COLOR}" >&2
  exit 1
fi

echo -e "${CYAN}🔗 View file: https://github.com/$FULL_REPO_NAME/blob/$DEFAULT_BRANCH/$PR_TEMPLATE_PATH${NO_COLOR}"
echo -e "${GREEN}✅ Done.${NO_COLOR}"
