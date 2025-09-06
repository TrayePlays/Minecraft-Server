FROM ubuntu:20.04

WORKDIR /bedrock

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl unzip libcurl4 libssl1.1 libnss3 libsqlite3-0 libstdc++6 libgcc1 libz1 libpng16-16 && \
    apt-get clean

# Copy the helper script
COPY gdrive_download.sh /gdrive_download.sh
RUN chmod +x /gdrive_download.sh

# Use the script to download and unzip the Bedrock server
RUN /gdrive_download.sh 14FwedL6bQ3MHv_-PWQUWI-LYuUyaOv1H bedrock.zip && \
    unzip bedrock.zip && \
    chmod +x bedrock_server

EXPOSE 19132

CMD ["./bedrock_server"]
