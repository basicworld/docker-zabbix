#!/bin/bash
docker run -itd \
--hostname=zabbix \
--privileged \
-v /sys/fs/cgroup:/sys/fs/cgroup:ro \
-v $(pwd)/data/var/lib/mysql:/var/lib/mysql \
-v $(pwd)/data/var/log:/var/log \
-v $(pwd)/data/usr/lib/zabbix/alertscripts:/usr/lib/zabbix/alertscripts \
-v $(pwd)/data/usr/lib/zabbix/externalscripts:/usr/lib/zabbix/externalscripts \
-v $(pwd)/data/var/lib/zabbix/snmptraps:/var/lib/zabbix/snmptraps \
-v $(pwd)/data/var/lib/zabbix/mibs:/var/lib/zabbix/mibs \
-p 80:80 \
-e "container=docker" \
local/zabbix

docker exec -it $(docker ps -l -q) /bin/sh /root/restart-zabbix.sh
