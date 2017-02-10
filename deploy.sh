#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

# Build the project.
hugo
# Grab commit message
msg="rebuilding site sources `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
# commit sources
git add -A

git commit -m "$msg"

# Go To Public folder

cd public
# Add changes to git.
git add -A

git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back
cd ..