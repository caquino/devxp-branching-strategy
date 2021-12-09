#!/bin/bash

set -e
###
# Sync develop branch
# input brand syncReason
###
brand=${1}
syncReason=${2}
defaultBranch=${3}

echo "Brand: ${brand}"
echo "Sync Reason: $syncReason"

git checkout ${brand}/develop
git pull
nextTag=$(bash ${GITHUB_WORKSPACE}/devxp-bracnhing-strategy/gen-sync-semver.sh ${syncReason})
echo "Next tag: $nextTag"
git merge --squash "${defaultBranch}" -m "Merged ${defaultBranch} into ${brand}/develop"
git diff-index --quiet HEAD || git commit -m "Merged ${defaultBranch} into ${brand}/develop"
git tag ${nextTag}
git push origin ${brand}/develop
git push origin --tags


