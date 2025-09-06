FROM ubuntu:22.04

WORKDIR /bedrock

# Install required packages
RUN apt-get update && \
    apt-get install -y curl unzip libcurl4 libssl3 libnss3 libsqlite3-0 libstdc++6 libgcc-s1 zlib1g libpng16-16 && \
    apt-get clean

# Download Bedrock server ZIP
RUN curl -L -o bedrock.zip "https://github.com/TrayePlays/Minecraft-Server/releases/download/v1.0.0/bedrock-server-1.21.102.1.zip"

# Unzip and make server executable
RUN unzip bedrock.zip && chmod +x bedrock_server

# Copy Ngrok binary and start script into container
COPY ngrok /bedrock/ngrok
COPY start.sh /bedrock/start.sh
RUN chmod +x /bedrock/ngrok /bedrock/start.sh

# Expose Bedrock port internally
EXPOSE 19132/udp

# Launch tunnel and server
CMD ["/bedrock/start.sh"]
