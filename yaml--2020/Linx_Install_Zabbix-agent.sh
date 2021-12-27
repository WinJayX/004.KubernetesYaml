#!/bin/bash
# author:WinJayX
# date:2020-04-28
# Maintainer WinJayX <WinJayX@Gmail.com>
# func:Quick Install Zabbix Agent
#
rpm -Uvh https://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-release-5.0-1.el7.noarch.rpm
yum clean all && yum makecache fast && yum install zabbix-agent -y

cd /etc/zabbix/

sed -i 's/=127.0.0.1/=zabbix.nercoa.com/g' /etc/zabbix/zabbix_agentd.conf
sed -i 's/name=Zabbix server/name=JumpServer/g' /etc/zabbix/zabbix_agentd.conf 


systemctl restart zabbix-agent.service && systemctl enable zabbix-agent.service && systemctl status zabbix-agent.service
