#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# run ./deploy.sh "Your optional commit message" to send changes to karl-cottenie.github.io.

# sync the Public folder to the karl-cotttenie.github.io folder
rsync -aE -delete "./public/" "../karl-cottenie.github.io/"

# Go To karl-cottenie.github.io folder
cd ../karl-cottenie.github.io

# Add changes to git.
git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ../academic-kickstart

# Add also site creation changes to git.
# this avoids using the github commit/push dance

git add .

# Commit changes.
msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push source and build repos.
git push origin master
