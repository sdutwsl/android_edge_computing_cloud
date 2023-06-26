#!/bin/bash
case $1 in
start)
sudo iptables -t nat -A PREROUTING -p tcp --dport 445 -j REDIRECT --to-port 4445
sudo iptables -t nat -A OUTPUT -p tcp --dport 445 -j REDIRECT --to-port 4445
sudo /data/data/com.termux/files/usr/bin/smbd -s /data/data/com.termux/files/home/apps/samba/smb.conf
;;
stop)
sudo kill -10 `sudo ss -lntp | grep smbd | head -1 |awk '{print $4 " " $NF}'| awk -F "[: =,]" '{print $6 }'`
sudo iptables -t nat -D PREROUTING -p tcp --dport 445 -j REDIRECT --to-port 4445
sudo iptables -t nat -D OUTPUT -p tcp --dport 445 -j REDIRECT --to-port 4445
;;
restart)
sudo kill -10 `sudo ss -lntp | grep smbd | head -1 |awk '{print $4 " " $NF}'| awk -F "[: =,]" '{print $6 }'`
sudo iptables -t nat -D PREROUTING -p tcp --dport 445 -j REDIRECT --to-port 4445
sudo iptables -t nat -D OUTPUT -p tcp --dport 445 -j REDIRECT --to-port 4445
sudo iptables -t nat -A PREROUTING -p tcp --dport 445 -j REDIRECT --to-port 4445
sudo iptables -t nat -A OUTPUT -p tcp --dport 445 -j REDIRECT --to-port 4445
sudo /data/data/com.termux/files/usr/bin/smbd -s /data/data/com.termux/files/home/apps/samba/smb.conf
;;
*)
echo 'Sambad Service'
echo 'sambad start'
echo 'sambad stop'
echo 'sambad restart'
esac
