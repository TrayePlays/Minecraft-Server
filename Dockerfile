FROM ubuntu:20.04

WORKDIR /bedrock

# Install dependencies
RUN apt-get update && \
    apt-get install -y libcurl4 libssl1.1 libnss3 libnss3-tools libsqlite3-0 && \
    apt-get clean

# Copy the Bedrock server files
COPY . .

# Make the server executable
RUN chmod +x bedrock_server

# Accept EULA
RUN echo "eula=true" > eula.txt

# Expose the default Bedrock port
EXPOSE 19132/udp

# Start the server
CMD ["./bedrock_server"]
