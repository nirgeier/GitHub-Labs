#!/bin/bash

# -----------------------------------------------------------------------------
# Script Name: pr-lab-steps.sh
#
# Description:
#   Step-by-step interactive script for the Advanced PR Lab. Automates steps 1-5
#   of the workflow: clone, branch, edit, commit, push, and PR creation prompt.
#   Pauses for user confirmation between each step.
#
# Usage:
#   ./pr-lab-steps.sh
#
# Requirements:
#   - Git must be installed and configured
#   - User must have access to the target repository
# -----------------------------------------------------------------------------

# Load color palette and utility functions if available
if [ -f "$(dirname "$0")/../../demos/_utils.sh" ]; then
	source "$(dirname "$0")/../../demos/_utils.sh"
else
	# Fallback colors
	YELLOW='\033[1;33m'; GREEN='\033[1;32m'; CYAN='\033[1;36m'; NO_COLOR='\033[0m'
fi

REPO_URL="https://github.com/username/repository-name.git"
BRANCH_NAME="pr-lab-task01"
FILE_NAME="hello.txt"

#######################################################
### Step 1: Clone the repository
#######################################################
echo -e "${YELLOW}Step 1: Cloning the repository...${NO_COLOR}"
read -p "Press Enter to continue..."
git clone "$REPO_URL"
cd "$(basename "$REPO_URL" .git)"

#######################################################
### Step 2: Create and switch to a new branch
#######################################################
echo -e "${YELLOW}Step 2: Creating and switching to branch '$BRANCH_NAME'...${NO_COLOR}"
read -p "Press Enter to continue..."
git checkout -b "$BRANCH_NAME"

#######################################################
### Step 3: Make your changes
#######################################################
echo -e "${YELLOW}Step 3: Making changes and committing...${NO_COLOR}"
read -p "Press Enter to continue..."
echo "Hello, World!" > "$FILE_NAME"
git add "$FILE_NAME"
git commit -m "PR-Lab-01: Add $FILE_NAME with greeting"

#######################################################
### Step 4: Push your branch to GitHub
#######################################################
echo -e "${YELLOW}Step 4: Pushing branch '$BRANCH_NAME' to GitHub...${NO_COLOR}"
read -p "Press Enter to continue..."
git push --set-upstream origin "$BRANCH_NAME"

#######################################################
### Step 5: Create the Pull Request
#######################################################
echo -e "${CYAN}Step 5: Go to GitHub and create the pull request as described in the lab instructions.${NO_COLOR}"
read -p "Press Enter to finish."
#!/bin/bash

# Step 1: Clone the repository
read -p "Step 1: Clone the repository. Press Enter to continue..."
git clone https://github.com/username/repository-name.git
cd repository-name

# Step 2: Create and switch to a new branch
read -p "Step 2: Create and switch to a new branch. Press Enter to continue..."
git checkout -b pr-lab-task01

# Step 3: Make your changes
read -p "Step 3: Make your changes. Press Enter to continue..."
echo "Hello, World!" > hello.txt
git add hello.txt
git commit -m "PR-Lab-01: Add hello.txt with greeting"

# Step 4: Push your branch to GitHub
read -p "Step 4: Push your branch to GitHub. Press Enter to continue..."
git push --set-upstream origin pr-lab-task01

# Step 5: Instruct user to create the pull request on GitHub
read -p "Step 5: Go to GitHub and create the pull request as described in the lab. Press Enter to finish."
