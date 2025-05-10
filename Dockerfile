FROM ubuntu:20.04
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Install required packages
RUN apt-get update && \
    apt-get install -y frotz xinetd && \
    rm -rf /var/lib/apt/lists/*

# Create game and script directories
RUN mkdir -p /games /scripts
#COPY games/zork1.dat /games/zork1.dat

# Copy in config and script
COPY zork-wrapper.sh /scripts/zork-wrapper.sh
COPY xinetd.conf /etc/xinetd.d/zork

# Make wrapper executable
RUN chmod +x /scripts/zork-wrapper.sh

# Expose telnet port
EXPOSE 23

# Default game file
ENV GAME_FILE=zork1.dat

# Start xinetd
CMD ["xinetd", "-dontfork"]
