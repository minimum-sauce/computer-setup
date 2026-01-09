# Setup and installation guide

## 1. Preparations
# 1.1 Installing dependencies
You can make use of the following command (given apt-package manager) to install the dependencies
```shell
sudo apt-get install git python3 python3-venv pipx ssh
```

# 1.2 Install ansible
Now we can install ansible which will perform the setup with the following instructions
```shell
pipx install --include-deps ansible
pipx inject ansible argcomplete
```

# 1.3 Setup SSH with github
Make sure you have set up ssh with your github account. You can use the following command to generate a ssh key-pair
```shell
ssh-keygen -t ed25519 -C "your@mail.com"
```

By default, the public key is placed in `~/.ssh/ed25519.pub`. You can now copy this key into github.

# 2. Perform setup
You are now ready to perform the setup. Run the `setup.py` script. this script will prompt you on what to install and what to skip. 

Before Ansible is able to install everything, you will be prompted to enter your **BECOME pass:**.
Once filled in, you can just sit back and relax as ansible takes care of the rest!
