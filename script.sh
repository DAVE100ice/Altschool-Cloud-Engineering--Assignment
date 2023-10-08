#!/bin/bash

# To set an Expiry Date of 2 weeks for the user 
 sudo useradd -e  "2 weeks"  Jiggy


#Prompt The User to the Change Their Password :
 # When we set an Expiry date, the user will be prompted to change their Password when they 
 # log in after the Expiry date has passed. so there is no needed commands for this .

# Attach the user to a group called "altschool":
 sudo groupadd altschool
 sudo usermod -aG altschool Jiggy

# Allow the "altschool" group to run only the "cat" command on "/etc/":
 sudo visudo
 # so now when we open our sudoers file, so we will now  Scroll down to the section where user and group-specific sudo rules are ,then we now input the existing rules below. 
 %altschool ALL=(ALL:ALL) NOPASSWD: /bin/cat/etc/*

# Create another user without a home directory:
 sudo useradd -M JIGGYUSER
