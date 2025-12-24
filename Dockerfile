# Start with the official n8n image
FROM n8nio/n8n:latest

# Switch to root to install ffmpeg
USER root

# Install ffmpeg and dependencies
RUN apk add --no-cache \
    ffmpeg \
    && rm -rf /var/cache/apk/*

# Switch back to node user for security
USER node

# Expose n8n port
EXPOSE 5678
