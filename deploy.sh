#!/bin/bash

# Configuration
USER="shan"
HOST="jr7q1.seanctum.space"
DIR="/var/www/seanctum/"

# Colors for output
GREEN='\033[0;32m'
NC='\033[0m' # No Color

echo -e "${GREEN}Building Hugo site...${NC}"
# Minify to save space and bandwidth
hugo --minify

if [ $? -eq 0 ]; then
    echo -e "${GREEN}Build successful. Deploying to $HOST...${NC}"
    
    # Sync
    rsync -avz --delete public/ ${USER}@${HOST}:${DIR}
    
    echo -e "${GREEN}Deployment complete! 🚀${NC}"
else
    echo "Hugo build failed. Aborting."
    exit 1
fi
