#!/bin/bash


#Colors
RED='\e[31m'
YELLOW='\e[33m'
GREEN='\e[32m'
NC='\e[0m' 



TARGET_DIR="/usr/local/bin"



function CheckArgument {
    if [[ -z "$1" ]]; then
        echo -e "${RED}Error: First Argument is mandatory ${NC}"
        echo -e "--------------------------------\n"
        exit 1
    fi
}

CheckArgument $1


OPTION=$1

case $OPTION in
    "build")
        echo -e "${YELLOW} Building a deb package ${NC}"
        dpkg-deb --build ./Lock ./releases/
        ;;
    "reinstall")
        bash ./uninstall.sh
        if [[ $? -eq 0 ]]; then
            echo -e "${GREEN}Successfully uninstalled 'lock' and 'unlock' from ${TARGET_DIR} ${NC}"
        else
            echo -e "${RED} Failed to remove ${NC}"
            exit 1
        fi

        bash ./install.sh

        if [[ $? -eq 0 ]]; then
            echo -e "${GREEN}Successfully installed 'lock' and 'unlock' to ${TARGET_DIR} ${NC}"
        else
            echo -e "${RED} Failed to install unknown error ${NC}"
            exit 1
        fi
        ;;
    "clean")
        echo -e "${YELLOW} TO BE IMPLEMENTED ${NC}"
        exit 0
        # Add actual commands to check status here
        ;;
    *)
        echo "Error: Invalid argument."
        echo "Usage: $0 {build|reinstall|clean}"
        exit 1
        ;;
esac