#!/bin/bash

# Register Runner
curl -o actions-runner-linux-x64-2.307.1.tar.gz -L https://github.com/actions/runner/releases/download/v2.307.1/actions-runner-linux-x64-2.307.1.tar.gz
tar xzf ./actions-runner-linux-x64-2.307.1.tar.gz
rm -rf ./actions-runner-linux-x64-2.307.1.tar.gz
./config.sh --url $REPO_URL --token $RUNNER_TOKEN

# Run
./run.sh