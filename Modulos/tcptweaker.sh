#!/bin/bash
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%35s%s%-20s\n' "TCP Tweaker 1.0" ; tput sgr0
if [[ `grep -c "^#PH56" /etc/sysctl.conf` -eq 1 ]]
then
	echo ""
	echo "TCP Tweaker network settings have already been added to the system! / TCP Tweaker ကွန်ရက်သတ်မှတ်ချက်များကို စနစ်တွင် ထည့်ပြီးပါပြီ!"
	echo ""
	read -p "Remove the TCP Tweaker settings? / TCP Tweaker သတ်မှတ်ချက်များ ဖျက်ချင်ပါသလား? [s/n]: " -e -i n resposta0
	if [[ "$resposta0" = 's' ]]; then
		grep -v "^#PH56
net.ipv4.tcp_window_scaling = 1
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 16384 16777216
net.ipv4.tcp_low_latency = 1
net.ipv4.tcp_slow_start_after_idle = 0" /etc/sysctl.conf > /tmp/syscl && mv /tmp/syscl /etc/sysctl.conf
sysctl -p /etc/sysctl.conf > /dev/null
		echo ""
		echo "TCP Tweaker network settings were removed successfully. / TCP Tweaker ကွန်ရက် သတ်မှတ်ချက်များကို အောင်မြင်စွာ ဖျက်ပြီးပါပြီ။"
		echo ""
	exit
	else 
		echo ""
		exit
	fi
else
	echo ""
	echo "Este é um script experimental. Use por sua conta e risco!"
	echo "This script will change some network settings / ဒီ script သည် ကွန်ရက် သတ်မှတ်ချက်အချို့ကို ပြောင်းလဲပါမည်"
	echo "of the system to reduce latency and improve speed. / စနစ်၏ latency ကို လျော့ချပြီး အမြန်နှုန်း တိုးတက်စေရန်"
	echo ""
	read -p "Continue with the installation? / ဆက်လက် တင်သွင်းမလား? [s/n]: " -e -i n resposta
	if [[ "$resposta" = 's' ]]; then
	echo ""
	echo "Modificando as seguintes configurações:"
	echo " " >> /etc/sysctl.conf
	echo "#PH56" >> /etc/sysctl.conf
echo "net.ipv4.tcp_window_scaling = 1
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 16384 16777216
net.ipv4.tcp_low_latency = 1
net.ipv4.tcp_slow_start_after_idle = 0" >> /etc/sysctl.conf
echo ""
sysctl -p /etc/sysctl.conf
		echo ""
		echo "TCP Tweaker network settings were added successfully. / TCP Tweaker ကွန်ရက် သတ်မှတ်ချက်များကို အောင်မြင်စွာ ထည့်သွင်းပြီးပါပြီ။"
		echo ""
	else
		echo ""
		echo "Installation was canceled by the user! / တင်သွင်းမှုကို အသုံးပြုသူက ပယ်ဖျက်ခဲ့သည်!"
		echo ""
	fi
fi
exit
