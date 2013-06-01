#!/bin/bash -x
sshpass -p 'raspberry' ssh pi@${1} "sudo mkdir /vagrant; sudo chmod ugo+rwx /vagrant"
sshpass -p 'raspberry' scp -r . pi@${1}:/vagrant
sshpass -p 'raspberry' ssh pi@${1} "cd /vagrant; sudo ./provision.sh"
