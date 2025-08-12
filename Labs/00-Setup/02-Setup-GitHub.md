# Setup GitHub

!!! note "About this Guide"
    This guide will walk you through setting up your GitHub account and configuring it for the first time.

### 1. Create GitHub Account

1. Go to [https://github.com/](https://github.com/){target="_blank"}.
2. Click **Sign up** in the top-right corner.
3. Enter your email address and click **Continue**.
4. Create a strong password and click **Continue**.
5. Choose a username (this will be your public identity on GitHub).
6. Follow the prompts to verify your account (you may need to solve a puzzle or enter a code sent to your email).
7. Choose your plan (the free plan is sufficient for most users).
8. Complete the setup by answering a few questions (optional) and click **Complete setup**.

### 2. Verify Your Email Address

1. Check your email inbox for a message from GitHub.
2. Click the verification link in the email to activate your account.

### 3. Set Up Your Profile

1. Click your profile icon in the top-right and select **Your profile**.
2. Click **Edit profile** to add your name, bio, location, and profile picture.
3. Save your changes.

### 4. Generate SSH Key 

- When working with Git and GitHub, it's a good idea to set up SSH keys for secure authentication.
- SSH keys are a pair of cryptographic keys that can be used to authenticate to GitHub without needing to enter your username and password every time.

* In your terminal, run:
  ```sh
  # Generate a new SSH key
  # -C is optional for email association with your GitHub account
  ssh-keygen -t rsa -C "your-email@example.com"
  ```

* This will create two files:
  
    | File                      | Description                         |
    | ------------------------- | ----------------------------------- |
    | :lock: `~/.ssh/id_rsa`    | Your private key (keep this secret) |
    | :key: `~/.ssh/id_rsa.pub` | Your public key (can be shared)     |


    ```sh {8}
    # Example output
    $ ssh-keygen -t rsa -C "your-email@example.com"
    Generating public/private rsa key pair.
    Enter file in which to save the key (/root/.ssh/id_rsa): 
    Enter passphrase (empty for no passphrase): 
    Enter same passphrase again: 
    Your identification has been saved in /root/.ssh/id_rsa
    Your public key has been saved in /root/.ssh/id_rsa.pub <<< <<< <<< This is the key you need
    The key fingerprint is:
    SHA256:47MfTsMWlEN8PYpSGvYWlLd4u4fE4njqHrs53+oxEZM your-email@example.com
    The key`s randomart image is:
    +---[RSA 3072]----+
    |         oo. .   |
    |        o.=oo o  |
    |       . =E* o . |
    |        o.=++    |
    |        Sooo .   |
    |       . o.o+    |
    |        +oOo o   |
    |        oXo*o .  |
    |       oOO*...   |
    +----[SHA256]-----+
    ```

   * Press Enter to accept the default file location and do not set a passphrase or you will be prompted to enter it each time you use the key.
   
### 5. Add your SSH to ssh-agent

* If you are using Windows, make sure you have [Git Bash](https://gitforwindows.org/) installed.
* If you are using Linux, make sure you have the `ssh-agent` package installed.
* If you are using macOS, you can use the built-in `ssh-agent`.
  * Open Terminal and run:
    ```sh
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa
    ```

### 6. Add your SSH to GitHub

1. Copy your public key to your clipboard:
  ```sh
  pbcopy < ~/.ssh/id_rsa.pub  # macOS
  cat ~/.ssh/id_rsa.pub       # Linux/Windows, then copy manually
  ```
2. Go to GitHub site > **Settings** > **SSH and GPG keys** > **New SSH key**.
3. Paste your key, give it a title, and save.

!!! warn "Adding ssh key using gh"
    
    * You can also use gh using: `gh repo deploy-key`
    * docs:   
    :orange_book:&emsp;[https://cli.github.com/manual/gh_ssh-key_add](https://cli.github.com/manual/gh_ssh-key_add){target="_blank"}   
    :orange_book:&emsp;[https://cli.github.com/manual/gh_repo_deploy-key](https://cli.github.com/manual/gh_repo_deploy-key){target="_blank"}

### 7. Test Your Setup

* Run the following command to test your SSH connection:

    ```sh
    ssh -T git@github.com
    ```

* You should see a message like:

    ```
    Hi <username>! You've successfully authenticated, but GitHub does not provide shell access.
    ```
