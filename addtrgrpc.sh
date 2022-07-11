#!/bin/bash
# My Telegram : https://t.me/izhanV
# ==========================================
DF='\e[39m'
Bold='\e[1m'
Blink='\e[5m'
yell='\e[33m'
red='\e[31m'
green='\e[32m'
blue='\e[34m'
PURPLE='\e[35m'
CYAN='\e[36m'
Lred='\e[91m'
Lgreen='\e[92m'
Lyellow='\e[93m'
NC='\e[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
CYAN='\e[36m'
LIGHT='\033[0;37m'
#########################

uuid=$(cat /proc/sys/kernel/random/uuid)
domain=$(cat /root/domain)
clear
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m       ⇱ XRAY TROJAN GRPC ⇲        \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""

tr="$(cat /etc/xray/trojangrpc.json | grep port | sed 's/"//g' | sed 's/port//g' | sed 's/://g' | sed 's/,//g' | sed 's/ //g')"
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${user_EXISTS} == '0' ]]; do
		read -rp "Username : " -e user
		user_EXISTS=$(grep -w $user /etc/xray/akuntrgrpc.conf | wc -l)

		if [[ ${user_EXISTS} == '1' ]]; then
			echo ""
			echo -e "Username ${user} Already On VPS Please Choose Another"
			exit 1
		fi
	done

read -p "Expired (days): " masaaktif
read -p "SNI (BUG)     : " sni
read -p "ADDRESS (BUG) : " sub
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo "1. BUG as ADDRESS"
echo "2. BUG as SNI"
echo "3. BUG as BOTH"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"


hariini=`date -d "0 days" +"%Y-%m-%d"`
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#xtrgrpc$/a\### '"$user $exp"'\
},{"password": "'""$uuid""'"' /etc/xray/trojangrpc.json
echo -e "### $user $exp" >> /etc/xray/akuntrgrpc.conf
systemctl restart xray.service
systemctl restart trgrpc.service
trojanlink="trojan://${uuid}@${domain}:${tr}?security=tls&type=grpc&serviceName=GunService&sni=bug.com#$user"
service cron restart
clear

echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "\E[44;1;39m       ⇱ XRAY TROJAN GRPC ⇲        \E[0m"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo ""
echo -e "Remarks     : ${user}"
echo -e "IP/Host     : ${MYIP}"
echo -e "Domain      : ${domain}"
echo -e "SNI bug     : bug.com"
echo -e "Port        : ${tr}"
echo -e "Key         : ${user}"
echo -e "Created     : $hariini"
echo -e "Expired     : $exp"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "Link TR  : ${trojanlink}"
echo -e "\033[0;34m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
