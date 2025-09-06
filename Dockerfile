FROM ubuntu:20.04

WORKDIR /bedrock

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl unzip libcurl4 libssl1.1 libnss3 libsqlite3-0 libstdc++6 libgcc1 libz1 libpng16-16 && \
    apt-get clean

# Download and unzip Bedrock server
RUN curl -L -o bedrock.zip "https://drive.google.com/uc?export=download&id=14FwedL6bQ3MHv_-PWQUWI-LYuUyaOv1H" && \
    unzip bedrock.zip && \
    chmod +x bedrock_server

# Expose Bedrock port
EXPOSE 19132

# Start the server
CMD ["./bedrock_server"]