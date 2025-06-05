#!/bin/bash

# Colors
RED='\e[31m'
GREEN='\e[32m'
YELLOW='\e[33m'
NC='\e[0m' 

# Required 
REQUIRED_TOOLS=("awk" "openssl" "tar")

echo -e "${YELLOW}Checking required tools...${NC}"

MISSING=false

for tool in "${REQUIRED_TOOLS[@]}"; do
    if ! command -v "$tool" > /dev/null 2>&1; then
        echo -e "${RED} $tool is not installed.${NC}"
        MISSING=true
    else
        echo -e "${GREEN} $tool is installed.${NC}"
    fi
done

if [ "$MISSING" = true ]; then
    echo -e "\n${YELLOW}Please install the missing tools manually.${NC}"
    echo -e "${YELLOW}For example, on Ubuntu/Debian:${NC}"
    echo "  sudo apt update && sudo apt install -y awk openssl tar"
    echo -e "${YELLOW}On RedHat/CentOS:${NC}"
    echo "  sudo yum install -y awk openssl tar"
    echo -e "${YELLOW}On macOS with Homebrew:${NC}"
    echo "  brew install awk openssl gnu-tar"
    exit 1
fi


TARGET_DIR="/usr/local/bin"

echo -e "${YELLOW}\n Installing lock and unlock scripts to $TARGET_DIR...${NC}"

# Check if scripts exist in current directory
if [[ ! -f ./lock || ! -f ./unlock ]]; then
    echo -e "${RED} 'lock' or 'unlock' script not found in the current directory.${NC}"
    exit 1
fi

# Make sure they are executable
chmod +x ./lock ./unlock

# Copy to target dir
sudo cp ./lock ./unlock "$TARGET_DIR/" > /dev/null 2>&1

if [[ $? -eq 0 ]]; then
    echo -e "${GREEN}Successfully installed 'lock' and 'unlock' to $TARGET_DIR ${NC}"
else
    echo -e "${RED} Failed to copy scripts. Do you have sudo permissions?${NC}"
    exit 1
fi
