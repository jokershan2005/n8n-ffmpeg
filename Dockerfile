# Start with the official n8n image
FROM n8nio/n8n:latest

# Switch to root to install ffmpeg
USER root

# Install ffmpeg and dependencies (using apt for Debian)
RUN apt-get update && \
    apt-get install -y ffmpeg && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Switch back to node user for security
USER node

# Expose n8n port
EXPOSE 5678
