#!/bin/bash

# Authenticate Ngrok
/bedrock/ngrok authtoken "$NGROK_AUTHTOKEN"

# Start UDP tunnel in background
/bedrock/ngrok udp 19132 > /bedrock/ngrok.log &

# Wait for Ngrok to initialize
sleep 5

# Show tunnel info
echo "Ngrok tunnel info:"
cat /bedrock/ngrok.log

# Start Bedrock server
./bedrock_server
