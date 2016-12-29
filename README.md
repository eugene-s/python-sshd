# Python-sshd

Remote python interpreter with Alpine Linux.

**Only for developing**.

## How to use

### Connect to ssh

1. Run image:

    ```
    docker run -d --name my-python-app -p <your-ssh-port>:22 -v "$PWD":/usr/src/python-app eugenes1/python-sshd
    ```
    
2. Connect to the image over ssh with credentials:

    * user: `root`
    * password: `root`

### Use as remote interpreter

- Python interpreter dir: `/root/venv/bin/python`
- Project path: `/usr/src/python-app`
- You can install new requirements without loosing it after restarting image