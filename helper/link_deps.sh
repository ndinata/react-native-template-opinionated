#!/usr/bin/env bash

# Link `realm` module
react-native link realm &> ../"$LINK_DEPENDENCIES_LOGFILE"
if [ $? -ne 0 ]; then
    echo -e "\n"
    errcho "$ERROR something went wrong when linking `realm` to React Native"
    errcho "Please check the generated \`$LINK_DEPENDENCIES_LOGFILE\` in $PROJECT_DIR."
    exit 1
fi
