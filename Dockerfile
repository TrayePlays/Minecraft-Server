FROM ubuntu:20.04

WORKDIR /bedrock

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl unzip libcurl4 libssl1.1 libnss3 libsqlite3-0 && \
    apt-get clean

# Download and extract Bedrock server
RUN curl -o bedrock_server.zip https://minecraft.azureedge.net/bin-linux/bedrock-server-1.21.102.1.zip && \
    unzip bedrock_server.zip && \
    mv bedrock-server-1.21.102.1 bedrock_server && \
    chmod +x bedrock_server

# Accept EULA
RUN echo "eula=true" > eula.txt

EXPOSE 19132/udp

CMD ["./bedrock_server"]
