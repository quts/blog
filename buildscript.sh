#!/bin/bash
hugo
cd public
git config user.email "$GIT_USER_NAME@users.noreply.github.com"
git config user.name "$GIT_USER_NAME"
git remote add publish https://$GIT_USER_NAME:$GIT_SECRET_TXT@github.com/quts/quts.github.io.git
git add .
git commit -m "Rebuild site"
git push --force publish HEAD:master
git remote remove publish
