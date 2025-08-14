#!/bin/bash

# Disable any paging so commands never wait for 'q'
export GH_PAGER=
export PAGER=cat
export REPO_OWNER 
export FULL_REPO_NAME
export DEFAULT_BRANCH
export FEATURE_BRANCH

# Load the colors palette - Download the colors script
temp_file=$(mktemp)         &&  \
            curl -s https://raw.githubusercontent.com/nirgeier/labs-assets/refs/heads/main/assets/scripts/colors.sh \
            -o "$temp_file" &&  \
            source "$temp_file"
echo -e "${YELLOW}🌈 Colors palette loaded.${NO_COLOR}"

# Load environment variables from .env file if present
if [ -f .env ]; then
  set -a; source .env; set +a
  echo -e "${YELLOW}📝 .env file loaded.${NO_COLOR}"
fi

# Timestamp function
# -----------------------------------------------------------------------------
# Function: ts
#
# Description:
#   Returns the current UTC timestamp in ISO 8601 format (YYYY-MM-DDTHH:MM:SSZ).
#   Useful for logging and timestamping events in scripts.
# -----------------------------------------------------------------------------
ts() { date -u +"%Y-%m-%dT%H:%M:%SZ"; }


# -----------------------------------------------------------------------------
# Function: ghlab_get_repo_name
#
# Description:
#   Retrieves the repository owner using the GitHub CLI and constructs the full
#   repository name by combining the owner and the REPO_NAME environment variable.
#   Exports the REPO_OWNER and FULL_REPO_NAME variables for use in other functions.
#
# Arguments:
#   None. Uses the REPO_NAME environment variable.
#
# Returns:
#   None. Exports REPO_OWNER and FULL_REPO_NAME.
# -----------------------------------------------------------------------------
ghlab_get_repo_name(){

  # Get the repository owner and compose full name
  echo -e "${YELLOW}🥷 Resolving repository owner...${NO_COLOR}"
  REPO_OWNER=$(gh api user --jq .login 2>/dev/null)
  FULL_REPO_NAME="$REPO_OWNER/$REPO_NAME"
  export REPO_OWNER FULL_REPO_NAME

  echo -e "   ${CYAN}REPO_NAME is set to ${FULL_REPO_NAME}.${NO_COLOR}"
}


# -----------------------------------------------------------------------------
# Function: ghlab_repo_init
#
# Description:
#   Initializes the GitHub repository context for subsequent CLI operations.
#   - Checks GitHub CLI authentication.
#   - Ensures REPO_NAME is set.
#   - Resolves and exports repository owner and full repository name.
#   - Verifies repository existence.
#   - Determines and exports the default branch name.
#
# Arguments:
#   None. Uses environment variables and sets exported variables.
#
# Returns:
#   0 on success, non-zero on error.
# -----------------------------------------------------------------------------
# Function to initialize GitHub repo context and export variables
ghlab_repo_init() {

  # Get the repository owner and full name
  ghlab_get_repo_name

  echo -e "${YELLOW}✍️ Initializing GitHub repository context...${NO_COLOR}"

  # Check if user is logged in with gh auth
  echo -e "${YELLOW}🔐 Checking GitHub authentication...${NO_COLOR}"
  if ! gh auth status >/dev/null 2>&1; then
  echo -e "* ${RED}⏻ User is not logged in with gh auth.${NO_COLOR}"
    return 1
  fi

  # Check if REPO_NAME is set
  echo -e "${YELLOW}📜 Checking repository name...${NO_COLOR}"
  if [ -z "${REPO_NAME:-}" ]; then
    echo -e "${RED}REPO_NAME is not set.${NO_COLOR}"
    return 1
  fi
  
  echo -e "${CYAN}🪧 REPO_NAME is set to ${FULL_REPO_NAME}.${NO_COLOR}"
  
  # Check if the repository exists
  echo -e "${YELLOW}❓ Checking repository existence...${NO_COLOR}"
  if ! gh repo view "$FULL_REPO_NAME" >/dev/null 2>&1; then
    echo -e "${RED}🚫 Repository $FULL_REPO_NAME does not exist.${NO_COLOR}"
    # Creating the repository
    gh repo create $REPO_NAME --public --description "Repository created via script" --add-readme
    echo -e "${GREEN}✅ Repository $FULL_REPO_NAME created successfully.${NO_COLOR}"
    return 1
  fi


  # Resolve default branch
  echo -e "${YELLOW}🌱 Resolving default branch...${NO_COLOR}"
  DEFAULT_BRANCH=$(gh repo view "$FULL_REPO_NAME" --json defaultBranchRef -q '.defaultBranchRef.name' 2>/dev/null)
  [ -z "$DEFAULT_BRANCH" ] && DEFAULT_BRANCH="main"
  
  # Check if default branch is set
  if [ -z "$DEFAULT_BRANCH" ]; then
  echo -e "${RED}❌ Failed to resolve default branch. Ensure the repository exists and you are authenticated.${NO_COLOR}"
    exit 1
  fi

  echo ""
  echo -e "${BLUE}|   Variable     | Value ${NO_COLOR}"
  echo -e "${BLUE}|----------------+-------------------------------------${NO_COLOR}"
  echo -e "| ${YELLOW}REPO_OWNER     ${NO_COLOR} | ${GREEN}$REPO_OWNER${NO_COLOR}"
  echo -e "| ${YELLOW}REPO_NAME      ${NO_COLOR} | ${GREEN}$REPO_NAME${NO_COLOR}"
  echo -e "| ${YELLOW}FULL_REPO_NAME ${NO_COLOR} | ${GREEN}$FULL_REPO_NAME${NO_COLOR}"
  echo -e "| ${YELLOW}DEFAULT_BRANCH ${NO_COLOR} | ${GREEN}$DEFAULT_BRANCH${NO_COLOR}"
  echo ""
  
}

