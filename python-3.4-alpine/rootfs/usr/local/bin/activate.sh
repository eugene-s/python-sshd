#!/usr/bin/env bash

if [ -z "${VENV_PATH}" ]; then VENV_PATH=/root/venv; fi
source $VENV_PATH/bin/activate

cd /usr/src/python-app/
