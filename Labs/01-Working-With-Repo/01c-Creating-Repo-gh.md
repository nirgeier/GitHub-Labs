# Creating a GitHub Repository Using `gh`

- This guide explains two ways to create a repository on GitHub using GitHub CLI (`gh`).
 
---

## Prerequisites

* A GitHub account ([Sign up here](https://github.com/join) if you don't have one)
* [GitHub CLI (`gh`)](https://cli.github.com/) installed
* Git installed ([Download here](https://git-scm.com/))
* Authentication with `gh auth login`

---

!!! example "Task: Create a new GitHub repository"

### 1. Authenticating with (`gh`)

* **Open your terminal** and authenticate if you haven’t already.
* Execute the following and follow the prompts to log in via browser or SSH key.
      ```bash
      gh auth login
      ```

      ```sh

      ### Authenticating with GitHub CLI
      ## You should see prompts like these:

      ? Where do you use GitHub? GitHub.com
      ? What is your preferred protocol for Git operations on this host? SSH
      ? Upload your SSH public key to your GitHub account? /Users/xxxx/.ssh/id_rsa.pub
      ? Title for your SSH key: GitHub CLI
      ? How would you like to authenticate GitHub CLI? Login with a web browser

      ! First copy your one-time code: XXXX-XXXX
      Press Enter to open https://github.com/login/device in your browser... 
      ```
  

### 2. Create a new repository:

   * Create a new repository using the following command:

      ```bash
      ### Creating a new repository
      gh repo                       \
         create my-first-repo       \
         --description "My gh repo" \
         --add-readme               \
         --public                   \
         --clone
      ```

   * You should see output like this:
    
      ```bash
      # You should see output like this:
      ✓ Created repository nirgeier/my-first-repo on github.com
      https://github.com/nirgeier/my-first-repo
      Cloning into 'my-first-repo'...
      ```

### 3. Verify creation:

   * Validate the repository creation:
  
      ```bash
      # Verify the repository exists
      gh repo view my-first-repo --web
      ```

   * This should open your new repository in your browser.

---

### Additional Resources

* [GitHub CLI Docs: `gh repo create`](https://cli.github.com/manual/gh_repo_create){target="_blank"}

