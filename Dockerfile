FROM node:22.12-alpine AS builder

# Must be entire project because 'prepare' script is run during 'npm install' and requires all files
COPY . /app
WORKDIR /app

RUN --mount=type=cache,target=/root/.npm npm install

# Production image
FROM node:22.12-alpine
WORKDIR /app
COPY --from=builder /app/dist /app/dist
COPY --from=builder /app/node_modules /app/node_modules
COPY --from=builder /app/package.json /app/package.json

# Run the server
CMD ["node", "dist/index.js"]
