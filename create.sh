#!/usr/bin/env bash

SCRIPT_NAME="create"
DEPENDENCIES=(node npm yarn python)
REACT_NATIVE="react-native"
PROJECT_DIR="$HOME/Desktop"
REACT_DEPENDENCIES_FILE="dependencies.txt"
REACT_DEV_DEPENDENCIES_FILE="dev-dependencies.txt"
VSCODE_SETTINGS_FILE="settings.json"
PYTHON_SCRIPT_FILE="package.py"
PYTHON_SCRIPT_TARGET_FILE="package.json"
APP_JS="App.js"
INDEX_JS="index.js"
DL_DIR=$(pwd)

# Log files
NPM_RN_CLI_LOGFILE="cna-npm-rn-cli.txt"
RN_INIT_LOGFILE="rn-init.txt"
YARN_LOGFILE="yarn-add.txt"
YARN_DEV_LOGFILE="yarn-add-dev.txt"
PRETTIER_LOGFILE="prettier.txt"
LINK_DEPENDENCIES_LOGFILE="link_deps.txt"

# Colourful output
BOLD='\033[1m'
RED='\033[31m'
GREEN='\033[32m'
BLUE='\033[34m'
NC='\033[0m'
SUCCESS="${GREEN}✔${NC}"
ERROR="${RED}Error${NC}"
ARROW="${BLUE}===>${NC}"

###############################################################################

errcho() { >&2 echo -e "$@"; }

###############################################################################

# Start intro
source helper/intro.sh

# Check if dependencies actually exist in $PATH and are executable
source helper/find_commands.sh

# Check if `react-native-cli` is installed
source helper/check_rn.sh

# Create project directory on the desktop
source helper/create_project.sh

# Install the project
source helper/install_project.sh

# Summary
source helper/summary.sh
