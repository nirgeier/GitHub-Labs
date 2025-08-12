# Working with Pull Requests: Adding Reviewers, Review Process & Approval {.css-random-1}

This guide covers the complete pull request review workflow, including adding code reviewers, conducting reviews, and managing the approval process using GitHub Web, GitHub CLI, and GitHub MCP.

---

## Prerequisites

- An open pull request in a GitHub repository
- Proper permissions to request reviews and approve changes
- Understanding of the codebase and review requirements

---

## Part 1: Adding Code Reviewers to Pull Requests

### Method 1: Adding Reviewers via GitHub Web Interface

#### Step 1: Navigate to Your Pull Request

1. Go to your repository on GitHub
2. Click on the **"Pull requests"** tab
3. Select the pull request you want to add reviewers to

#### Step 2: Add Individual Reviewers

1. Look for the **"Reviewers"** section in the right sidebar
2. Click the gear icon (⚙️) next to "Reviewers"
3. Search for and select reviewers by:
   - Username
   - Full name
   - Team name (if you have access to teams)
4. Click on the reviewer name to add them

#### Step 3: Request Team Reviews

1. In the "Reviewers" section, you can also add entire teams
2. Type the team name (e.g., `@organization/team-name`)
3. Select the team from the dropdown

#### Step 4: Add Review Requirements

1. Repository admins can set up branch protection rules
2. Go to **Settings > Branches**
3. Add branch protection rule for main/master branch
4. Enable **"Require pull request reviews before merging"**
5. Set number of required approving reviews
6. Enable **"Require review from code owners"** if you have a CODEOWNERS file

### Method 2: Adding Reviewers via GitHub CLI

```sh
# Add individual reviewers
gh pr edit [PR-number] --add-reviewer username1,username2

# Add team reviewers
gh pr edit [PR-number] --add-reviewer @organization/team-name

# Add both individuals and teams
gh pr edit [PR-number] --add-reviewer user1,user2,@org/team

# Remove reviewers
gh pr edit [PR-number] --remove-reviewer username

# View current reviewers
gh pr view [PR-number]
```

### Method 3: Adding Reviewers via GitHub MCP

Use natural language prompts in VS Code Copilot Chat:

```text
Add john.doe and jane.smith as reviewers to pull request #123
```

```text
Request review from the @frontend-team for my current pull request
```

```text
Add code reviewers: alice, bob, and @backend-team to PR #456
```

---

## Part 2: Conducting Code Reviews

### For Reviewers: How to Review Pull Requests

#### Step 1: Access the Pull Request

**GitHub Web:**
1. Navigate to the repository
2. Go to **Pull requests** tab
3. Click on the PR you need to review
4. You'll receive email notifications for review requests

**GitHub CLI:**
```sh
# List PRs requesting your review
gh pr list --reviewer @me

# View specific PR
gh pr view [PR-number]

# Checkout PR locally for testing
gh pr checkout [PR-number]
```

#### Step 2: Review the Changes

**In GitHub Web Interface:**

1. **Overview Tab**: Read the PR description and context
2. **Commits Tab**: Review the commit history
3. **Files Changed Tab**: This is where you'll do most of your review

**Reviewing Files:**
1. Click on the **"Files changed"** tab
2. Review each modified file
3. Look for:
   - Code quality and style
   - Logic errors
   - Security issues
   - Performance concerns
   - Test coverage
   - Documentation updates

#### Step 3: Adding Review Comments

**Inline Comments:**
1. Hover over any line of code
2. Click the **"+"** button that appears
3. Add your comment
4. Choose comment type:
   - **Single comment**: Just a comment
   - **Start a review**: Begin a comprehensive review

**General Comments:**
1. Use the review summary box at the top or bottom
2. Provide overall feedback about the PR

**Suggesting Changes:**
1. Click the suggestion button (±) when commenting
2. GitHub will create a code suggestion that can be applied directly

```markdown
```suggestion
// Suggested code change
const result = await fetchData();
```
```

#### Step 4: Submit Your Review

1. Click **"Review changes"** button
2. Add a summary comment
3. Choose your review decision:
   - **Comment**: General feedback without approval/rejection
   - **Approve**: Code looks good and is ready to merge
   - **Request changes**: Issues must be addressed before merging
4. Click **"Submit review"**

### Using GitHub CLI for Reviews

```sh
# Add a review comment
gh pr comment [PR-number] --body "Great work on this feature!"

# Review and approve
gh pr review [PR-number] --approve --body "LGTM! Great implementation."

# Request changes
gh pr review [PR-number] --request-changes --body "Please address the security concerns mentioned in the comments."

# Add comment without approval/rejection
gh pr review [PR-number] --comment --body "Thanks for the PR. I've added some suggestions."
```

### Using GitHub MCP for Reviews

```text
Review pull request #123 and approve it with comment "Great implementation of the authentication feature"
```

```text
Add review comment to PR #456: "Please add unit tests for the new validation logic"
```

---

## Part 3: Managing Review Process

### For PR Authors: Responding to Reviews

#### Addressing Review Comments

1. **Read all feedback carefully**
2. **Respond to questions and concerns**
3. **Make requested code changes**
4. **Push updates to the same branch**

