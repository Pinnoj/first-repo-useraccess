#!/bin/bash

# Check if the user has provided repository name
if [ $# -ne 1 ]; then
    echo "Usage: $0 <repository_name>"
    exit 1
fi

# GitHub repository name (repository in the form of <owner>/<repo_name>)
REPO_NAME=$1

# GitHub API URL for the given repository
API_URL="https://api.github.com/repos/$REPO_NAME"

# Fetch repository info using curl and parse the owner field using jq
OWNER=$(curl -s $API_URL | jq -r .owner.login)

# Check if the owner was found
if [ "$OWNER" == "null" ]; then
    echo "Repository not found or invalid repository name: $REPO_NAME"
    exit 1
fi

# Output the owner
echo "The owner of the repository '$REPO_NAME' is: $OWNER"
