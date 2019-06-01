#!/usr/bin/env bash

# Install barebones RN project
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
mv ../config/"$VSCODE_SETTINGS_FILE" .vscode/
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

# Link dependencies for Realm
react-native link realm &> ../"$LINK_DEPENDENCIES_LOGFILE"
if [ $? -ne 0 ]; then
    echo -e "\n"
    errcho "$ERROR something went wrong when linking `realm` with React Native"
    errcho "Please check the generated \`$LINK_DEPENDENCIES_LOGFILE\` in $PROJECT_DIR."
    exit 1
fi

python ../"$PYTHON_SCRIPT_FILE" "$PYTHON_SCRIPT_TARGET_FILE"
mv ../config/* ../config/.[^.]* .

# Update `index.js` to import `App` from the new directory
PATTERN="import App.*"
while read -r LINE; do
    if [[ ! $LINE =~ $PATTERN ]]; then
        echo "$LINE"
    else
        echo "import App from './src/App';"
    fi
done < "$INDEX_JS" > "temp.js"
mv "temp.js" "$INDEX_JS"

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

cd "$DL_DIR"
