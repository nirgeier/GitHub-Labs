# Opening Pull Requests: Complete Guide {.css-random-1}

This guide provides a comprehensive overview of creating pull requests using three different methods. Each method has its own detailed guide for in-depth learning.

---

## Overview

Pull requests are a fundamental part of collaborative software development. They allow you to propose changes, discuss them with your team, and merge them into the main codebase after review. This lab covers three primary methods for creating pull requests:

1. **GitHub Web Interface** - Visual, user-friendly approach
2. **GitHub CLI** - Command-line efficiency for developers
3. **GitHub MCP Extension** - AI-powered natural language approach

---

## Prerequisites

- A repository with at least one branch containing changes
- Proper authentication setup with GitHub
- Basic understanding of Git branching concepts

### Method-Specific Requirements

- **GitHub Web**: Web browser and GitHub account
- **GitHub CLI**: GitHub CLI installed (`gh` command)
- **GitHub MCP**: VS Code with GitHub Copilot MCP extension

---

## Method Comparison

| Feature                | GitHub Web        | GitHub CLI        | GitHub MCP  |
| ---------------------- | ----------------- | ----------------- | ----------- |
| **Ease of Use**        | Beginner-friendly | Developer-focused | AI-assisted |
| **Speed**              | Medium            | Fast              | Very Fast   |
| **Automation**         | Limited           | High              | Very High   |
| **Customization**      | Good              | Excellent         | Good        |
| **Offline Capability** | No                | Yes               | No          |
| **Bulk Operations**    | No                | Yes               | Limited     |

---

## Detailed Method Guides

### [Method 1: GitHub Web Interface](02a-Opening-PR-GitHub-Web.md)

**Best for**: Beginners, visual learners, occasional contributors

**Key Features**:
- Visual interface with guided workflow
- Real-time preview of changes
- Integrated with GitHub's collaboration features
- Template support and rich text editing

**When to Use**:
- First time creating pull requests
- Making documentation changes
- Quick fixes and small changes
- When you need visual diff review

[👉 Read the complete GitHub Web Interface guide](02a-Opening-PR-GitHub-Web.md)

---

### [Method 2: GitHub CLI](02b-Opening-PR-GitHub-CLI.md)

**Best for**: Developers, automation enthusiasts, power users

**Key Features**:
- Command-line efficiency
- Scriptable and automatable
- Bulk operations support
- Integration with shell workflows

**When to Use**:
- Daily development workflow
- Automation and scripting
- Bulk PR operations
- Terminal-based development environment

[👉 Read the complete GitHub CLI guide](02b-Opening-PR-GitHub-CLI.md)

---

### [Method 3: GitHub MCP Extension](02c-Opening-PR-GitHub-MCP.md)

**Best for**: AI-powered workflows, natural language interactions

**Key Features**:
- Natural language commands
- AI-assisted PR creation
- Context-aware suggestions
- Integration with VS Code

**When to Use**:
- Rapid PR creation
- Complex PR metadata setup
- Learning GitHub workflows
- AI-enhanced development experience

[👉 Read the complete GitHub MCP Extension guide](02c-Opening-PR-GitHub-MCP.md)

---

## Common Workflow: Adding Code After PR Creation

Regardless of which method you use to create the PR, you can add new code and updates using any of these approaches:

### Direct Git Commands

```sh
# Make changes to your files
git add .
git commit -m "Address review feedback"
git push origin feature-branch
```

The PR will automatically update with new commits.

### Cross-Method Updates

- **Create with Web** → Update with CLI commands
- **Create with CLI** → Add commits via Web interface
- **Create with MCP** → Push updates using Git

---

## Best Practices Across All Methods

### PR Title Guidelines

- Use imperative mood: "Add feature" not "Added feature"
- Keep it concise but descriptive
- Include ticket numbers: "Fix #123: Resolve login issue"

### PR Description Template

```markdown
## Summary
Brief description of what this PR does

## Type of Change
- [ ] Bug fix
- [ ] New feature
- [ ] Breaking change
- [ ] Documentation update

## Changes Made
- Detailed list of changes
- Each change as a bullet point

## Testing
- [ ] Unit tests added/updated
- [ ] Integration tests pass
- [ ] Manual testing completed

## Related Issues
Closes #123
Related to #456
```

### Universal Best Practices

1. **Self-review first**: Review your own code before requesting reviews
2. **Keep PRs focused**: One feature or fix per PR
3. **Write clear commit messages**: Each commit should be atomic
4. **Add tests**: Include relevant tests for your changes
5. **Update documentation**: Keep docs in sync with code changes

---

## Troubleshooting Common Issues

### PR Not Showing Changes

```sh
# Ensure you've pushed your branch
git push origin feature-branch-name

# Check if you're comparing the right branches
git branch -a
```

### Cannot Create PR

1. **Permission issues**: Ensure you have write access to the repository
2. **No changes**: Verify your branch has commits different from the base branch
3. **Same branch**: Cannot create PR from a branch to itself

### PR Shows Too Many Changes

1. **Wrong base branch**: Ensure you're comparing against the correct base
2. **Outdated branch**: Your branch might be behind the base branch

```sh
# Update your branch
git checkout main
git pull origin main
git checkout your-feature-branch
git rebase main
git push --force-with-lease origin your-feature-branch
```

---

## Choosing the Right Method

### For Beginners
Start with **GitHub Web Interface** to understand the PR process visually, then gradually move to other methods as you become more comfortable.

### For Daily Development
Use **GitHub CLI** for efficient, repeatable workflows that integrate well with your terminal-based development environment.

### For AI-Enhanced Workflows
Try **GitHub MCP Extension** when you want to leverage AI assistance and natural language commands for faster PR creation.

### Hybrid Approach
Many developers use a combination:
- **MCP/CLI** for creating PRs quickly
- **Web Interface** for detailed review and collaboration
- **CLI** for bulk operations and automation

---

## Next Steps

After mastering PR creation, proceed to:
- [Working with PR Reviews](03-Working-With-PR-Reviews.md)
- Advanced Git workflows
- Continuous Integration with PRs
- Team collaboration best practices

---

## Additional Resources

- [GitHub PR Documentation](https://docs.github.com/en/pull-requests)
- [GitHub CLI Manual](https://cli.github.com/manual/)
- [GitHub Copilot Documentation](https://docs.github.com/en/copilot)
- [Best Practices for Pull Requests](https://github.blog/2015-01-21-how-to-write-the-perfect-pull-request/)

---

## End of Guide
