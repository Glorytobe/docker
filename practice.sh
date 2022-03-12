
#!/bin/bash
#Description:docker installation on centos7
#Autor:Stephanie T
#Date:March 2022

echo "clean up the system"

 yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
sleep2
echo "setup the docker repository"

yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
sleep2
echo "install the docker engine"
yum install docker-ce docker-ce-cli containerd.io
echo "check the status,start and enable docker daemon"
systemctl status docker
if [ $? -eq 0 ]
then
echo "docher install successfully"
else
echo "start and enable it the command"
systemctl start docker
systemctl enable docker
echo "Check the status of the daemon to make sure it is up and running with"
systemctl status docker
fi
