FROM ubuntu:20.04

WORKDIR /bedrock

RUN apt-get update && \
    apt-get install -y libcurl4 libssl1.1 libnss3 libsqlite3-0 && \
    apt-get clean

COPY . .

RUN chmod +x bedrock_server

RUN echo "eula=true" > eula.txt

EXPOSE 19132/udp

CMD ["./bedrock_server"]