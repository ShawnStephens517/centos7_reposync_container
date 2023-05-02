#!/bin/bash
reposync -g -l -d -m --repoid=centosplus --download-metadata --newest-only
reposync -g -l -d -m --repoid=extras --download-metadata --newest-only
reposync -g -l -d -m --repoid=updates --download-metadata --newest-only
reposync -g -l -d -m --repoid=fasttrack --download-metadata --newest-only

reposync -g -l -d -m --repoid=elrepo --newest-only --download-metadata
reposync -g -l -d -m --repoid=elrepo-extras --newest-only --download-metadata 
reposync -g -l -d -m --repoid=elrepo-kernel --newest-only --download-metadata
#reposync -g -l -d -m --repoid=elrepo-testing --newest-only --download-metadata

reposync -g -l -d -m --repoid=epel --download-metadata --newest-only
#reposync -g -l -d -m --repoid=epel-debuginfo --newest-only --download-metadata 
#reposync -g -l -d -m --repoid=epel-testing --newest-only --download-metadata 
#reposync -g -l -d -m --repoid=epel-testing-debuginfo --newest-only --download-metadata 
reposync -g -l -d -m --repoid=epel-extras --newest-only --download-metadata
reposync -g -l -d -m --repoid=os --newest-only --download-metadata
reposync -g -l -d -m --repoid=base --newest-only --download-metadata

#reposync -g -l -d -m --repoid=pgdg96 --newest-only --download-metadata 

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

