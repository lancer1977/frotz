FROM ubuntu:20.04

# Suppress interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y frotz xinetd bash && \
    rm -rf /var/lib/apt/lists/*

# Create a non-root user and group
RUN groupadd --system zork && useradd --system --gid zork --home /home/zork --create-home zork

# Create directories and set ownership
RUN mkdir -p /games /scripts && \
    chown -R zork:zork /games /scripts

# Copy scripts and config
COPY zork-wrapper.sh /scripts/zork-wrapper.sh
COPY xinetd.conf /etc/xinetd.d/zork

# Set permissions
RUN chmod +x /scripts/zork-wrapper.sh && \
    chown zork:zork /scripts/zork-wrapper.sh /etc/xinetd.d/zork

# Set environment variable
ENV GAME_FILE=zork1.dat

# Expose telnet port
EXPOSE 23

# Switch to non-root user
USER zork

# Start xinetd
CMD ["xinetd", "-dontfork"]
