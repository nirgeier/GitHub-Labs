#!/bin/bash
# Setup script for GitHub-Labs MkDocs project using Python venv and required plugins

set -e

## Use the git root folder as BASE folder
ROOT_FOLDER=$(git rev-parse --show-toplevel)

# Change to the project root directory
cd $ROOT_FOLDER

export PIP_REQUIRE_VIRTUALENV=true
export VIRTUAL_ENV_DISABLE_PROMPT=true

# Create and activate virtual environment
python3 -m venv .venv
source .venv/bin/activate

# Upgrade pip
pip install --upgrade pip

# Install MkDocs and required plugins
pip install -r requirements.txt

# Concat the mkdocs
cat mkdocs/*.yml > mkdocs.yml

# Warn if git-committers token not set (optional optimization for rate limits / private repos)
if [ -z "$MKDOCS_GIT_COMMITTERS_APIKEY" ]; then
	echo "[INFO] MKDOCS_GIT_COMMITTERS_APIKEY not set. Proceeding unauthenticated (GitHub API 60/hr rate limit)." >&2
	echo "       Set export MKDOCS_GIT_COMMITTERS_APIKEY=ghp_xxx to increase rate limit and avoid warnings." >&2
fi

# Print success message
echo "\nSetup complete! Activate your environment with: source .venv/bin/activate"
echo "To build the docs: mkdocs serve"

source .venv/bin/activate
mkdocs build

# Build the PDF version
# mkdocs build --strict --format pdf --output-dir ./docs/pdf

# Serve the MkDocs site
mkdocs serve --watch-theme
#mkdocs gh-deploy --force --verbose
