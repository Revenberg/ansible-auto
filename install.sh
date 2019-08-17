#!/bin/bash
if [ ! -f "/home/pi/.pswrd" ]; then
  sudo apt-get update 
  sudo apt-get autoremove

  sudo apt-get install git -y 

  # Install Ansible and Git on the machine.
  sudo apt-get install python-pip git python-dev sshpass -y
  sudo pip install ansible 
  sudo pip install markupsafe 

  git clone https://github.com/Revenberg/ansible-node-red.git

  echo "vault password: "
  read passwrd
  echo $passwrd > /home/pi/.pswrd
fi

ansible-playbook /home/pi/ansible-node-red/node-red.yaml --vault-password-file /home/pi/.pswrd