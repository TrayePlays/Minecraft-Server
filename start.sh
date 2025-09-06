#!/bin/bash

# Start Playit tunnel in background
/bedrock/playit > /bedrock/playit.log 2>&1 &

# Wait for tunnel to initialize
sleep 5

# Show tunnel info
echo "Playit tunnel info:"
cat /bedrock/playit.log

# Start Bedrock server
./bedrock_server