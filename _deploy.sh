#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${GITHUB_REF}" != "ref/heads/master" ] && exit 0

git config --global user.email "jeffrey.hanson@uqconnect.edu.au"
git config --global user.name "jeffrey-hanson"
git clone -b gh-pages https://${GITHUB_PAT}@github.com/${GITHUB_REPOSITORY}.git book-output
rm -rf book-output/images
cd book-output
cp -r ../_book/* ./
git add --all *
git commit -m"Update the book" || true
git push -q origin gh-pages