# -----------------------------------------------------------------------------
# Function: ghlab_add_random_files_to_branch
#
# Description:
#   Adds a specified number of text files with random content to a given branch
#   in the GitHub repository using the GitHub Contents API. Each file addition
#   is a separate commit. If a file already exists, it will be updated.
#
# Arguments:
#   $1 - Name of the branch to which files will be added.
#   $2 - Number of files to add (default: 3).
#
# Returns:
#   None. Sets the FILES_CREATED array variable with the names of the files created/updated.
# -----------------------------------------------------------------------------
ghlab_add_random_files_to_branch() {
  
  local branch_name="$1"
  local file_count="${2:-3}"
  local file_prefix="${3:-file}"
  local -a files_created=()

  # Create N files
  for ((i=1; i<=file_count; i++)); do
    # Set the file path and content
    local FPATH="${file_prefix}$(uuidgen).txt"
    local CONTENT="Random text $i $(date +%s)"
    local B64=$(echo -n "$CONTENT" | base64)

    echo -e "${PURPLE} * Adding $FPATH to $branch_name...${NO_COLOR}"

    # Attempt to create the file
    if ! gh api repos/$FULL_REPO_NAME/contents/$FPATH \
        -X PUT \
        -f message="Add $FPATH" \
        -f content="$B64" \
        -f branch="$branch_name" >/dev/null 2>&1; then
      echo -e "${RED} * File $FPATH may already exist. Attempting update...${NO_COLOR}"

      # Get the existing file SHA
      local EXISTING_SHA=$(gh api repos/$FULL_REPO_NAME/contents/$FPATH?ref=$branch_name --jq '.sha' 2>/dev/null || true)

      # Check if the existing SHA is found
      if [ -n "$EXISTING_SHA" ]; then
        gh api repos/$FULL_REPO_NAME/contents/$FPATH \
          -X PUT \
          -f message="Update $FPATH" \
          -f content="$B64" \
          -f sha="$EXISTING_SHA" \
          -f branch="$branch_name" >/dev/null && echo "Updated $FPATH." || echo "Failed to update $FPATH."
      else
        echo -e "${RED} *Could not create or update $FPATH.${NO_COLOR}" >&2
      fi
    fi
    files_created+=("$FPATH")
  done
  FILES_CREATED=("${files_created[@]}")
  export FILES_CREATED
}

# -----------------------------------------------------------------------------
# Function: ghlab_create_pull_request
#
# Description:
#   Creates a pull request in the GitHub repository using the GitHub API.
#   - Attempts to create a new pull request; if it already exists, it will be identified.
#   - Exports the PR_URL variable with the URL of the created or existing pull request.
#
# Arguments:
#   $1 - Name of the feature branch.
#   $2 - Title of the pull request.
#   $3 - Body/description of the pull request.
#
# Returns:
#   None.
# -----------------------------------------------------------------------------
ghlab_create_pull_request() {
  local branch_name="$1"
  local pr_title="$2"
  local pr_body="$3"
  echo -e "${YELLOW}* Creating Pull Request...${NO_COLOR}"
  PR_URL=$(gh api repos/$FULL_REPO_NAME/pulls -f title="$pr_title" -f head="$branch_name" -f base="$DEFAULT_BRANCH" -f body="$pr_body" --jq '.html_url' 2>/dev/null || true)
  export PR_URL
  if [ -n "$PR_URL" ] && [ "$PR_URL" != "null" ]; then
    echo -e "${GREEN}* PR created:"
    echo $PR_URL | jq
  else
    echo -e "${RED} * Failed to create PR (it may already exist). Attempting to find existing PR...${NO_COLOR}"
    local EXISTING_URL=$(gh api repos/$FULL_REPO_NAME/pulls --jq '.[] | select(.head.ref=="'$branch_name'") | .html_url' 2>/dev/null | head -n1)
    [ -n "$EXISTING_URL" ] && echo "Existing PR: $EXISTING_URL" || echo "No PR found.";
  fi
}

