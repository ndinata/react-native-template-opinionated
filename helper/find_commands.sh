#!/usr/bin/env bash

for dependency in "${DEPENDENCIES[@]}"; do
    if ! [ -x "$(command -v $dependency)" ]; then
        errcho "$ERROR \`$dependency\` cannot be found. Make sure it's available in \$PATH."
        exit 1
    fi
done
