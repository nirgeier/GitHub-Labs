# GitHub Essentials for Developers: Transitioning from Azure DevOps

## Session Overview

This 4-hour hands-on session is specifically crafted for experienced Git users who are transitioning from Azure DevOps to GitHub. The primary goal is to provide practical experience with GitHub's development tools, enterprise features, and team collaboration capabilities, with approximately 75% of the time dedicated to hands-on exercises.

## Goals

- Navigate GitHub's enterprise interface and understand key differences from Azure DevOps.
- Set up efficient development workflows using GitHub's integrated tools.
- Master Pull Request workflows and code review processes in GitHub.
- Practice on team collaboration within GitHub.
- Integrate GitHub with enterprise development environments and tools like IDEs.

## Prerequisites

To ensure a smooth and productive hands-on experience, please complete the following before the session:

1. **Install Git:** Ensure Git is installed and configured on your local machine. You can download it from [git-scm.com](https://git-scm.com/downloads).
2. **Install VS Code:** Download and install Visual Studio Code from [code.visualstudio.com](https://code.visualstudio.com/download).
3. **Install GitHub Pull Requests and Issues Extension for VS Code:** Open VS Code, go to the Extensions view (`Ctrl+Shift+X`), search for "GitHub Pull Requests and Issues," and install it.
4. **Sign up for GitHub.com:** Create a free GitHub account at [github.com/join](https://github.com/join) if you don't already have one.

---

# Session Modules & Hands-on Labs

## Module 1: GitHub Enterprise Setup & Development Environment (Approx. 1 Hour)

### Learning Objectives

- Understand the architectural differences between Azure DevOps and GitHub.
- Familiarize yourself with GitHub's core components: Issues, Projects, Actions, Packages.
- Configure the GitHub CLI for enterprise use.
- Explore repository management settings, permissions, and templates.
- Learn about IDE integrations and GitHub's permission models.

### Concepts Covered (Briefly, before hands-on)

- **Azure DevOps vs. GitHub:** High-level comparison of Organizations, Projects, Repositories, and their equivalents.
- **GitHub CLI:** Introduction to command-line interactions.
- **Repository Settings:** Overview of tokens, permissions, branching rules.
- **Permission Models:** RBAC, team vs. repo-level access.
- **Service Accounts:** PATs, fine-grained tokens, app integrations.
- **Code Scan & Notifications:** Quick overview.
- **GitHub Wikis & Discussions:** Purpose and basic usage.

### Hands-on Labs

#### Lab 1: GitHub CLI and Basic Repository Setup

**Install and Configure GitHub CLI:**

1. Open your terminal/command prompt.
2. Install `gh` using your OS package manager (e.g., `brew install gh` on macOS, `sudo apt install gh` on Ubuntu).
3. Run `gh auth login` and follow the prompts to authenticate with your GitHub.com account, selecting "GitHub.com" and "HTTPS" for Git operations.
4. Verify installation: `gh repo list`.

**Explore GitHub UI:**

1. Log in to GitHub.com in your browser.
2. Navigate to your profile, organizations (if any), and settings.
3. Locate the "Issues," "Pull requests," "Actions," and "Packages" tabs within a sample repository (or create a new empty one for exploration).

**Create a Templated Repo (Lab 1 from Prerequisites):**

1. Go to [github.com/new](https://github.com/new).
2. Click "Create new repository."
3. Choose "Create repository from template."
4. Search for a template like `github/template` or a simple "starter" template.
5. Give your new repository a name (e.g., `my-template-project`).
6. Ensure "Public" or "Private" is selected as desired.
7. Click "Create repository from template."

> **Discuss:** How does this differ from cloning a repo and adding files? What's the benefit of templates?

#### Lab 2: Repository Configuration (Lab 2 from Prerequisites)

**Set Branch Protection Rules:**

1. In your `my-template-project` repository, go to **Settings > Branches**.
2. Click "Add rule" under "Branch protection rules."
3. For `main` branch:
    - Check "Require a pull request before merging."
    - Check "Require approvals" and set to 1.
    - Check "Require status checks to pass before merging" (we'll add checks later).
4. Click "Create."

> **Discuss:** Why are branch protection rules crucial in an enterprise environment?

**Define CODEOWNERS:**

1. In your `my-template-project` repository, navigate to the **Code** tab.
2. Click "Add file" > "Create new file."
3. Name the file `.github/CODEOWNERS`.
4. Add content:
    ```
    # This is a CODEOWNERS file.
    # It specifies who is responsible for code in different parts of the repository.

    # Default owner for all files
    * @your-github-username # Replace with your GitHub username

    # Example: Specific owner for a 'docs' directory
    /docs/ @another-github-username # If you have a collaborator, add them here
    ```
5. Commit the new file directly to `main` (for simplicity in this lab).

> **Discuss:** How does CODEOWNERS streamline code reviews and ensure accountability?

#### Lab 3: Repository Collaboration (Docs) (Lab 3 from Prerequisites)

**Configure Wikis:**

1. In your `my-template-project` repository, go to **Settings > Features**.
2. Ensure "Wikis" is checked.
3. Click on the **Wiki** tab in your repository.
4. Click "Create your first page."
5. Add some content (e.g., "Welcome to our project wiki!").
6. Save the page.

> **Discuss:** When would you use a Wiki versus versioned documentation in the repository?

**Configure Discussions:**

1. In your `my-template-project` repository, go to **Settings > Features**.
2. Ensure "Discussions" is checked.
3. Click on the **Discussions** tab.
4. Click "New discussion."
5. Choose a category (e.g., "General").
6. Add a title and some text (e.g., "Project Brainstorming," "Ideas for next sprint").
7. Click "Start discussion."

> **Discuss:** How do Discussions differ from Issues? When would you use each?

---

## Module 2: Development Workflow & Teams Collaboration (Approx. 2 Hours)

### Learning Objectives

- Master the Pull Request (PR) creation, review, and approval processes.
- Understand various merge strategies and their implications.
- Implement and enforce security features like Code Scanning and Secret Scanning.

### Concepts Covered (Briefly, before hands-on)

- **PR Lifecycle:** Draft PRs, suggested changes, inline discussions.
- **Required Reviewers & Status Checks:** Automated quality gates.
- **Merge Strategies:** Merge commit, squash and merge, rebase and merge.
- **Protected Branches:** Reinforcing security.
- **Security Features:** CodeQL, Secret Scanning, Dependency Review (high-level).

### Hands-on Labs

#### Lab 4: Development Workflow (PR) (Lab 4 from Prerequisites)

**Create a New Feature Branch:**

1. Open `my-template-project` in VS Code.
2. Open the integrated terminal (`Ctrl+\``).
3. Run:
    ```sh
    git checkout -b feature/add-new-file
    ```

**Make Changes and Commit:**

1. Create a new file named `new-feature.txt` in the root of your repository.
2. Add some content to `new-feature.txt` (e.g., "This is my new feature!").
3. Stage and commit your changes:
    ```sh
    git add .
    git commit -m "feat: Add new feature file"
    ```

**Push Branch and Create a Pull Request (PR):**

1. Push your branch:
    ```sh
    git push -u origin feature/add-new-file
    ```
2. Go to your GitHub repository in the browser. You should see a prompt to "Compare & pull request." Click it.
3. Create a Draft PR: In the PR creation page, click the dropdown next to "Create pull request" and select "Create draft pull request."
4. Add a title (e.g., "Add new feature file") and a description.

> **Discuss:** What are the benefits of a Draft PR?

**Simulate Code Reviews & Suggested Changes:**

1. (Self-review or with a partner if available): Go to the **Files changed** tab in your Draft PR.
2. Hover over a line of code and click the + icon to add a comment.
3. Type a comment (e.g., "Consider renaming this file to reflect its purpose better.")
4. Click "Add single comment."
5. Add a Suggested Change: In a comment, type `suggestion` followed by the suggested code, then . Example:
    > Consider using a more descriptive name.
    ```suggestion
    This is the updated content for the new feature!
    ```

> **Discuss:** How do inline comments and suggested changes facilitate efficient code review?

**Convert to Open PR and Merge:**

1. Go back to the **Conversation** tab of your Draft PR.
2. Click "Ready for review."
3. As the author, you'll see the "Resolve conversation" button for your comments. Click it.
4. As the reviewer (or yourself), click "Apply suggestion" for the suggested change.
5. Simulate Approval: If you have a collaborator, ask them to approve. Otherwise, mentally "approve" it.

**Resolve Conflicts (Simulated):**

1. Go back to your main branch locally:
    ```sh
    git checkout main
    git pull origin main
    ```
2. Make a conflicting change: Edit `new-feature.txt` on the main branch directly in VS Code, e.g., add a line "This is a conflict."
3. Commit this change to main:
    ```sh
    git commit -am "chore: Introduce conflict on main"
    ```
4. Go back to your feature branch:
    ```sh
    git checkout feature/add-new-file
    ```
5. Try to rebase with main:
    ```sh
    git rebase main
    ```
    You will encounter a conflict.
6. Open `new-feature.txt` in VS Code. Use the built-in merge editor to resolve the conflict (choose "Accept Current Change" or "Accept Incoming Change" or both).
7. After resolving, stage the file:
    ```sh
    git add new-feature.txt
    git rebase --continue
    ```
8. Force push your branch (since history changed):
    ```sh
    git push --force-with-lease
    ```
9. Go back to the PR on GitHub. The conflict should be resolved.
10. Merge the PR: Once all checks pass and it's approved, click the "Merge pull request" button. Choose "Create a merge commit" for this exercise.

> **Discuss:** When would you use "Squash and merge" or "Rebase and merge"?

---

## Module 3: Security Features & General Topics (Approx. 1 Hour)

### Learning Objectives

- Enable and configure GitHub's built-in security features.
- Understand the basics of GitHub Actions for automation.
- Manage tags and releases.

### Concepts Covered (Briefly, before hands-on)

- **Code Scanning (CodeQL):** Static analysis for vulnerabilities.
- **Secret Scanning:** Preventing accidental credential exposure.
- **Dependency Review:** Understanding dependencies and their vulnerabilities.
- **GitHub Actions:** Introduction to CI/CD and automation workflows.
- **Tags and Releases:** Versioning and distribution.

### Hands-on Labs

#### Lab 5: Code Scanning & Secret Scanning (Lab 5 from Prerequisites)

**Enable Code Scanning:**

1. In your `my-template-project` repository, go to **Security > Code scanning alerts**.
2. Click "Set up Code scanning."
3. Choose "Default setup."
4. Click "Configure default setup."
5. This will automatically create a GitHub Actions workflow to run CodeQL.

**Trigger a Scan:**

1. Make a small, non-breaking code change (e.g., add a comment) to a file in your main branch and commit it. This will trigger the Code Scanning workflow.
2. Go to **Actions** tab and observe the CodeQL workflow running.
3. Once complete, check **Security > Code scanning alerts** for any findings (there might not be any for a simple repo, but you'll see the setup is active).

> **Discuss:** How does Code Scanning integrate into the PR workflow?

**Configure Secret Scanning:**

1. In your `my-template-project` repository, go to **Settings > Code security and analysis**.
2. Under "Secret scanning," ensure "Secret scanning" is enabled for your repository. If not, click "Enable."

**Simulate a Secret Leak (DO NOT USE REAL SECRETS):**

1. Create a new branch:
    ```sh
    git checkout -b feature/secret-test
    ```
2. Create a new file `secrets.txt`.
3. Add a fake API key:
    ```
    API_KEY=ghp_THISISAFakeGitHubToken1234567890ABCDEF
    ```
    (Use a pattern that GitHub's scanner recognizes, like a fake GitHub Personal Access Token prefix).
4. Commit the file:
    ```sh
    git commit -m "feat: Add a fake secret"
    ```
5. Push the branch:
    ```sh
    git push -u origin feature/secret-test
    ```
6. Go to **Security > Secret scanning alerts**. You should see an alert for the fake secret.

**Remediate:**

1. Delete the `secrets.txt` file and commit the change to the `feature/secret-test` branch. Push again.
2. Go back to the Secret Scanning alerts and mark the alert as "Resolved as fixed."

> **Discuss:** Why is Secret Scanning crucial? What are the best practices for handling secrets?

#### Lab 6: General Topics: Tags, GitHub Actions Overview, Releases

**Create a Tag:**

1. Go to your `my-template-project` repository in GitHub.
2. Click on **Code** tab, then click on the "tags" link (usually next to the branch dropdown).
3. Click "Create a new release."
4. Click "Choose a tag" and type `v1.0.0`.
5. Click "Create new tag: v1.0.0 on publish."
6. Add a release title (e.g., "First Major Release") and a description.
7. Click "Publish release."

> **Discuss:** What's the difference between a Git tag and a GitHub Release? When would you use each?

**GitHub Actions Overview (Conceptual & Quick Look):**

1. Go to the **Actions** tab in your repository.
2. Explore the workflow runs you've seen (e.g., CodeQL, or any default CI workflows).
3. Click on a workflow run to see its jobs and steps.

> **Discuss:** What are the main components of a GitHub Action workflow (events, jobs, steps, runners)? How can Actions automate your CI/CD pipeline? (No hands-on coding of Actions in this session, as it's an overview).

