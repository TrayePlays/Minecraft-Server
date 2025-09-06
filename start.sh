#!/bin/bash

# Authenticate Ngrok
/bedrock/ngrok authtoken 32LKjyztxpWmrpvdinxDjLSzRS3_7k7pZvLvVyjsKvqjYT3RM

# Start UDP tunnel and log both stdout and stderr
/bedrock/ngrok udp 19132 > /bedrock/ngrok.log 2>&1 &

# Wait for Ngrok to initialize
sleep 5

# Show tunnel info
echo "Ngrok tunnel info:"
cat /bedrock/ngrok.log

# Start Bedrock server
./bedrock_server
