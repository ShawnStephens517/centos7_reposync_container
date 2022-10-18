#!/bin/bash
reposync -g -l -d -m -q --repoid=centosplus --download-metadata --newest-only
reposync -g -l -d -m -q --repoid=extras --download-metadata --newest-only
reposync -g -l -d -m -q --repoid=updates --download-metadata --newest-only
reposync -g -l -d -m -q --repoid=epel --download-metadata --newest-only

#Create ISO of your updated repos
FILE=./repos.iso
if [ -e "$FILE" ]; then
    echo "$FILE exists. Removing $FILE"
    rm -rf $FILE
    echo "$FILE Removed. Recreating"
    read -t 3
else 
    echo "Creating repos.tgz"
    find * -type f -daystart -mtime -1 -exec tar -czf "repos_$(date '+%m-%d-%Y').tgz" "{}" + | split -b 4092M - "repos_$(date '+%m-%d-%Y').tgz.part"
fi

