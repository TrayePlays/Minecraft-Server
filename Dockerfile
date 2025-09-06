FROM ubuntu:22.04

WORKDIR /bedrock

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl unzip libcurl4 libssl1.1 libnss3 libsqlite3-0 libstdc++6 libgcc1 libz1 libpng16-16 && \
    apt-get clean

# Download and unzip Bedrock server
RUN curl -L -o bedrock.zip "https://github.com/TrayePlays/Minecraft-Server/releases/download/v1.0.0/bedrock-server-1.21.102.1.zip" && \
    unzip bedrock.zip && \
    chmod +x bedrock_server

# Expose Bedrock port (UDP, but Railway only supports TCP — we’ll tunnel it)
EXPOSE 19132

# Start the server
CMD ["./bedrock_server"]
