#!/bin/bash
# prerequisites:
# 
# * you set up a repo named "previews"
# * your openshift-docs and previews directories have the same parent
# * you are in the openshift-docs directory when running this script
# * you checked out the branch that you want to build
#
# usage:
#
# * for an openshift-enterprise build, run $ </path/to/script>/<file_name>.sh
# * for an OKD build, run $ <path/to/script>/<file_name>.sh okd

BRANCH=$(git branch --show-current)
GITUSER=$(git config --get remote.origin.url | sed -r 's/git@github.com://; s/\/openshift-docs.git//')

if [ $1 = "okd" ]; then
  DISTRO="openshift-origin"
  DIR="previews/okd"
else
  DISTRO="openshift-enterprise"
  DIR="previews"
fi

if [ -d ../previews/okd ]; then
  :
else
  mkdir ../previews/okd
fi

asciibinder build --distro $DISTRO

cp -r _preview/$DISTRO/$BRANCH ../$DIR
cd ../previews
git add .
git commit -m "init"
git push

cd -

echo -e "\nCheck the status of your build: https://github.com/$GITUSER/previews/actions 
\nView the preview: https://$GITUSER.github.io/$DIR/$BRANCH/welcome/"

open https://github.com/$GITUSER/previews/actions
#open https://$GITUSER.github.io/$DIR/$BRANCH/welcome/ #404s if build is not done

# next steps:
# 1. navigate to the relevant page(s) and get the link(s)
# 2. post the direct link(s) to your PR for review
# 3. regularly clean up old preview builds
