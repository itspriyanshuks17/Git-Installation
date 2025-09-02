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

  echo "Select a file to commit:"
  for i in "${!files[@]}"; do
    printf "  %d. %s\n" $((i+1)) "${files[$i]}"
  done
  echo "  0. Exit"
  echo
  read -p "Enter your choice (number): " choice
  if [[ "$choice" == "0" ]]; then exit 0; fi
  if [[ ! "$choice" =~ ^[0-9]+$ ]] || (( choice < 1 || choice > ${#files[@]} )); then
    echo "Invalid selection."
    read -p "Press Enter to continue..." _
    continue
  fi
  filename="${files[$((choice-1))]}"
  echo
  read -p "Enter commit message: " msg
  if [ -z "$msg" ]; then msg="update $filename"; fi
  git add "$filename"
  git commit -m "$msg"
  echo
  read -p "Push to GitHub now? (y/n): " pushnow
  if [[ "$pushnow" =~ ^[Yy]$ ]]; then
    git push origin main
  fi
  echo
  read -p "Commit complete. Press Enter to continue..." _
done
