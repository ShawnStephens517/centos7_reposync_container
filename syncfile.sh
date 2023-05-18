#!/bin/bash

# Define array of repo names
REPOS=("base" "centosplus" "extras" "updates" "fasttrack" "elrepo" "elrepo-extras" "elrepo-kernel" "epel" "epel-extras" "os","pgdg96","pgdg10","pgdg11","pgdg12","pgdg13","pgdg14")

# Download packages from each repo
for REPO in "${REPOS[@]}"; do
    reposync -g -l -d -m --repoid=$REPO --newest-only --download-metadata
done

# Create a tarball of files that were modified within the last 30 days
find * -type f -mtime -30 -print0 | xargs -0 tar -czf "repos_$(date '+%m-%d-%Y').tgz"

# Split the tarball into chunks
split -b 4096M -d -a 3 "repos_$(date '+%m-%d-%Y').tgz" "repos_$(date '+%m-%d-%Y').tgz.part"
