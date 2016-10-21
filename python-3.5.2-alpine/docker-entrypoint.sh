#!/bin/ash

# Generate Host keys, if required
if ! ls /root/.host_keys/ssh_host_* 1> /dev/null 2>&1; then
    ssh-keygen -A
    mv /etc/ssh/ssh_host_* /root/.host_keys/

    chmod 600 -R /root/.host_keys/*
    chmod 700 /root/.host_keys/
fi

# do not detach (-D), log to stderr (-e), passthrough other arguments
exec /usr/sbin/sshd -D -e "$@"