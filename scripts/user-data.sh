#!/bin/bash

sed -i 's|#baseurl=http://mirror.centos.org/centos/|baseurl=http://10.244.175.5/CentOS/|g' /etc/yum.repos.d/CentOS-Base.repo
sed -i 's|mirrorlist=|#mirrorlist=|g' /etc/yum.repos.d/CentOS-Base.repo

setsebool -P httpd_can_network_connect 1
