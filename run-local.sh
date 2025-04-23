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

# Install dependencies if node_modules doesn't exist
if [ ! -d "node_modules" ]; then
  echo "Installing dependencies..."
  npm install
fi

# Build the TypeScript code
echo "Building TypeScript code..."
npm run build

# Run the server
echo "Running UseKeen MCP server..."
USEKEEN_API_KEY=$USEKEEN_API_KEY npm start

echo "Server stopped"