# -----------------------------------------------------------------------------
# Function: ghlab_delete_repo_if_exists
#
# Description:
#   Checks if a GitHub repository exists and deletes it if it does.
#   Uses the GitHub CLI (`gh`).
#
# Arguments:
#   $1 - The repository name (e.g., my-repo)
#   $2 - The repository owner (optional, defaults to $REPO_OWNER)
#
# Returns:
#   0 if the repo does not exist or is deleted successfully, non-zero on error.
# -----------------------------------------------------------------------------
ghlab_delete_repo_if_exists() {
  
  # Get the repository owner and full name
  ghlab_get_repo_name
  
  echo -e "${RED}❌ Deleting repository $FULL_REPO_NAME...${NO_COLOR}"

  # Check if the repository name is provided
  if [ -z "$FULL_REPO_NAME" ]; then
    echo -e "${RED}No repository name provided to ghlab_delete_repo_if_exists${NO_COLOR}"
    return 1
  fi

  # Check if the repository exists
  if gh repo view "$FULL_REPO_NAME" >/dev/null 2>&1; then
    echo -e "${RED}❌ Repository $FULL_REPO_NAME already exists. Deleting...${NO_COLOR}"
    echo "$FULL_REPO_NAME" | gh repo delete "$FULL_REPO_NAME" --yes
  else
    echo -e "${RED}⛔ Repository $FULL_REPO_NAME does not exist. No action taken.${NO_COLOR}"
  fi
}

# -----------------------------------------------------------------------------
# Function: ghlab_create_branches
#
# Description:
#   Creates multiple branches in the repository from a given commit SHA.
#   Each branch will have a random numeric suffix to ensure uniqueness.
#   Prints status for each branch created or if it already exists.
#
# Arguments:
#   $1 - Commit SHA to branch from (if empty, resolves from default branch)
#   $2... - List of branch base names (e.g., feature-branch bugfix-branch)
#
# Returns:
#   None.
# -----------------------------------------------------------------------------
ghlab_create_branches() {
  local branches=("$@")

  ghlab_repo_init

  #Verify that at least one branch name is passed to the function
  if [ ${#branches[@]} -eq 0 ]; then
    echo -e "${RED}🛑 No branch names provided to ghlab_create_branches.${NO_COLOR}"
    return 1
  fi

  # Get the SHA-1 of the default branch
  local sha=$(gh api repos/$FULL_REPO_NAME/git/ref/heads/$DEFAULT_BRANCH --jq '.object.sha' 2>/dev/null || true)
  if [ -z "$sha" ]; then
    echo -e "${RED}🛑 Could not resolve commit SHA for $DEFAULT_BRANCH.${NO_COLOR}"
    return 1
  fi

  # Otherwise, create all branches in the list
  for branch_name in "${branches[@]}"; do
    
    echo -e "${CYAN}☑️ Creating branch $branch_name from $sha...${NO_COLOR}"
    gh api repos/$FULL_REPO_NAME/git/refs -f ref="refs/heads/$branch_name" -f sha="$sha" >/dev/null 2>&1 \
      && echo -e "${GREEN}✅ Branch $branch_name created.${NO_COLOR}" \
      || echo -e "${RED}⛔Branch $branch_name may already exist or failed to create.${NO_COLOR}"
  done
}

# -----------------------------------------------------------------------------
# Function: ghlab_create_branch_and_add_files
#
# Description:
#   Creates a new branch in the GitHub repository and adds a specified number of
#   random files to it. Utilizes helper functions to create the branch and add files.
#
# Arguments:
#   $1 - Name of the branch to create.
#   $2 - Number of files to add to the branch (default: 5).
#
# Returns:
#   None.
# -----------------------------------------------------------------------------
ghlab_create_branch_and_add_files() {
  local branch_name="$1"
  local num_files="${2-3}"

  ghlab_create_branches "$branch_name" || return 1
  ghlab_add_random_files_to_branch "$branch_name" "$num_files"
}
