#!/bin/bash

set +e

REPO_EXISTS=$(aws ecr describe-repositories --repository-names "${REPOSITORY_NAME}" 2>&1)
if [[ $REPO_EXISTS == *"RepositoryNotFoundException"* ]]; then
    echo "Repository ${REPOSITORY_NAME} not found. Creating..."
    if aws ecr create-repository --repository-name ${REPOSITORY_NAME}; then
        echo "Successfully created repository ${REPOSITORY_NAME}"
    else
        echo "Failed to create repository ${REPOSITORY_NAME}"
        exit 1
    fi
else
    echo "Repository ${REPOSITORY_NAME} already exists."
fi

set -e