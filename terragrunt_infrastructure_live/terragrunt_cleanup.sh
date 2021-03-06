#!/bin/bash

# you can run this locally
# this is intended to be run in a CICD pipeline as an extra defense mechanism to prevent access to sensitive files

# implementing this in an after-hook will not function properly for a terragrunt deployment with module output dependencies
# as it will leave residual sensitive files within the dependencies

# delete the terragrunt temp dirs
find . -type d -name ".terragrunt-cache" -prune -exec rm -rf {} \;

# remove all sensitive files in current and subdirectories
find . -type f -name "service_account*.json" -prune -exec rm -f {} \;