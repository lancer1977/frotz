#FROM alpine:3.20
FROM ubuntu:20.04
# Install dependencies
RUN apk update && \
    apk add --no-cache frotz xinetd bash

# Create a non-root user and group
RUN addgroup -S zork && adduser -S zork -G zork

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
