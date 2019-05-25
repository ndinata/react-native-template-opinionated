#! /usr/bin/env bash

SCRIPT_NAME="create"
DEPENDENCIES=(node npm yarn)
REACT_NATIVE="react-native"
PROJECT_DIR="$HOME/Desktop"
REACT_DEPENDENCIES_FILE="dependencies.txt"
REACT_DEV_DEPENDENCIES_FILE="dev-dependencies.txt"

###############################################################################

errcho() { >&2 echo "$@"; }

###############################################################################

# Ensure correct number of arguments
if [ $# != 1 ]; then
    errcho "Error: incorrect number of argument(s)"
    echo
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
        errcho "Error: \`$dependency\` cannot be found. Make sure it's available in \$PATH."
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
        errcho "Error: invalid input. Please try again."
        exit 1
    fi

    echo "Installing \`react-native-cli\`..."
    sleep 1s
    npm install -g react-native-cli
fi
echo

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
cp -r ./config "${PROJECT_DIR}/config"
echo -ne "\rCreating project directory on your Desktop... Done!"
echo -e "\n"

# Install bare-bones React Native project
echo "Installing bare-bones React Native project in the project directory..."
sleep 2s
cd "$PROJECT_DIR"
react-native init "$1"
echo

# Install packages specified in dependency files
echo "Installing packages specified in the dependency files..."
sleep 2s
cd "$1"
while IFS= read -r LINE; do
    yarn add "$LINE"
done < ../"$REACT_DEPENDENCIES_FILE"

while IFS= read -r LINE; do
    yarn add --dev "$LINE"
done < ../"$REACT_DEV_DEPENDENCIES_FILE"
echo

# Cleanup
echo -n "Cleaning up after ourselves..."
sleep 2s
cd ..
rm -rf "$REACT_DEPENDENCIES_FILE" "$REACT_DEV_DEPENDENCIES_FILE"
mv config/* config/.[^.]* "${1}/"
rm -rf config/
echo -ne "\rCleaning up after ourselves... Done!"
echo -e "\n"

# Summary
echo "React Native project \"$1\" succesfully created in $PROJECT_DIR!"
echo
