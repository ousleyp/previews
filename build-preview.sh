#!/bin/bash

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
#open https://$GITUSER.github.io/$DIR/$BRANCH/welcome/
