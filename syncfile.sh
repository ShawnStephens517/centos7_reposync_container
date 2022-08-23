#!/bin/bash
reposync -g -l -d -m --repoid=centosplus --download-metadata --newest-only
reposync -g -l -d -m --repoid=extras --download-metadata --newest-only
reposync -g -l -d -m --repoid=updates --download-metadata --newest-only
reposync -g -l -d -m --repoid=epel --download-metadata --newest-only

#Create ISO of your updated repos
FILE=./repos.iso
if [ -e "$FILE" ]; then
    echo "$FILE exists. Removing $FILE"
    rm -rf $FILE
    echo "$FILE Removed. Recreating"
    read -t 3
    genisoimage -o repos.iso *
else 
    echo "Creating $FILE"
    genisoimage -o repos.iso *
fi

