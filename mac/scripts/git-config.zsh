#!/bin/zsh

# Check if user.name and user.email are already set globally
existing_email=$(git config --global user.email)

#Set or update user.name
git config --global user.name "Torkel Aannestad"

# Set or update some git options
git config --global core.editor "vim"     #zed --wait waits for zed/vs code to close
git config --global pull.rebase true
git config --global init.defaultBranch main
git config --global credential.helper osxkeychain

#If email not in config, read from input (to not include email in repo)
if [[ -n "$existing_email" ]]; then
  echo "Git user.email is already set"
  echo "  user.email: $existing_email"
  echo "Skipping updating user.email"
  exit 0
fi
read -r "git_email?Enter your Git user.email: "
git config --global user.email "$git_email"

echo "Git setup is complete."
