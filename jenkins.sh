#!/bin/bash
#安裝jenkins

#java
yum install java-1.8.0-openjdk -y


#jenkins穩定版
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo yum install jenkins -y

#設定啟動用戶以及 Port
sed -i '29cJENKINS_USER="root"' /etc/sysconfig/jenkins
sed -i '56cJENKINS_PORT="80"' /etc/sysconfig/jenkins

#開機啟動
sudo chkconfig jenkins on
service jenkins start

echo "將以下密碼貼入web password"
password=sudo cat /var/lib/jenkins/secrets/initialAdminPassword
echo $password
