#!/bin/sh

if ! command -v minikube &> /dev/null; then
  echo "minikube does not exist or is not in path"
  exit
fi

if ! command -v expect &> /dev/null; then
  echo "expect does not exist or is not in path"
  exit
fi

if [[ -z "$HARBOR_QHCR_URL" ]]; then
  echo "Harbor Quarantine Zone URL (HARBOR_QHCR_URL environment variable) not set"
  exit
fi

if [[ -z "$HARBOR_USER_Q" ]]; then
  echo "Harbor user name QHCR (HARBOR_USER_Q environment variable) not set"
  exit
fi

if [[ -z "$HARBOR_PASS_Q" ]]; then
  echo "Harbor password QHCR (HARBOR_PASS_Q environment variable) not set"
  exit
fi

minikube delete
minikube start

expect << _EOF_
set timeout -1

spawn minikube addons configure registry-creds

expect "Do you want to enable AWS Elastic Container Registry?"
send "n\r"

expect "Do you want to enable Google Container Registry?"
send "n\r"

expect "Do you want to enable Docker Registry?"
send "y\r"

expect "Enter docker registry server url:"
send "dpdhl.css-qhcr-pi.azure.deutschepost.de\r"

expect "Enter docker registry username:"
send "${HARBOR_USER_Q}\r"

expect "Enter docker registry password:"
send "${HARBOR_PASS_Q}\r"

expect "Do you want to enable Azure Container Registry?"
send "n\r"

expect eof
_EOF_

minikube addons enable registry-creds


