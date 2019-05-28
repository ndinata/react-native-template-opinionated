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

# Log files
NPM_RN_CLI_LOGFILE="cna-npm-rn-cli.txt"
RN_INIT_LOGFILE="rn-init.txt"
YARN_LOGFILE="yarn-add.txt"
YARN_DEV_LOGFILE="yarn-add-dev.txt"
PRETTIER_LOGFILE="prettier.txt"

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

# Ensure correct number of arguments
if [ $# != 1 ]; then
    echo
    errcho "$ERROR incorrect number of argument(s)"
    errcho "Usage: \`bash $SCRIPT_NAME.sh name_of_project\`"
    exit 1
else
    PROJECT_DIR="${PROJECT_DIR}/$1"
fi
echo

echo "Hello world!"
echo "This script assumes the following commands are installed and are in \$PATH:"
for dependency in "${DEPENDENCIES[@]}"; do
    echo "  - $dependency"
done
echo

# Check if dependencies actually exist in $PATH and are executable
for dependency in "${DEPENDENCIES[@]}"; do
    if ! [ -x "$(command -v $dependency)" ]; then
        errcho "$ERROR \`$dependency\` cannot be found. Make sure it's available in \$PATH."
        exit 1
    fi
done

# Check if `react-native-cli` is installed
if ! [ -x "$(command -v "$REACT_NATIVE")" ]; then
    echo "It appears \`react-native-cli\` is not installed yet."
    echo "Allow \`npm\` to install it globally? [yes|no]"
    read -p "[yes] >> " REPLY
    echo

    if [[ "$REPLY" =~ ^([nN][oO]|[nN])$ ]]; then
        echo "No problem, please come back once you've installed it yourself."
        echo "You can do so like this:"
        echo
        echo "    \`npm install -g react-native-cli\`"
        exit 0
    elif ! [[ "$REPLY" =~ ^([yY][eE][sS]|[yY])$ ]] && ! [[ -z "$REPLY" ]] ; then
        errcho "$ERROR invalid input. Please try again."
        exit 1
    fi

    echo -n "Installing \`react-native-cli\`..."
    sleep 1s
    npm install -g react-native-cli &> "$HOME/Desktop/$NPM_RN_CLI_LOGFILE"
    if [ $? -ne 0 ]; then
        echo -e "\n"
        errcho "$ERROR something went wrong when installing \`react-native-cli\`"
        errcho "Please check the generated \`$NPM_RN_CLI_LOGFILE\` on your Desktop."
        exit 1
    fi
    echo -ne "\rInstalling \`react-native-cli\`... Done! $SUCCESS"
    echo
fi

# Create project directory on the desktop
echo -n "Creating project directory on your Desktop..."
sleep 2s
if [ -d "$PROJECT_DIR" ]; then
    INDEX=1
    while [ -d "${PROJECT_DIR}$INDEX" ]; do
        INDEX=$((INDEX + 1 ))
    done
    PROJECT_DIR="${PROJECT_DIR}$INDEX"
fi
mkdir -p "$PROJECT_DIR"
cp ./"$REACT_DEPENDENCIES_FILE" "$PROJECT_DIR"
cp ./"$REACT_DEV_DEPENDENCIES_FILE" "$PROJECT_DIR"
cp ./"$VSCODE_SETTINGS_FILE" "$PROJECT_DIR"
cp -r ./config "${PROJECT_DIR}/config"
cp "$PYTHON_SCRIPT_FILE" "$PROJECT_DIR"
if [ -f "$HOME/Desktop/$NPM_RN_CLI_LOGFILE" ]; then
    mv "$HOME/Desktop/$NPM_RN_CLI_LOGFILE" "$PROJECT_DIR"
fi
echo -ne "\rCreating project directory on your Desktop... Done! $SUCCESS"
echo

# Install barebones React Native project
echo -n "Installing barebones React Native project in the project directory..."
sleep 2s
cd "$PROJECT_DIR"
react-native init "$1" &> "$RN_INIT_LOGFILE"
if [ $? -ne 0 ]; then
    echo -e "\n"
    errcho "$ERROR something went wrong when initialising React Native project"
    errcho "Please check the generated \`$RN_INIT_LOGFILE\` in $PROJECT_DIR."
    exit 1
fi
echo -ne "\rInstalling barebones React Native project in the project directory... Done! $SUCCESS"
echo

# Install packages specified in dependency files
echo -n "Installing packages specified in the dependency files..."
sleep 2s
cd "$1"
mkdir -p assets/img/
mkdir -p assets/fonts/
mkdir -p .vscode/
mv ../"$VSCODE_SETTINGS_FILE" .vscode/
while IFS= read -r LINE; do
    yarn add "$LINE" >> ../"$YARN_LOGFILE" 2>&1
    if [ $? -ne 0 ]; then
        echo -e "\n"
        errcho "$ERROR something went wrong when installing packages"
        errcho "Please check the generated \`$YARN_LOGFILE\` in $PROJECT_DIR."
        exit 1
    fi
done < ../"$REACT_DEPENDENCIES_FILE"

while IFS= read -r LINE; do
    yarn add --dev "$LINE" >> ../"$YARN_DEV_LOGFILE" 2>&1
    if [ $? -ne 0 ]; then
        echo -e "\n"
        errcho "$ERROR something went wrong when installing packages"
        errcho "Please check the generated \`$YARN_DEV_LOGFILE\` in $PROJECT_DIR."
        exit 1
    fi
done < ../"$REACT_DEV_DEPENDENCIES_FILE"

python ../"$PYTHON_SCRIPT_FILE" "$PYTHON_SCRIPT_TARGET_FILE"
mv ../config/* ../config/.[^.]* .

# Prettify .js files
npx prettier --require-pragma --config .prettierrc --write "**/*.js" &> ../"$PRETTIER_LOGFILE"
if [ $? -ne 0 ]; then
    echo -e "\n"
    errcho "$ERROR something went wrong when prettifying .js files"
    errcho "Please check the generated \`$PRETTIER_LOGFILE\` in $PROJECT_DIR."
    exit 1
fi
mkdir -p src
mv "$APP_JS" src/
echo -ne "\rInstalling packages specified in the dependency files... Done! $SUCCESS"
echo 

# Cleanup
echo -n "Cleaning up after ourselves..."
sleep 2s
cd ..
rm -rf "$REACT_DEPENDENCIES_FILE" "$REACT_DEV_DEPENDENCIES_FILE"
rm -rf config/
rm -rf "$PYTHON_SCRIPT_FILE"
echo -ne "\rCleaning up after ourselves... Done! $SUCCESS"
echo -e "\n"

# Summary
echo -e "React Native project \"$1\" succesfully created in ${BOLD}$PROJECT_DIR${NC}!"
echo
echo -e "$ARROW ${BOLD}LOG FILES${NC}"
echo "Several log files were created in the project directory during the installation process. Feel free to remove them. These are:"
if [ -f "$NPM_RN_CLI_LOGFILE" ]; then
    echo "- \`$NPM_RN_CLI_LOGFILE\` ——  when installing React Native CLI"
fi
echo "- \`$RN_INIT_LOGFILE\` —— when initialising React Native project"
echo "- \`$YARN_LOGFILE\` and \`$YARN_DEV_LOGFILE\` —— when installing packages with \`yarn\`"
echo "- \`$PRETTIER_LOGFILE\` —— when prettifying .js files in project directory"
echo
echo -e "$ARROW ${BOLD}NOTE${NC}"
echo "Because of .flowconfig's variable required version of \`flow-bin\`, this script opts to NOT install it automatically. Instead, you can do so yourself by checking the version number at the bottom of \$PROJECT_DIR/.flowconfig and running:"
echo
echo "    \`yarn add --dev flow-bin@x\`"
echo
echo "where \`x\` is the specified version."
