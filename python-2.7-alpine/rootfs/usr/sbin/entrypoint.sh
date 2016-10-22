#!/bin/ash

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

# do not detach (-D), log to stderr (-e), passthrough other arguments
exec /usr/sbin/sshd -D -e "$@"