#!/bin/ash

DAEMON=sshd

# Generate Host keys, if required
if ! ls /etc/ssh/host_keys/ssh_host_* 1> /dev/null 2>&1; then
    ssh-keygen -A
    mv /etc/ssh/ssh_host_* /etc/ssh/host_keys/

    chmod 600 -R /etc/ssh/host_keys/*
    chmod 700 /etc/ssh/host_keys/
fi

if ! ls /root/env 1> /dev/null 2>&1; then
    cd /root/
    virtualenv /root/venv/
fi

stop() {
    echo -e "\nReceived SIGINT or SIGTERM. Shutting down ${DAEMON}"
    # Get PID
    pid=$(cat /var/run/${DAEMON}/${DAEMON}.pid)
    # Set TERM
    kill -SIGTERM "${pid}"
    # Wait for exit
    wait "${pid}"
    # All done.
    echo "Done."
}

if [ "$(basename $1)" == "${DAEMON}" ]; then
    echo "Running $@"
    trap stop SIGINT SIGTERM
    $@ &
    pid="$!"
    mkdir -p /var/run/${DAEMON} && echo "${pid}" > /var/run/${DAEMON}/${DAEMON}.pid
    wait "${pid}" && exit $?
else
    exec "$@"
fi