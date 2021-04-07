#!/bin/sh

set -e

echo "0"
[ -z "${GITHUB_PAT}" ] && exit 0
echo "0.5"
echo "${GITHUB_REF}"
[ "${GITHUB_REF}" != "refs/heads/master" ] && exit 0

echo "0.6"
echo "${GITHUB_REPOSITORY}"

echo "1"
git config --global user.email "actions@github.com"
echo "2"
git config --global user.name "GitHub Actions"
echo "3"
rm -rf book-output/images
echo "5"
cd book-output
echo "6"
cp -r ../_book/* ./
echo "7"
git add --all *
echo "8"
git commit -m"Update the book" || true
echo "9"
git push -q origin gh-pages
echo "10"
