#!/usr/bin/env bash

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