```sh
# Make changes based on feedback
# Stage and commit changes
git add .
git commit -m "Address review feedback: Add input validation"

# Push updates (automatically updates the PR)
git push origin feature-branch
```

#### Resolving Conversations

1. After addressing a comment, click **"Resolve conversation"**
2. This helps track which issues have been handled
3. Only the comment author or PR author can resolve conversations

#### Requesting Re-review

**GitHub Web:**
1. After making changes, click the re-review icon (🔄) next to reviewer names
2. This notifies reviewers that you've addressed their feedback

**GitHub CLI:**
```sh
# Request re-review from specific reviewers
gh pr edit [PR-number] --add-reviewer username
```

### Review Status and Checks

#### Understanding Review States

- **Review requested**: Waiting for reviewer action
- **Approved**: Reviewer has approved the changes
- **Changes requested**: Issues must be addressed
- **Commented**: Feedback provided without approval/rejection

#### Branch Protection and Required Reviews

**Setting up branch protection:**
1. Go to repository **Settings > Branches**
2. Add rule for protected branch (e.g., `main`)
3. Enable **"Require pull request reviews before merging"**
4. Configure:
   - Number of required approving reviews
   - Dismiss stale reviews when new commits are pushed
   - Require review from code owners
   - Restrict push access

#### Status Checks

Monitor various checks:
- **Required reviews**: Green ✅ when sufficient approvals received
- **CI/CD pipelines**: Automated tests and builds
- **Code quality checks**: Linting, security scans
- **Merge conflicts**: Ensure branch can be merged cleanly

---

## Part 4: Best Practices for Code Reviews

### For Review Requesters

1. **Self-review first**: Review your own code before requesting reviews
2. **Provide context**: Write clear PR descriptions explaining the changes
3. **Keep PRs focused**: Smaller, focused PRs are easier to review
4. **Respond promptly**: Address feedback quickly and respectfully
5. **Test thoroughly**: Ensure your code works before requesting review

### For Reviewers

1. **Review promptly**: Aim to review within 24-48 hours
2. **Be constructive**: Provide specific, actionable feedback
3. **Explain reasoning**: Help the author understand why changes are needed
4. **Praise good work**: Acknowledge well-written code and good practices
5. **Focus on important issues**: Distinguish between critical and nitpicky comments

### Review Comments Best Practices

#### Good Review Comments

```markdown
# Constructive and specific
Consider extracting this logic into a separate function for better testability and reusability.

# Provides alternatives
This could be vulnerable to SQL injection. Consider using parameterized queries or an ORM.

# Acknowledges good work
Nice use of the async/await pattern here. This makes the code much more readable.
```

#### Comments to Avoid

```markdown
# Too vague
This is wrong.

# Not constructive
Why did you do it this way?

# Overly nitpicky
You should use single quotes instead of double quotes.
```

---

## Part 5: Advanced Review Features

### Code Owners

Create a `.github/CODEOWNERS` file to automatically request reviews:

```text
# Global owners
* @username1 @username2

# Frontend code
/frontend/ @frontend-team

# Backend API
/api/ @backend-team

# Documentation
*.md @docs-team

# Configuration files
*.yml @devops-team
*.yaml @devops-team
```

### Review Templates

Create `.github/pull_request_template.md`:

```markdown
## Description
Brief description of changes

## Type of Change
- [ ] Bug fix (non-breaking change which fixes an issue)
- [ ] New feature (non-breaking change which adds functionality)
- [ ] Breaking change (fix or feature that would cause existing functionality to not work as expected)
- [ ] This change requires a documentation update

## How Has This Been Tested?
- [ ] Unit tests
- [ ] Integration tests
- [ ] Manual testing

## Checklist:
- [ ] My code follows the style guidelines of this project
- [ ] I have performed a self-review of my own code
- [ ] I have commented my code, particularly in hard-to-understand areas
- [ ] I have made corresponding changes to the documentation
- [ ] My changes generate no new warnings
- [ ] I have added tests that prove my fix is effective or that my feature works
- [ ] New and existing unit tests pass locally with my changes
```

### Automated Review Tools

Consider integrating:
- **CodeClimate**: Code quality analysis
- **SonarQube**: Security and quality scanning
- **Dependabot**: Dependency updates
- **GitHub CodeQL**: Security vulnerability scanning

---

## Part 6: Troubleshooting Common Issues

### Review Not Showing Up

1. **Check permissions**: Ensure reviewer has access to the repository
2. **Verify notifications**: Check email and GitHub notification settings
3. **Re-request review**: Try removing and re-adding the reviewer

### Cannot Approve PR

1. **Author cannot approve**: PR authors cannot approve their own PRs
2. **Insufficient permissions**: Check if you have review permissions
3. **Branch protection**: Required checks or reviews might be missing

### Merge Conflicts

```sh
# Update your branch with latest main
git checkout main
git pull origin main
git checkout feature-branch
git merge main

# Resolve conflicts in your editor
# Add resolved files
git add .
git commit -m "Resolve merge conflicts"
git push origin feature-branch
```

---

## Additional Resources

- [GitHub Review Documentation](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/reviewing-changes-in-pull-requests)
- [Code Review Best Practices](https://github.blog/2015-01-21-how-to-write-the-perfect-pull-request/)
- [Setting Up Branch Protection](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/about-protected-branches)

---

## End of Guide
