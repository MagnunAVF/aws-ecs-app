#!/bin/bash

set +e

BRANCH_NAME=${1:-${GITHUB_REF_NAME}}

if [ -z "$BRANCH_NAME" ]; then
  echo "Error: Branch name not provided and GITHUB_REF_NAME not set"
  echo "Usage: ./get_tf_vars.sh [branch_name]"
  exit 1
fi

TARGET_DIR="terraform/environment/${BRANCH_NAME}"

mkdir -p "${TARGET_DIR}"

echo "Downloading configuration files for branch: ${BRANCH_NAME}"

echo "Downloading backend.tfvars ..."
aws s3 cp "${S3_TF_BACKEND_URI}" "${TARGET_DIR}/backend.tfvars"

echo "Downloading terraform.tfvars ..."
aws s3 cp "${S3_TF_TERRAFORM_URI}" "${TARGET_DIR}/terraform.tfvars"

echo "Configuration files successfully downloaded to ${TARGET_DIR}"

set -e
