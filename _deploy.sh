#!/bin/sh

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${GITHUB_REF}" != "refs/heads/master" ] && exit 0

git config --global user.email "actions@github.com"
git config --global user.name "GitHub Actions"
rm -rf book-output/images
cd book-output
cp -r ../_book/* ./
git add --all *
git commit -m"Update the book" || true
git push -q origin gh-pages
