#!/bin/bash

# Authenticate Ngrok
./ngrok authtoken "$NGROK_AUTHTOKEN"

# Start UDP tunnel in background
./ngrok udp 19132 > ngrok.log &

# Wait for Ngrok to initialize
sleep 5

# Show tunnel info
echo "Ngrok tunnel info:"
cat ngrok.log

# Start Bedrock server
./bedrock_server
