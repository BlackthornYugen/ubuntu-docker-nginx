#New Ubuntu 14.04 LTS ([Cloud@Cost](http://cloudatcost.com))
These are the steps I took to install nginx from a new cloud@cost vm. As long as you have git and wget installed this should work. See https://github.com/fideloper/docker-nginx-php for more information about the Dockerfile this uses and see https://github.com/phusion/baseimage-docker for more information about the base image used. 
##disable root SSH
Add "PermitRootLogin no" to /etc/ssh/sshd_config
```
sudo service ssh restart
```

##install docker
```
wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker $USER
```
Log out then back in for permissions to take effect

##get/configure nginx-php
```
git clone https://github.com/BlackthornYugen/ubuntu-docker-nginx.git
cd docker-nginx-php
```
Optionally customize files ( like change example.com in the Dockerfile and default nginx config )
```
sh ./run.sh rebuild
```
##notes
Start server in the future with 
```
sh ./run.sh
```
If Dockerfile or build files have been changed, use
```
sh ./run.sh rebuild
```

Try it out! (for mac and windows boot2docker users, replace localhost with $(boot2docker ip)
```
curl http://localhost
<h1>It works!</h1>
curl -k https://localhost
<h1>It works!</h1>
```