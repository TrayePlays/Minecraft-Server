#!/bin/bash

# Authenticate Ngrok
/bedrock/ngrok authtoken "$NGROK_AUTHTOKEN"

# Start UDP tunnel and log both stdout and stderr
/bedrock/ngrok udp 19132 > /bedrock/ngrok.log 2>&1 &

# Wait for Ngrok to initialize
sleep 5

# Show tunnel info
echo "Ngrok tunnel info:"
cat /bedrock/ngrok.log

# Start Bedrock server
./bedrock_server
