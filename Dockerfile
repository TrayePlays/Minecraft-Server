# Use Ubuntu 22.04 for GLIBC compatibility
FROM ubuntu:22.04

WORKDIR /bedrock

# Install required packages
RUN apt-get update && \
    apt-get install -y curl unzip libcurl4 libssl3 libnss3 libsqlite3-0 libstdc++6 libgcc-s1 zlib1g libpng16-16 && \
    apt-get clean

# Copy Bedrock server ZIP and Ngrok binary
COPY bedrock-server-1.21.102.1.zip /bedrock.zip
COPY ngrok /ngrok
COPY start.sh /start.sh

# Make binaries executable
RUN chmod +x /ngrok /start.sh

# Unzip Bedrock server
RUN unzip /bedrock.zip && chmod +x bedrock_server

# Expose Bedrock port (UDP internally)
EXPOSE 19132/udp

# Start script launches Ngrok and Bedrock server
CMD ["/start.sh"]
