
# Setup and installation guide

## Preparations
we first install some dependencies
```shell
sudo apt-get install git python3 python3-venv pipx
```
Now we can install ansible with the following instructions
```shell
pipx install --include-deps ansible
pipx inject ansible argcomplete
```
