#!/bin/bash
#
# prerequisites:
# 0. change the username in the `open` command to your own
# 1. cd to your openshift-docs directory
# 2. check out the branch that you want to build
# 3. run this script from the openshift-docs directory

asciibinder

BRANCH=$(git branch --show-current) 

cp -r _preview/openshift-enterprise/$BRANCH ../previews
cd ../previews
git add .
git commit -m "init"
git push
open https://ousleyp.github.io/previews/$BRANCH/welcome/

# next steps:
# 1. navigate to the relevant page(s) and get the link(s)
# 2. post the direct link(s) to your PR for review
# 3. regularly clean up old preview builds
