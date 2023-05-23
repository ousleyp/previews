#!/bin/bash
#
# prerequisites:
# * you changed the username in the `open` command (line 18) to your own
# * your openshift-docs and previews directories have the same parent
# * you are in the openshift-docs directory when running this script
# * you checked out the branch that you want to build

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
