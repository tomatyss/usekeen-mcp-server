#!/bin/bash

# Check if .env file exists
if [ ! -f .env ]; then
  echo "Error: .env file not found. Please create one based on .env.example"
  exit 1
fi

# Load environment variables from .env file
source .env

# Check if USEKEEN_API_KEY is set
if [ -z "$USEKEEN_API_KEY" ]; then
  echo "Error: USEKEEN_API_KEY is not set in .env file"
  exit 1
fi

# Build the Docker image
echo "Building Docker image..."
docker build -t usekeen-mcp .

# Run the Docker container
echo "Running UseKeen MCP server..."
docker run -e USEKEEN_API_KEY=$USEKEEN_API_KEY usekeen-mcp

echo "Server stopped"
