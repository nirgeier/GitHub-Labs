# Opening Pull Requests via GitHub Web Interface {.css-random-1}

This guide explains how to create pull requests using the GitHub web interface. This is the most visual and user-friendly method for creating pull requests.

---

## Prerequisites

- A repository with at least one branch containing changes
- Proper authentication setup with GitHub
- Your feature branch has been pushed to the remote repository

---

## 1: Navigate to Repository

1. Go to your repository on GitHub.com
2. Ensure your feature branch has been pushed to the remote repository

---

## 2: Create Pull Request

1. Click the **"Compare & pull request"** button (appears automatically after pushing a new branch)
   
   **OR**
   
2. Navigate manually:
   - Click the **"Pull requests"** tab
   - Click **"New pull request"**
   - Select the base branch (usually `main` or `master`)
   - Select your feature branch as the compare branch

---

## 3: Fill Pull Request Details

1. **Title**: Provide a clear, descriptive title

   ```text
   Example: Add user authentication feature
   ```

2. **Description**: Include detailed information:

   ```markdown
   ## Description
   This PR implements user authentication using JWT tokens.
   
   ## Changes Made
   - Added login/logout functionality
   - Implemented JWT token validation
   - Added user session management
   
   ## Testing
   - [x] Unit tests pass
   - [x] Manual testing completed
   - [x] No breaking changes
   
   ## Screenshots
   (Add relevant screenshots if applicable)
   ```

3. **Assignees**: Assign yourself or team members
4. **Reviewers**: Add code reviewers
5. **Labels**: Add appropriate labels (feature, bugfix, etc.)
6. **Projects**: Link to project boards if applicable
7. **Milestone**: Associate with project milestones

---

## 4: Submit Pull Request

1. Choose PR type:
   - **"Create pull request"** for ready-to-review PRs
   - **"Create draft pull request"** for work-in-progress
2. Click the button to create the PR

---

## Managing PR via GitHub Web

### Updating PR Title and Description

1. Go to your PR
2. Click the edit button next to title/description
3. Make changes and save

### Adding Reviewers and Assignees

1. Use the sidebar on the PR page
2. Click gear icons next to "Reviewers" and "Assignees"
3. Select users from the dropdown

### Adding New Code After PR Creation

1. Navigate to your PR
2. Click **"Add more commits"** or edit files directly on GitHub
3. Use the web editor to make small changes
4. Commit directly to the PR branch

### Viewing Changes

1. Go to your pull request
2. Click the **"Files changed"** tab
3. Review the diff view showing:
   - Added lines (green)
   - Removed lines (red)
   - Modified lines (yellow background)

---

## Best Practices for GitHub Web Interface

### Using the Web Editor Effectively

- Use for small changes and quick fixes
- Good for documentation updates
- Ideal for reviewing and suggesting changes
- Limited for complex code changes

### Branch Protection Integration

- The web interface shows all required status checks
- Displays merge conflicts clearly
- Shows required reviews status
- Integrates with branch protection rules

### Collaboration Features

- Use @mentions to notify team members
- Link to issues using #issue-number
- Use project boards integration
- Leverage milestone tracking

---

## Troubleshooting

### PR Not Appearing

1. **Check branch push**: Ensure your branch is pushed to the remote repository

   ```sh
   git push origin feature-branch-name
   ```

2. **Verify repository access**: Ensure you have proper permissions

### Cannot Create PR

1. **Permission issues**: Ensure you have write access to the repository
2. **No changes**: Verify your branch has commits different from the base branch
3. **Same branch**: Cannot create PR from a branch to itself

### Missing Compare Button

1. The "Compare & pull request" button only appears for recently pushed branches
2. Use the manual method: Pull requests tab → New pull request
3. Ensure you're viewing the correct repository

---

## Additional Resources

- [GitHub PR Documentation](https://docs.github.com/en/pull-requests)
- [GitHub Web Editor Guide](https://docs.github.com/en/repositories/working-with-files/managing-files/editing-files)
- [Branch Protection Rules](https://docs.github.com/en/repositories/configuring-branches-and-merges-in-your-repository/defining-the-mergeability-of-pull-requests/about-protected-branches)

---

## End of Guide
