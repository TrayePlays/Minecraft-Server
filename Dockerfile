FROM ubuntu:20.04

WORKDIR /bedrock

# Install required dependencies
RUN apt-get update && \
    apt-get install -y libcurl4 libssl1.1 libnss3 libsqlite3-0 && \
    apt-get clean

# Copy all server files into the container
COPY . .

# Ensure the server binary is executable
RUN chmod +x bedrock_server

# Accept the EULA
RUN echo "eula=true" > eula.txt

# Expose the default Bedrock UDP port
EXPOSE 19132/udp

# Start the server
CMD ["./bedrock_server"]
