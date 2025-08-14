# Adding and Tracking Changes with GitHub Pull Requests

- This guide provides a step-by-step process for adding code, reviewing commits, adding more code, reviewing updates, and adding comments in a GitHub Pull Request (PR) web site.

---

!!! explore "Task: Add more changes and review the PR"

## 1. Adding Code

1. Checkout your local branch:

    ```bash
    git checkout branch-name
    ```

2. Make changes to your local repository files.
3. Stage the changes:

    ```bash
    git add .
    ```

4. Commit the changes with a descriptive message:

    ```bash
    git commit -m "Add initial implementation of feature"
    ```

5. Push the changes to the remote branch:

    ```bash
    git push origin branch-name
    ```

---

## 2. Reviewing the Commits

1. Navigate to your GitHub repository in a web browser.
2. Open the pull request associated with your branch.
3. Click on the **Commits** tab to view all commits made to the branch.
4. Review the commit messages and details to ensure they accurately describe the changes.

!!! tip "**The PR should display the updated file contents and commit history.**"

---

## 3. Adding More Code

1. Make additional changes to your local repository files.
2. Stage the changes:

   ```bash
   git add .
   ```

3. Commit the changes with a descriptive message:

   ```bash
   git commit -m "Refactor code and fix bugs"
   ```

4. Push the new changes to the same branch:

   ```bash
   git push origin branch-name
   ```

!!! tip "**Once again, the PR should display the updated file contents and commit history.**"

---

## 4: Reviewing the Updates

1. Refresh the pull request page on GitHub.
2. Navigate to the **Files Changed** tab to review the updated changes.
3. Verify that the new changes align with the pull request's goals and do not introduce issues.

