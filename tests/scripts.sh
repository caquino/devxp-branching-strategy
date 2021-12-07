#!/usr/bin/env bash

FILE=$(basename "$0")

function error_log() {
  LINE=$1;
  shift
  echo "::error file=${FILE},line=${LINE},col=0,endColumn=0::${*}"
  exit 1
}

if [ ! -d "${GITHUB_WORKSPACE}" ]; then
  error_log ${LINENO} "Environment variable GITHUB_WORKSPACE not set"
fi

if [ ! -d "${GITHUB_WORKSPACE}/devxp-branching-strategy/" ]; then
  error_log ${LINENO} "Folder ${GITHUB_WORKSPACE}/devxp-branching-strategy does not exist."
fi

FILES=(
  "check-branch-remote.sh"
  "exist-commits-behind.sh"
  "extract-git-release-branch.sh"
  "gen-current-semver.sh"
  "gen-release-branch-name.sh"
  "gen-release-semver.sh"
  "gen-sync-semver.sh"
  "sync-develop.sh"
)

for file in ${FILES[*]}; do
  FULLPATH="${GITHUB_WORKSPACE}/devxp-branching-strategy/${file}"
  
  if [ ! -f "${FULLPATH}" ]; then
    error_log ${LINENO} "File ${FULLPATH} does not exist."
  fi

  if [ ! -x "${FULLPATH}" ]; then
    error_log ${LINENO} "File ${FULLPATH} is not executable."
  fi
done

echo "DevXP Branshing Strategy, tested successfully."
