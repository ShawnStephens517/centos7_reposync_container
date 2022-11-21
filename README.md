# Reposyncer
[![Docker](https://github.com/ShawnStephens517/centos7_reposync_container/actions/workflows/docker-publish.yml/badge.svg?branch=main)](https://github.com/ShawnStephens517/centos7_reposync_container/actions/workflows/docker-publish.yml)
## Project Overview
This project is used to maintain offline Yum Repos. The included syncfile.sh is a collection
of reposync commands for common update repos (EPEL, Updates, Extras). I run the following command
on the build machine (local OS)
```
docker run -w /repos --rm -it -v ~/Desktop/Patches/:/repos ghcr.io/shawnstephens517/centos7_reposync_container:main sh /tmp/syncfile.sh
```

**_Modify Source Path_**
```
~/Deskop/Patches
```
_This is where you want to store the repos on your local OS_
