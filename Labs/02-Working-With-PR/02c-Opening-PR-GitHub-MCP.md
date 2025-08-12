# Opening Pull Requests via GitHub MCP Extension {.css-random-1}

This guide explains how to create and manage pull requests using the GitHub Model Context Protocol (MCP) extension in Visual Studio Code. This AI-powered method allows you to create PRs using natural language commands.

---

## Prerequisites

- Visual Studio Code installed
- GitHub Copilot MCP extension installed and configured
- A repository with at least one branch containing changes
- Proper authentication setup with GitHub

---

## 1: Install and Setup GitHub MCP Extension

### Installation

1. Open Visual Studio Code
2. Go to the Extensions view (`Ctrl+Shift+X` or `Cmd+Shift+X` on Mac)
3. Search for `GitHub Copilot MCP` and click **Install**
4. Verify the installation by checking if the extension appears in the list of installed extensions

### Authentication

1. After installation, you may be prompted to sign in to your GitHub account
2. Follow the on-screen instructions to complete authentication
3. Verify the MCP server by opening GitHub Copilot chat and checking the server status

---

## 2: Open VS Code with GitHub MCP

1. Ensure GitHub Copilot MCP extension is installed and running
2. Open the Copilot Chat panel in VS Code:
   - Click the Copilot icon in the sidebar
   - Or use Command Palette (`Cmd+Shift+P`) → "Copilot: Chat"
3. Verify MCP connection by checking the settings icon in the chat panel

---

## 3: Create Pull Request Using Natural Language

### Basic PR Creation

Use natural language prompts in the Copilot Chat:

```text
Create a pull request for my current branch "feature/user-auth" 
with title "Add user authentication feature" 
and description "This PR implements JWT-based user authentication with login/logout functionality"
```

### Comprehensive PR Creation

```text
Open a pull request from my feature branch to main branch.
Title: "Fix login bug"
Description: "Resolves issue with password validation. Updated regex patterns and added input sanitization."
Add reviewers: john.doe, jane.smith
Add labels: bugfix, high-priority
Assign to: @me
```

### Advanced PR Options

```text
Create a draft pull request with title "WIP: User dashboard redesign"
Description: "Initial implementation of new user dashboard. Still working on mobile responsiveness."
Add team reviewers: @frontend-team
Add labels: feature, ui, work-in-progress
Link to project: User Experience Improvements
```

---

## 4: Follow MCP Prompts and Confirmation

### Interactive Process

1. The MCP extension will guide you through the process
2. Review the generated PR details in the chat response
3. Confirm the details when prompted
4. The PR will be created automatically

### Confirmation Examples

```text
MCP Response: "I'll create a pull request with the following details:
- Branch: feature/user-auth → main
- Title: Add user authentication feature
- Reviewers: john.doe, jane.smith
- Labels: feature, authentication

Proceed with creation? (yes/no)"
```

---

## Managing PRs with GitHub MCP

### Updating Existing PRs

```text
Update my pull request title to "Improved user authentication feature"
```

```text
Add reviewers alice.cooper and @backend-team to pull request #123
```

```text
Update PR #456 description to include:
"## Changes
- Fixed validation bug
- Added unit tests
- Updated documentation"
```

### Adding Code After PR Creation

```text
I've made some changes to my feature branch. Please update pull request #123 with these new commits.
```

```text
Add a comment to my current pull request explaining that I've addressed the review feedback and added unit tests.
```

### Viewing PR Information

```text
Show me the details of pull request #123
```

```text
What files were modified in my current pull request?
```

```text
Show me the review status and checks for PR #456
```

---

## Advanced MCP Features

### Automated PR Templates

```text
Create a pull request using our standard template:
- Branch: feature/payment-integration
- Title: Implement Stripe payment integration
- Type: New feature
- Include testing checklist
- Add backend team as reviewers
```

### Bulk Operations

```text
Create pull requests for all my feature branches that start with "feature/auth-"
Use template: "Authentication improvements"
Add security team as reviewers
```

### Integration with Project Management

