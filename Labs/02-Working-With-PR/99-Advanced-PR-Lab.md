# Advanced Pull Request (PR) Lab

⚙️&emsp;This lab provides a detailed, hands-on workflow for creating, reviewing, and merging pull requests (PRs) in GitHub, following best practices for collaboration.

---

!!! experimental

  This lab is designed to help you understand and practice the *advanced features* of pull requests in GitHub.

---

## 1. Cloning the Repository

* Clone the repository you want to contribute to:

    ```bash
    # Clone the repository
    git clone https://github.com/username/repository-name.git
  
    # Navigate into the repository
    cd repository-name
    ```

---

## 2. Creating a New Branch

* Create and switch to a new branch for your feature or fix:

    ```bash
    # Create a new branch
    git checkout -b pr-lab-task01
    ```

---

## 3. Making Your Changes

* Edit files, add features, fix bugs, or update documentation as needed in your new branch.

    ```bash 
    # Make your changes
    echo "Hello, World!" > hello.txt
    # Stage your changes
    git add hello.txt
    # Commit your changes
    git commit -m "PR-Lab-01: Add hello.txt with greeting"
    ```

---

## 4. Pushing Your Branch to GitHub

* Push your branch to GitHub (first push requires `--set-upstream`):

    ```bash
    git push --set-upstream origin pr-lab-task01
    ```

---

## 5. Creating the Pull Request

  1. Go to your repository on GitHub. 
  2. You should see a `Compare & pull request` banner. 
  3. Click it, or go to the "Pull requests" tab and click `New pull request`.
  4. Fill out the PR form (Not all fields are required, but the more information you provide, the better):
      - **Base branch**: The branch you want to merge *into* (usually `main`)
      - **Compare branch**: Your feature branch
      - **Title**: Clear, concise summary of your changes
      - **Description**: Explain what and why, reference issues (e.g., `Closes #123`), add screenshots or context as needed
      - **Reviewers/Assignees/Labels**: Add as appropriate
      - **Linked Issues**: Link any related issues or PRs
  5. Review your changes and submit the PR.
  
---

## 6. Reviewing and Merging

- If you can review your code, leave comments, and some request changes
- Leave comments on specific lines of code for clarity
- Push new commits to your branch (they appear in the PR automatically)
- Approve the PR and merge it
---



## 8. Cleaning Up

After merging:

- Delete the remote branch on GitHub (GitHub will prompt you)
- Delete your local branch:

```bash
git branch -d new-feature-name
```



---

## Best Practices & Tips

- Always branch from the latest `main`/`master`
- Write clear commit messages and PR descriptions
- Reference related issues in your PR
- Respond promptly to review feedback
- Keep PRs focused and small for easier review

---

## Resources

- [GitHub Docs: About Pull Requests](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-pull-requests)
- [GitHub Flow](https://docs.github.com/en/get-started/quickstart/github-flow)
