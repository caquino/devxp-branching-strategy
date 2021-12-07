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

if [ ! -d "/devxp/" ]; then
  error_log ${LINENO} "Source folder /devxp/ does not exist"
fi

if ! mkdir -p "${GITHUB_WORKSPACE}/devxp-branching-strategy/"; then
  error_log ${LINENO} "Cannot create folder ${GITHUB_WOKSPACE}/devxp-branching-strategy/ error code $?"
fi

if ! cp /devxp/* "${GITHUB_WORKSPACE}/devxp-branching-strategy/"; then
  error_log ${LINENO} "Error copying scripts to destination directory ${GITHUB_WORKSPACE}/devxp-branching-strategy/ error code $?"
fi

if ! chmod 755 "${GITHUB_WORKSPACE}/devxp-branching-strategy/"*; then
  error_log ${LINENO} "Error cannot make scripts executable error code $?"
fi

echo "DevXP Branshing Strategy, scripts installed successfully."
