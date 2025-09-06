FROM ubuntu:20.04

WORKDIR /bedrock

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl unzip libcurl4 libssl1.1 libnss3 libsqlite3-0 && \
    apt-get clean

# Download the Bedrock server directly from Mojang
RUN curl -o bedrock_server.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-1.21.102.1.zip && \
    apt-get install -y unzip && \
    unzip bedrock_server.zip && \
    mv bedrock-server-1.21.102.1 bedrock_server && \
    chmod +x bedrock_server


# Accept EULA
RUN echo "eula=true" > eula.txt

# Expose the default Bedrock port
EXPOSE 19132/udp

# Start the server
CMD ["./bedrock_server"]


