#!/bin/bash
reposync -g -l -d -m --repoid=centosplus --download-metadata --newest-only
reposync -g -l -d -m --repoid=extras --download-metadata --newest-only
reposync -g -l -d -m --repoid=updates --download-metadata --newest-only
reposync -g -l -d -m --repoid=epel --download-metadata --newest-only