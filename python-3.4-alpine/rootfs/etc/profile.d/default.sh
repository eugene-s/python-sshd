#!/usr/bin/env bash

echo `python --version`

if ls /root/.ssh/id_rsa 1> /dev/null 2>&1; then
    find /root/.ssh -type f -exec chmod 600 {} \;
    ssh-add /root/.ssh/id_rsa
fi

source /usr/local/bin/activate.sh
