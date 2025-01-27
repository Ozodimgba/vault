#!/bin/bash

# Stop on any error
set -e

# Load environment variables from .env file
if [ -f .env ]; then
    export $(cat .env | grep -v '^#' | xargs)
else
    echo "Error: .env file not found"
    exit 1
fi

# Build the Docker image
echo "Building Docker image..."
docker build -t vault-dev .

# Run the container with environment variables
echo "Starting Vault container..."
docker run -d \
  --name vault-dev \
  --env-file .env \
  -p 8200:8200 \
  vault-dev

echo "Vault container started!"
echo "Root token: ${VAULT_DEV_ROOT_TOKEN_ID}"
echo "Vault UI available at: http://localhost:8200"