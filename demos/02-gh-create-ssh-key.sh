#!/bin/bash

# -----------------------------------------------------------------------------
# Script Name: 02-gh-create-ssh-key.sh
#
# Description:
#   This script generates a new SSH key pair without prompting for input and saves
#   it with a specified filename. It then adds the public key to the GitHub profile
#   using the GitHub CLI (`gh`), specifying the key type as authentication and signing.
#
# Usage:
#   Run the script directly:
#     ./02-gh-create-ssh-key.sh
#
#   The script will create an SSH key at ~/.ssh/id_rsa-atera and add the public key
#   to your GitHub account.
#
# Requirements:
#   - GitHub CLI (`gh`) must be installed and authenticated.
#   - `ssh-keygen` must be available on the system.
# -----------------------------------------------------------------------------

# Delete previous key if exists
if [ -f ~/.ssh/id_rsa-atera.pub ]; then
  gh ssh-key delete "$(cat ~/.ssh/id_rsa-atera.pub | awk '{print $2}')" --confirm
fi

# Create ssh key without asking any ting and save it with a given name aaa
ssh-keygen -y -t rsa -b 4096 -C "nirg@atera-example.com" -f ~/.ssh/id_rsa-atera -N ""

# Create a new ssh key and add it to your profile
gh ssh-key add ~/.ssh/id_rsa-atera.pub --type authentication
gh ssh-key add ~/.ssh/id_rsa-atera.pub --type signing

#SQ32+FR01kKEJscrjnONNV5Q2ouQKtZQftFIC1pFOAo
