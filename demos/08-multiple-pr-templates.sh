#!/bin/bash

# -----------------------------------------------------------------------------
# Script Name: 08-multiple-pr-templates.sh
#
# Description:
#   Creates or updates multiple pull request templates in the
#   .github/PULL_REQUEST_TEMPLATE/ directory of a GitHub repository using the
#   GitHub CLI (gh) and API. It does not require a local git clone of the repo.
#
# Usage:
#   1. Ensure you are authenticated with `gh auth login`.
#   2. Set REPO_NAME in a `.env` file in the same directory.
#   3. Run this script: `bash 08-multiple-pr-templates.sh`
#
# Requirements:
#   - GitHub CLI (`gh`) installed and authenticated.
#   - The target repository must exist under your GitHub account.
# -----------------------------------------------------------------------------

set -euo pipefail

# Source the utility functions
source _utils.sh

#######################################################
### 1. Initialize repo context.
#######################################################
ghlab_repo_init

#######################################################
### 2. Configuration
#######################################################
echo -e "${YELLOW}📦 Target repo: $FULL_REPO_NAME (default branch: $DEFAULT_BRANCH)${NO_COLOR}"

# Template definitions
TEMPLATES=(
  "bug_fix.md"
  "feature.md"
  "documentation.md"
)

#######################################################
### 3. Template Content
#######################################################
BUG_FIX_CONTENT=$(cat <<'EOF'
## Bug Fix PR

**Describe the bug**
<!-- A clear and concise description of the bug and the fix. -->

**Related Issue**
Fixes #<issue_number>

**Checklist**
- [ ] 🧪 Tests added/updated
- [ ] 📚 Documentation updated
- [ ] 📏 Follows style guidelines
EOF
)

FEATURE_CONTENT=$(cat <<'EOF'
## Feature PR

**Describe the feature**
<!-- A clear and concise description of the new feature. -->

**Related Issue**
Closes #<issue_number>

**Checklist**
- [ ] ✨ Feature implemented
- [ ] 🧪 Tests added/updated
- [ ] 📚 Documentation updated
- [ ] 📏 Follows style guidelines
EOF
)

DOCUMENTATION_CONTENT=$(cat <<'EOF'
## Documentation PR

**Describe the documentation update**
<!-- What docs were added/changed and why. -->

**Checklist**
- [ ] 📚 Documentation complete
- [ ] 📏 Follows style guidelines
EOF
)

# Map template names to content
get_content() {
  case "$1" in
    bug_fix.md) echo "$BUG_FIX_CONTENT" ;;
    feature.md) echo "$FEATURE_CONTENT" ;;
    documentation.md) echo "$DOCUMENTATION_CONTENT" ;;
    *) echo "" ;;
  esac
}

#######################################################
### 4. Create/Update template files
#######################################################
echo -e "${YELLOW}✍️ Creating/updating template files...${NO_COLOR}"

for TEMPLATE in "${TEMPLATES[@]}"; do
  PATH_GH=".github/PULL_REQUEST_TEMPLATE/$TEMPLATE"
  CONTENT=$(get_content "$TEMPLATE")
  CONTENT_B64=$(printf "%s" "$CONTENT" | base64 | tr -d '\n')
  EXISTING_SHA=$(gh api "repos/$FULL_REPO_NAME/contents/$PATH_GH?ref=$DEFAULT_BRANCH" --jq .sha 2>/dev/null || true)

  echo -e "${YELLOW}✍️ Creating/updating template [$PATH_GH]${NO_COLOR}"
  
  # Create or update via Contents API using single command
  if gh api "repos/$FULL_REPO_NAME/contents/$PATH_GH" \
      -X PUT \
      -f message="Add/Update $TEMPLATE PR template" \
      -f content="$CONTENT_B64" \
      -f branch="$DEFAULT_BRANCH" \
      ${EXISTING_SHA:+ -f sha="$EXISTING_SHA"} >/dev/null 2>&1; then
    if [ -n "$EXISTING_SHA" ]; then
      echo -e "${GREEN}✅ $PATH_GH updated.${NO_COLOR}"
    else
      echo -e "${GREEN}✅ $PATH_GH created.${NO_COLOR}"
    fi
  else
    echo -e "${RED}❌ ERROR: Failed to write $PATH_GH${NO_COLOR}" >&2
    exit 1
  fi
done

############################################################
### 5. Create branches with content and add pr with template
############################################################
echo -e "${YELLOW}🔧 Creating demo PRs with templates...${NO_COLOR}"

PR_BRANCH="bug-for-pr-1"
echo -e "${CYAN}Creating branch $PR_BRANCH...${NO_COLOR}"
ghlab_create_branches "$PR_BRANCH"

echo -e "${CYAN}Adding files to $PR_BRANCH...${NO_COLOR}"
ghlab_add_random_files_to_branch "$PR_BRANCH" 3 "bug-fix-"

# Create pull request using gh with specific template
echo -e "${CYAN}Creating PR for $PR_BRANCH...${NO_COLOR}"
gh pr create \
      --repo "$FULL_REPO_NAME" \
      --base "$DEFAULT_BRANCH" \
      --head "$PR_BRANCH" \
      --title "🐛 Bug Fix with PR Template" \
      --body "$(get_content "bug_fix.md")"

PR_BRANCH="doc-for-pr-1"
echo -e "${CYAN}Creating branch $PR_BRANCH...${NO_COLOR}"
ghlab_create_branches "$PR_BRANCH"

echo -e "${CYAN}Adding files to $PR_BRANCH...${NO_COLOR}"
ghlab_add_random_files_to_branch "$PR_BRANCH" 2 "doc-"

# Create pull request using gh with specific template
echo -e "${CYAN}Creating PR for $PR_BRANCH...${NO_COLOR}"
gh pr create \
      --repo "$FULL_REPO_NAME" \
      --base "$DEFAULT_BRANCH" \
      --head "$PR_BRANCH" \
      --title "📚 Documentation with PR Template" \
      --body "$(get_content "documentation.md")"

echo -e "${CYAN}🔗 View templates: https://github.com/$FULL_REPO_NAME/tree/$DEFAULT_BRANCH/.github/PULL_REQUEST_TEMPLATE/${NO_COLOR}"
echo -e "${GREEN}✅ Done.${NO_COLOR}"
