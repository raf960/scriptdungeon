#!/bin/bash
containers=$(sudo docker ps | awk '{if(NR>1) print $NF}')
containerid=$(sudo docker ps | awk '{if(NR>1) print $1}')
for container in $containers
echo "Zajetosc SWAP w kontenerach:"
do
  echo "Container: $container $containerid"
  swap=($(cat /sys/fs/cgroup/memory/docker/$containerid*/memory.stat | grep swap | awk '{print $2 /1024/1024}'))
	echo "Swap size:" $swap " MB"
done