```text
Create PR for issue #789 "Implement user roles"
Link to milestone: "User Management v2.0"
Add project: "Backend Infrastructure"
Set labels based on issue labels
```

---

## Natural Language Patterns for MCP

### Effective Prompting Techniques

#### Be Specific and Clear

```text
✅ Good:
"Create PR from feature/cart-checkout to main, title 'Add shopping cart checkout flow', add @ecommerce-team as reviewers"

❌ Avoid:
"Make a PR for the cart thing"
```

#### Use Structured Requests

```text
✅ Good:
"Create pull request:
- From: feature/api-security
- To: develop
- Title: Enhance API security measures
- Description: Implement rate limiting and input validation
- Reviewers: @security-team, john.security
- Labels: security, enhancement, api"
```

#### Include Context

```text
✅ Good:
"Create PR for the authentication feature I've been working on. This implements OAuth2 integration and requires security team review before merging to main."
```

### Common MCP Commands

#### PR Creation Commands

```text
"Create a pull request"
"Open a PR from my current branch"
"Make a pull request with reviewers"
"Draft PR for work in progress"
```

#### PR Management Commands

```text
"Update my PR title"
"Add reviewers to PR #123"
"Change PR description"
"Convert draft to ready for review"
"Add labels to my pull request"
```

#### Information Commands

```text
"Show my open pull requests"
"What's the status of PR #456?"
"List all PRs waiting for my review"
"Show PR diff for #123"
```

---

## Best Practices for GitHub MCP

### Workflow Integration

1. **Consistent Naming**: Use consistent branch and PR naming conventions
2. **Template Usage**: Develop standard prompts for your team
3. **Context Awareness**: Provide relevant context in your requests
4. **Verification**: Always review MCP suggestions before confirming

### Team Collaboration

```text
# Team-specific reviewer assignment
"Create PR and add our usual frontend reviewers: @alice, @bob, @frontend-team"

# Project-based labeling
"Create PR with labels matching our current sprint: sprint-24, feature, high-priority"
```

### Automation Workflows

```text
# Automated PR creation for releases
"Create release PR from develop to main, title 'Release v2.1.0', add all team leads as reviewers"

# Hotfix workflows
"Create hotfix PR, title 'Critical security patch', add security team, mark as urgent"
```

---

## Troubleshooting MCP Issues

### Extension Not Responding

1. **Check MCP Server Status**:
   - Open Copilot Chat
   - Click settings icon
   - Verify MCP server is "Running"

2. **Restart Extension**:
   - Command Palette → "Developer: Reload Window"
   - Or restart VS Code completely

### Authentication Problems

```text
# Check authentication in chat
"What's my GitHub authentication status?"

# Re-authenticate if needed
"Help me re-authenticate with GitHub"
```

### Command Not Understood

```text
# If MCP doesn't understand, be more explicit
Instead of: "Make a PR"
Try: "Create a GitHub pull request from my current branch to main"
```

### Limited Repository Access

```text
# Verify repository access
"Can you see my repository [repo-name]?"

# Check permissions
"What repositories do I have access to?"
```

---

## Integration with VS Code Features

### Source Control Integration

```text
"Create PR for my staged changes with commit message as PR description"
```

### File Explorer Context

```text
"Create PR including only the files I have selected in the explorer"
```

### Git Integration

```text
"Create PR for the last 3 commits on my current branch"
```

---

## Security and Privacy Considerations

### Data Handling

- MCP processes requests through GitHub's API
- Your code and PR descriptions are handled according to GitHub's privacy policy
- Sensitive information should not be included in prompts

### Best Practices

```text
# Avoid sensitive information in prompts
❌ Don't: "Create PR with API key abc123def456"
✅ Do: "Create PR for API authentication changes"
```

---

## Additional Resources

- [GitHub Copilot MCP Documentation](https://docs.github.com/en/copilot)
- [VS Code GitHub Integration](https://code.visualstudio.com/docs/sourcecontrol/github)
- [GitHub API Documentation](https://docs.github.com/en/rest)

---

## End of Guide
