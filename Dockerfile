FROM ubuntu:20.04

WORKDIR /bedrock

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl libcurl4 libssl1.1 libnss3 libsqlite3-0 && \
    apt-get clean

# Download the binary from Google Drive
RUN curl -L -o bedrock_server "https://drive.google.com/uc?export=download&id=1czesRcc47bxpMLp-x3iC3FrO36rIoop4" && \
    chmod +x bedrock_server

# Accept EULA
RUN echo "eula=true" > eula.txt

# Expose the default Bedrock port
EXPOSE 19132/udp

# Start the server
CMD ["./bedrock_server"]
