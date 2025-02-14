#!/bin/env python3

import os, subprocess


# ------------------------------------------------- #
# assigning variables                               #
# ------------------------------------------------- #

base_dir = os.getcwdb().decode("utf-8")
yml_site = base_dir + "/site.yml"
inventory = "/inventory.yml"
command = "ansible-playbook {} --ask-become-pass -i {} ".format(yml_site, inventory)

tags = [ "common" ] 

# ------------------------------------------------- #
# Making sure that dependencies are installed       #
# ------------------------------------------------- #
print("Checking installation of dependencies...")

deps = ["python3", "ssh", "pipx", "ansible-playbook", "git"]

for dep in deps:
    check = "which " + dep 
    result = subprocess.run(check, shell=True, executable="/bin/bash", 
                            capture_output=True, text=True)
    if (len(result.stdout) == 0):
        print("could not find dependency '{}' could not be found.".format(dep))
        print("exiting setup.\n")
        exit(1)

print("check OK: All dependencies are installed!\n")

# ------------------------------------------------- #
# Make sure that SSH-connection with github exists  #
# ------------------------------------------------- #

print("Checking ssh setup with github...")

ssh_connection = "ssh -T git@github.com"

result = subprocess.run(ssh_connection, shell=True, executable="/bin/bash", capture_output=True, text=True)

if (result.stderr.find("successfully authenticated") == -1):
    print("Unable to connect up to github. Make sure you have added your public key to github before proceeding")
    print("exiting setup.\n")
    exit(1)

print("check OK: SSH connection is working!\n")
# ------------------------------------------------- #
# Setting up terminal                               #
# ------------------------------------------------- #

prompt = "Would you like to setup your terminal [y/N]? "
answer = str.lower(input(prompt))

if (answer == "y" or answer == "yes"):
    prompt = """please choose either bash or zsh as your terminal shell
    \tzsh - (1),
    \tbash - (2):
    """
    shell = str.lower(input(prompt))

    while (shell != "1" and shell != "2"):
        print("'" + shell + "' is an invalid choice. please choose one of the available alternatives (1 or 2)\n\n")
        shell = str.lower(input(prompt))

    if (shell == "1"):
        tags.append("zsh")
    else:
        tags.append("bash")

# ------------------------------------------------- #
# Setting up neovim                                 #
# ------------------------------------------------- #

prompt = "Would you like to setup neovim [y/N]? "
answer = str.lower(input(prompt))

if (answer == "y" or answer == "yes"):
    tags.append("neovim")

# ------------------------------------------------- #
# Setting up tmux                                   #
# ------------------------------------------------- #

prompt = "Would you like to setup tmux [y/N]? "
answer = str.lower(input(prompt))

if (answer == "y" or answer == "yes"):
    tags.append("tmux")

# ------------------------------------------------- #
# Setting up docker                                 #
# ------------------------------------------------- #

prompt = "Would you like to setup docker [y/N]? "
answer = str.lower(input(prompt))

if (answer == "y" or answer == "yes"):
    tags.append("docker")

# ------------------------------------------------- #
# Setting up Accustic-warfare                       #
# ------------------------------------------------- #

prompt = "Would you like to setup accustic-warfare repos [y/N]?"
answer = str.lower(input(prompt))

if (answer == "y" or answer == "yes"):
    tags.append("accustic-warfare")

# ------------------------------------------------- #
# Setting up SwayWM                                 #
# ------------------------------------------------- #

prompt = "Would you like to setup a tiling window manager [y/N]? "
answer = str.lower(input(prompt))

if (answer == "y" or answer == "yes"):
    prompt = """please choose either SwayWM or AwesomeWM as your TWM
    \tSway    - (1) (NOTE: currently not functional),
    \tAwesome - (2):
    """
    shell = str.lower(input(prompt))

    while (shell != "1" and shell != "2"):
        print("'" + shell + "' is an invalid choice. please choose one of the available alternatives (1 or 2)\n\n")
        shell = str.lower(input(prompt))

    if (shell == "1"):
        pass
        #tags.append("sway") #NOTE: 
    else:
        tags.append("awesome")

# ------------------------------------------------- #
# Run ansible with setup                            #
# ------------------------------------------------- #

for tag in tags:
    command += "-t " + tag + ' '

print("will setup the following roles: ", tags)
print("the following command will be run: '{}'\n".format(command))
subprocess.run(command, shell=True, executable="/bin/bash")



