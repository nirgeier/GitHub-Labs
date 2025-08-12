
# Making Changes in a GitHub Repository

- This guide explains how to make changes to files in your local copy of a GitHub repository.
- We will use new branch for our changes

---

## Prerequisites

- A cloned copy of the repository on your computer
- A text editor or IDE
- Git knowledge - working with branches

---

## Step 1: Open the Repository

* Open your terminal and navigate to the repository folder:
   ```sh
   cd <repository-name>
   ```
* Open the project in your IDE (e.g., VS Code).

---

## Step 2: Edit Files

1. Create a new branch for your changes:
   ```sh
   git checkout -b <new-branch-name>
   ```
2. Use your editor to add, modify, or delete files as needed.
3. Save your changes.

## Step 3: Stage Changes

* Stage the changes for commit:
 
      ```sh
      git add .
      ```

---

## Step 4: Check Status

* Track changes made on your branch:

1. In the terminal, run:
   ```sh
   git status
   ```
2. In your IDE, check the Git panel to see the changes.

---

## Step 5: Commit the Changes

1. Run the following command, replacing the message with a short description of your changes:
   ```sh
   git commit -m "Your commit message here"
   ```

---

## Step 6: Check Commit History

- To view your commit history, run:
  ```sh
  git log --oneline
  ```

---

## Step 7: Check Remote Repository

* In your terminal, run:
   ```sh
   git remote -v
   ```
* Ensure the correct remote URL is set (usually named `origin`).

---

## Step 8: Push Your Changes

* To push your changes to the main branch, run:
   ```sh
   git push origin <branch-name>
   ```
* You will be prompted to set the upstream branch.
* Follow the on-screen instructions to complete the process.

---

## Step 9: Verify on GitHub

1. Go to your repository page on GitHub.
2. Confirm that you see your branch listed in the branch dropdown or in the main branch view.

