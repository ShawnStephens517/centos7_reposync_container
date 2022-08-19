# Reposyncer

## Project Overview
This project is used to maintain offline Yum Repos. The included syncfile.sh is a collection
of reposync commands for common update repos (EPEL, Updates, Extras). I run the following command
on the build machine (local OS)
```
docker run -w /repos --rm -it -v ~/Desktop/Patches/:/repos centos_reposync:7.9 sh /tmp/syncfile.sh
```
