#!/usr/bin/env bash

echo -e "React Native project \"$1\" succesfully created in ${BOLD}$PROJECT_DIR${NC}!"
echo
echo -e "$ARROW ${BOLD}Log Files${NC}"
echo "Several log files were created in the project directory during the installation process. Feel free to remove them. These are:"
if [ -f "$PROJECT_DIR/$NPM_RN_CLI_LOGFILE" ]; then
    echo "- \`$NPM_RN_CLI_LOGFILE\` ——  when installing React Native CLI"
fi
echo "- \`$RN_INIT_LOGFILE\` —— when initialising React Native project"
echo "- \`$YARN_LOGFILE\` and \`$YARN_DEV_LOGFILE\` —— when installing packages with \`yarn\`"
echo "- \`$PRETTIER_LOGFILE\` —— when prettifying .js files in project directory"
if [ -f "$PROJECT_DIR/$LINK_DEPENDENCIES_LOGFILE" ]; then
    echo "- \`$LINK_DEPENDENCIES_LOGFILE\` —— when linking modules to React Native"
fi
echo
echo -e "$ARROW ${BOLD}Installing Flow${NC}"
echo "Because of .flowconfig's variable required version of \`flow-bin\`, this script opts to NOT install it automatically. Instead, you can do so yourself by checking the version number at the bottom of \$PROJECT_DIR/.flowconfig and running:"
echo
echo "    \`yarn add --dev flow-bin@x\`"
echo
echo "where \`x\` is the specified version."
echo
echo -e "$ARROW ${BOLD}Linking Dependencies${NC}"
echo "In order to complete the installation of \`react-navigation\`, follow the instructions in the following link: https://reactnavigation.org/docs/en/getting-started.html"
echo
