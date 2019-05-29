#!/usr/bin/env bash

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

# Print intro message
echo "Hello world!"
echo "This script assumes the following commands are installed and are in \$PATH:"
for dependency in "${DEPENDENCIES[@]}"; do
    echo "  - $dependency"
done
echo
