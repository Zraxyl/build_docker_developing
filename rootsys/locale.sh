#!/bin/bash

export TOOL_MAIN_NAME=ZRAXYL
export TOOL_ENV_CHECK=none

# Simple check for build env ( Check weather were in github workflow or in dev env )
if [ -f /home/developer/$TOOL_MAIN_NAME/developing/rootsys/locale-gen ]; then
    # Github env
    export TOOL_ENV_CHECK=developing
else
    # Dev env
    export TOOL_ENV_CHECK=build/docker/developing
fi

echo "LC_ALL=en_US.UTF-8" >> /etc/environment
echo "LANG=en_US.UTF-8" > /etc/locale.conf

cp -rf /home/developer/$TOOL_MAIN_NAME/$TOOL_ENV_CHECK/rootsys/locale-gen /usr/bin
chmod +x /usr/bin/locale-gen

cp -rf /home/developer/$TOOL_MAIN_NAME/$TOOL_ENV_CHECK/rootsys/locale.gen /etc/locale.gen


locale-gen
