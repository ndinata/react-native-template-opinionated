#!/usr/bin/env bash

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
cp ./helper/"$PYTHON_SCRIPT_FILE" "$PROJECT_DIR"
if [ -f "$HOME/Desktop/$NPM_RN_CLI_LOGFILE" ]; then
    mv "$HOME/Desktop/$NPM_RN_CLI_LOGFILE" "$PROJECT_DIR"
fi
echo -ne "\rCreating project directory on your Desktop... Done! $SUCCESS"
echo
