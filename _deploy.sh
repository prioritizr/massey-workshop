#!/bin/sh

set -e

echo "0"
[ -z "${GITHUB_PAT}" ] && exit 0
echo "0.5"
echo "${GITHUB_REF}"
[ "${GITHUB_REF}" != "ref/heads/master" ] && exit 0

echo "1"
git config --global user.email "jeffrey.hanson@uqconnect.edu.au"
echo "2"
git config --global user.name "jeffrey-hanson"
echo "3"
git clone -b gh-pages https://${GITHUB_PAT}@github.com/${GITHUB_REPOSITORY}.git book-output
echo "4"
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
