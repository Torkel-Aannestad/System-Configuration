#!/bin/zsh

# Check if user.name and user.email are already set globally
existing_name=$(git config --global user.name)
existing_email=$(git config --global user.email)

if [[ -n "$existing_name" && -n "$existing_email" ]]; then
  echo "Git user.name and user.email are already set:"
  echo "  user.name: $existing_name"
  echo "  user.email: $existing_email"
  echo "Skipping Git configuration."
  exit 0
fi

read -r "git_user?Enter your Git user.name: "
read -r "git_email?Enter your Git user.email: "

git config --global user.name "$git_user"
git config --global user.email "$git_email"

# Set some useful Git global configs
git config --global core.editor "zed --wait"     #--wait waits for zed to close
git config --global pull.rebase true
git config --global init.defaultBranch main
git config --global credential.helper osxkeychain

echo "Git setup is complete."
