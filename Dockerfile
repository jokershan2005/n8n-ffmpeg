# Use Node.js Alpine as base (has apk package manager)
FROM node:20-alpine

# Install ffmpeg and other dependencies
RUN apk add --no-cache \
    ffmpeg \
    python3 \
    py3-pip \
    make \
    g++ \
    && rm -rf /var/cache/apk/*

# Install n8n globally
RUN npm install -g n8n

# Create n8n user
RUN addgroup -g 1000 node && \
    adduser -u 1000 -G node -s /bin/sh -D node

# Set working directory
WORKDIR /home/node

# Switch to node user
USER node

# Expose n8n port
EXPOSE 5678

# Start n8n
CMD ["n8n"]
