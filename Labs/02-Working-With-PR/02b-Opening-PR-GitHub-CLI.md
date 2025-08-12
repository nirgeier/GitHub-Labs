# Opening Pull Requests via GitHub CLI {.css-random-1}

This guide explains how to create and manage pull requests using the GitHub CLI (gh command). This method is perfect for developers who prefer command-line workflows.

---

## Prerequisites

- A repository with at least one branch containing changes
- GitHub CLI installed (`gh` command)
- Proper authentication setup with GitHub CLI

---

## 1: Install and Authenticate GitHub CLI

```sh
# Install GitHub CLI (if not already installed)
# macOS
brew install gh

# Windows
winget install --id GitHub.cli

# Linux (Ubuntu/Debian)
sudo apt install gh

# Authenticate
gh auth login
```

Follow the interactive prompts to authenticate with your GitHub account.

---

## 2: Create Pull Request

### Basic PR Creation

```sh
# Basic PR creation
gh pr create --title "Add user authentication feature" --body "Detailed description of changes"

# Interactive PR creation (recommended for beginners)
gh pr create
```

### PR with Specific Options

```sh
# PR with comprehensive options
gh pr create \
  --title "Add user authentication feature" \
  --body "This PR implements user authentication using JWT tokens" \
  --assignee @me \
  --reviewer username1,username2 \
  --label feature,authentication \
  --milestone "v1.0.0"
```

---

## 3: Advanced GitHub CLI Options

### Draft and Branch Options

```sh
# Create draft PR
gh pr create --draft --title "WIP: User authentication"

# Create PR to specific base branch
gh pr create --base develop --title "Feature implementation"

# Create PR with body from file
gh pr create --title "New feature" --body-file pr-description.md

# Create PR and open in browser
gh pr create --web
```

### Template and Metadata

```sh
# Use PR template
gh pr create --template .github/pull_request_template.md

# Add multiple labels
gh pr create --label bug,high-priority,backend

# Add team reviewers
gh pr create --reviewer @organization/team-name
```

---

## Managing PRs with GitHub CLI

### Viewing Pull Requests

```sh
# List all PRs
gh pr list

# List PRs with specific filters
gh pr list --state open --author @me
gh pr list --label bug
gh pr list --assignee username

# View specific PR details
gh pr view 123
gh pr view 123 --json title,body,state
```

### Updating Pull Requests

```sh
# Update title
gh pr edit 123 --title "New title"

# Update description
gh pr edit 123 --body "Updated description"

# Update from file
gh pr edit 123 --body-file new-description.md

# Add reviewers
gh pr edit 123 --add-reviewer username1,username2

# Add assignees
gh pr edit 123 --add-assignee @me,username

# Add labels
gh pr edit 123 --add-label feature,documentation
```

### Working with PR Code

```sh
# Checkout PR locally for testing
gh pr checkout 123

# View PR diff
gh pr diff 123

# View PR status (checks, reviews)
gh pr status

# Make changes and push updates
git add .
git commit -m "Update based on feedback"
git push
```

---

## Adding New Code After PR Creation

### Method 1: Direct Commits

```sh
# Make changes to your files
# Stage changes
git add .

# Commit changes
git commit -m "Address review feedback"

# Push to the same branch
git push origin feature-branch
```

### Method 2: Checkout and Update

```sh
# Checkout the PR branch
gh pr checkout 123

# Make your changes
# Add and commit
git add .
git commit -m "Update based on feedback"

# Push updates
git push
```

---

## Review and Merge Operations

### Managing Reviews

```sh
# Request review from specific users
gh pr edit 123 --add-reviewer alice,bob

# View review status
gh pr checks 123

# Add review comment
gh pr comment 123 --body "Great work on this feature!"

# Review and approve
gh pr review 123 --approve --body "LGTM! Great implementation."

# Request changes
gh pr review 123 --request-changes --body "Please address the security concerns."
```

### Merging Pull Requests

```sh
# Merge PR (default merge commit)
gh pr merge 123

# Squash and merge
gh pr merge 123 --squash

# Rebase and merge
gh pr merge 123 --rebase

# Merge with custom commit message
gh pr merge 123 --squash --body "Implement user authentication feature"

# Delete branch after merge
gh pr merge 123 --delete-branch
```

---

## Advanced CLI Workflows

### Bulk Operations

```sh
# Close multiple PRs
gh pr list --json number --jq '.[].number' | xargs -I {} gh pr close {}

# Review all open PRs assigned to you
gh pr list --assignee @me --json number --jq '.[].number' | xargs -I {} gh pr view {}
```

### Custom Scripts and Automation

```sh
# Create PR with template and auto-assign
create_pr() {
  gh pr create \
    --title "$1" \
    --body-file .github/pr_template.md \
    --assignee @me \
    --reviewer @organization/team \
    --label feature
}

# Usage
create_pr "Add new authentication feature"
```

### Integration with Git Aliases

```sh
# Add to your .gitconfig
git config --global alias.pr '!gh pr create --web'
git config --global alias.prs '!gh pr list'
git config --global alias.prv '!gh pr view'

# Now you can use
git pr          # Create PR and open in browser
git prs         # List all PRs
git prv 123     # View PR 123
```

---

## Configuration and Customization

### GitHub CLI Configuration

```sh
# Set default editor for PR descriptions
gh config set editor code

# Set default browser
gh config set browser firefox

# View current configuration
gh config list
```

### Creating Aliases

```sh
# Create custom aliases
gh alias set prc 'pr create --web'
gh alias set prv 'pr view --web'
gh alias set prl 'pr list --state open'

# Use aliases
gh prc  # Create PR and open in web
gh prv  # View PR in web
gh prl  # List open PRs
```

---

## Best Practices for GitHub CLI

### Efficient Workflows

1. **Use interactive mode** for learning: `gh pr create`
2. **Create aliases** for frequently used commands
3. **Use templates** for consistent PR descriptions
4. **Combine with shell scripts** for automation

### Security Considerations

```sh
# Use specific scopes for authentication
gh auth login --scopes repo,read:org

# Use environment variables for automation
export GITHUB_TOKEN="your_token_here"
gh pr create --title "Automated PR"
```

### Error Handling

```sh
# Check if PR exists before creating
if gh pr list --json number --jq '.[] | select(.head.ref=="feature-branch")' | grep -q number; then
  echo "PR already exists for this branch"
else
  gh pr create --title "New feature"
fi
```

---

## Troubleshooting

### Authentication Issues

```sh
# Re-authenticate
gh auth logout
gh auth login

# Check authentication status
gh auth status

# Use different authentication method
gh auth login --with-token < token.txt
```

### Common Command Issues

```sh
# If PR creation fails, check current branch
git branch --show-current

# Ensure you're in a git repository
git status

# Check remote configuration
git remote -v
```

### API Rate Limits

```sh
# Check API rate limit status
gh api rate_limit

# Use --json flag to reduce API calls
gh pr list --json number,title,state
```

---

## Additional Resources

- [GitHub CLI Manual](https://cli.github.com/manual/)
- [GitHub CLI PR Commands](https://cli.github.com/manual/gh_pr)
- [GitHub CLI Configuration](https://cli.github.com/manual/gh_config)

---

## End of Guide
