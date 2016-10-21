FROM python:2.7.12-alpine
MAINTAINER Eugene Savchenko

EXPOSE 22
COPY docker-entrypoint.sh /

# Install ssh-server for connect remote python interpreter
RUN apk update && \
    apk add bash openssh && \
    mkdir -p /root/.host_keys && \
    echo -e "HostKey /root/.host_keys/ssh_host_rsa_key" >> /etc/ssh/sshd_config && \
    echo -e "HostKey /root/.host_keys/ssh_host_dsa_key" >> /etc/ssh/sshd_config && \
    echo -e "HostKey /root/.host_keys/ssh_host_ecdsa_key" >> /etc/ssh/sshd_config && \
    echo -e "HostKey /root/.host_keys/ssh_host_ed25519_key" >> /etc/ssh/sshd_config && \
    sed -i s/#PermitRootLogin.*/PermitRootLogin\ yes/ /etc/ssh/sshd_config && \
    echo "root:root" | chpasswd && \
    chmod a+x /docker-entrypoint.sh && \
    rm -rf /var/cache/apk/* /tmp

ENTRYPOINT ["/docker-entrypoint.sh"]