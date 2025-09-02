#!/bin/bash
# Git Commit & Push Menu Script (for bash/sh)

while true; do
  clear
  echo "==============================="
  echo "  Git Commit & Push Menu"
  echo "==============================="
  git status --short
  echo

  # Get list of changed files
  mapfile -t files < <(git status --porcelain | awk '{print $2}')
  if [ ${#files[@]} -eq 0 ]; then
    echo "No changes to commit."
    read -p "Press Enter to exit..." _
    exit 0
  fi

  echo "Select file(s) to commit (separate numbers with space or comma):"
  for i in "${!files[@]}"; do
    printf "  %d. %s\n" $((i+1)) "${files[$i]}"
  done
  echo "  0. Exit"
  echo
  read -p "Enter your choice(s): " choice
  if [[ "$choice" =~ (^|[ ,])0($|[ ,]) ]]; then exit 0; fi
  # Normalize input: replace commas with spaces
  choice="${choice//,/ }"
  # Validate all choices
  valid=1
  for num in $choice; do
    if [[ ! "$num" =~ ^[0-9]+$ ]] || (( num < 1 || num > ${#files[@]} )); then
      valid=0
    fi
  done
  if [[ $valid -eq 0 ]]; then
    echo "Invalid selection."
    read -p "Press Enter to continue..." _
    continue
  fi
  # Build list of selected files
  selected_files=()
  for num in $choice; do
    selected_files+=("${files[$((num-1))]}")
  done
  echo
  read -p "Enter commit message: " msg
  if [ -z "$msg" ]; then msg="update ${selected_files[*]}"; fi
  git add "${selected_files[@]}"
  git commit -m "$msg"
  echo
  read -p "Push to GitHub now? (y/n): " pushnow
  if [[ "$pushnow" =~ ^[Yy]$ ]]; then
    # Ask for branch name, default to current branch
    current_branch=$(git rev-parse --abbrev-ref HEAD)
    read -p "Enter branch to push to [${current_branch}]: " branch
    if [ -z "$branch" ]; then branch="$current_branch"; fi
    git push origin "$branch"
  fi
  echo
  read -p "Commit complete. Press Enter to continue..." _
done
