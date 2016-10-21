# python-sshd

Remote python interpreter with Alpine Linux.

## To use with docker-compose:
```yml
version: "2"

services:
  python-ssh:
    environment:
      - HOST_IP=127.23.42.52
      - SSH_REMOTE_PORT=1022
      - PROJECT_NAME=python-ssh
    build: eugenes1/python-sshd
    ports:
      - "${HOST_IP}:${SSH_REMOTE_PORT}:22"
    volumes:
      - python-ssh-root:/root/
      - .:/usr/src/${PROJECT_NAME}

volumes:
  python-ssh-root:
    driver: local
```