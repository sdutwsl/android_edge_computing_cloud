#!/bin/bash
case $1 in
start)
sudo /data/data/com.termux/files/usr/bin/aria2c --conf-path=/data/data/com.termux/files/home/apps/aria2/aria2.conf
;;
stop)
sudo kill -10 `sudo ss -lntp | grep aria2 | head -1 |awk '{print $4 " " $NF}'| awk -F "[: =,]" '{print $6 }'`
;;
restart)
sudo kill -10 `sudo ss -lntp | grep aria2 | head -1 |awk '{print $4 " " $NF}'| awk -F "[: =,]" '{print $6 }'`
sudo /data/data/com.termux/files/usr/bin/aria2c --conf-path=/data/data/com.termux/files/home/apps/aria2/aria2.conf
;;
*)
echo 'Aria2d Service'
echo 'aria2d start'
echo 'aria2d stop'
echo 'aria2d restart'
esac
