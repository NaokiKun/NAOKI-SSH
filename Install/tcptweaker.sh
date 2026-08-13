#!/bin/bash
tput setaf 7 ; tput setab 4 ; tput bold ; printf '%35s%s%-20s\n' "TCP Tweaker 1.0" ; tput sgr0
if [[ `grep -c "^#PH56" /etc/sysctl.conf` -eq 1 ]]
then
	echo ""
	echo "TCP Tweaker network settings have already been added to the system! / TCP Tweaker ကွန်ရက်ဆက်တင်များကို စနစ်တွင်ပြီးစီးပြီး ထည့်ထားပါပြီ!"
	echo ""
	read -p "Do you want to remove the TCP Tweaker settings? / TCP Tweaker ဆက်တင်များကို ဖယ်ရှားချင်ပါသလား? [s/n]: " -e -i n resposta0
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
		echo "TCP Tweaker network settings have been removed successfully. / TCP Tweaker ကွန်ရက်ဆက်တင်များကို အောင်မြင်စွာ ဖယ်ရှားပြီးပါပြီ."
		echo ""
	exit
	else 
		echo ""
		exit
	fi
else
	echo ""
	echo "Este é um script experimental. Use por sua conta e risco!"
	echo "This script will change some network settings / ဤ script သည် ကွန်ရက် ဆက်တင်တချို့ကို ပြောင်းလဲပါမည်"
	echo "of the system to reduce latency and improve speed. / လက်န့်ချိန် လျော့ချပြီး အမြန်နှုန်း တိုးတက်စေမည်။"
	echo ""
	read -p "Continue with the installation? / တပ်ဆင်ခြင်းကို ဆက်လုပ်မည်လား? [s/n]: " -e -i n resposta
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
		echo "TCP Tweaker network settings have been added successfully. / TCP Tweaker ကွန်ရက်ဆက်တင်များကို အောင်မြင်စွာ ထည့်သွင်းပြီးပါပြီ."
		echo ""
	else
		echo ""
		echo "The installation was canceled by the user! / တပ်ဆင်မှုကို အသုံးပြုသူက ဖျက်သိမ်းလိုက်ပါပြီ!"
		echo ""
	fi
fi
exit