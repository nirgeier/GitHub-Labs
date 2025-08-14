
# Installing Tools 

!!! abstract "About this Guide"
    This guide will walk you through installing git, creating a GitHub account and configuring it for the first time.

## 1. Installing Git 

- First, you need to install Git locally.

!!! tip "Installing Git"

    === ":fontawesome-brands-git-alt: macOS"
        Open Terminal and run:
        ```sh
        # Requires [Homebrew](https://brew.sh/)
        brew install git
        ```

    === ":fontawesome-brands-windows: Windows"
        Download and install from [git-scm.com](https://git-scm.com/download/win).

    === ":simple-linux: Linux"
        Use your package manager, for example:
        ```sh
        sudo apt install git
        ```

## 2. Installing `gh`

- To work with GitHub from your computer, you can use the **optional** GitHub CLI (`gh`) tool to interact with GitHub directly from your terminal.
- **Click** on the section below to expand it

!!! tip "Installing GitHub CLI"

    === ":octicons-tools-24: macOS"
        Open Terminal and run:
        ```sh
        # Requires [Homebrew](https://brew.sh/)
        brew install gh
        ```

    === ":fontawesome-brands-windows: Windows"
        Download and install from [git-scm.com](https://git-scm.com/download/win).

    === ":simple-linux: Linux"
        Use your package manager, for example:
        ```sh
        sudo apt install gh
        ```

## 3. Set Up Your Git Identity

- In order to use Git and GitHub effectively, you need to configure your Git identity.
- Your Git identity is defined by your name and email address, which will be associated with your commits.
- Open your terminal and run the following commands to set your global Git configuration: 
  ```sh
  # Configure Git with your user information
  # Replace with the name and email you used for GitHub.
  git config --global user.name "<Your Name>"
  git config --global user.email "<your-email@example.com>"
  ```

    ```sh
    # Example:
    git config --global user.name "Nir Geier"
    git config --global user.email "nir.geier@gmail.com"
    ```


## 4. Tools Used

- **GitHub Web**: Web browser and GitHub account
- **GitHub CLI**: GitHub CLI installed (`gh` command)
- **GitHub MCP**: VS Code with GitHub Copilot MCP extension

---

## Feature Comparison

| Feature                | GitHub Web        | GitHub CLI        | GitHub MCP  |
| ---------------------- | ----------------- | ----------------- | ----------- |
| **Ease of Use**        | Beginner-friendly | Developer-focused | AI-assisted |
| **Speed**              | Medium            | Fast              | Very Fast   |
| **Automation**         | Limited           | High              | Very High   |
| **Customization**      | Good              | Excellent         | Good        |
| **Offline Capability** | No                | Yes               | No          |
| **Bulk Operations**    | No                | Yes               | Limited     |


