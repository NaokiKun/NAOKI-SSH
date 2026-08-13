#!/bin/bash

tput setaf 7 ; tput setab 4 ; tput bold ; printf '%50s%s%-20s\n' "BadVPN, created By THE_ORION_SCRIPT_PRO" ; tput sgr0
if [ -f "/usr/local/bin/badvpn-udpgw" ]
then
	tput setaf 3 ; tput bold ; echo ""
	echo ""
\techo \"BadVPN has been installed successfully. / BadVPN အောင်မြင်စွာ ထည့်သွင်းပြီးပါပြီ။\"
	echo "Para executar, crie uma sessão screen"
	echo "E execute o comando:"
	echo ""
	echo "badudp"
	echo ""
	echo "E deixe a sessão screen rodando em segundo plano."
	echo "" ; tput sgr0
	exit
else
tput setaf 2 ; tput bold ; echo ""
echo -e "\033[1;36mEste é um script que compila e instala automaticamente o programa BadVPN em servidores Debian e Ubuntu para ativar o encaminhamento UDP na porta 7300, usado por programas como HTTP Injector da Evozi. Permitindo assim a utilização do protocolo UDP para jogos online, chamadas VoIP e outras coisas interessantes.\033[0m"
echo "" ; tput sgr0
read -p \"Continue? [y/n]: / ဆက်လက်လုပ်မလား? [y/n]: \" -e -i n resposta
if [[ "$resposta" = 's' ]]; then
	echo ""
	echo -e "\033[1;31mA instalação pode demorar bastante... seja paciente!\033[0m"
	sleep 3
	apt-get update -y
	apt-get install screen wget gcc build-essential g++ make -y
	wget http://www.cmake.org/files/v2.8/cmake-2.8.12.tar.gz
	tar xvzf cmake*.tar.gz
	cd cmake*
	./bootstrap --prefix=/usr
	make 
	make install
	cd ..
	rm -r cmake*
	mkdir badvpn-build
	cd badvpn-build
	wget https://github.com/ambrop72/badvpn/archive/refs/tags/1.999.130.tar.gz
	tar xf 1.999.130.tar.gz
	cd bad*
	cmake -DBUILD_NOTHING_BY_DEFAULT=1 -DBUILD_UDPGW=1
	make install
	cd ..
	rm -r bad*
	cd ..
	rm -r badvpn-build
    chmod +x badvpn.sh
    ./badvpn.sh
	echo "#!/bin/bash
	badvpn-udpgw --listen-addr 127.0.0.1:7300 --max-clients 10000 --max-connections-for-client 8" > /bin/badudp
	chmod +x /bin/badudp
	clear
	tput setaf 3 ; tput bold ; echo ""
	echo ""
\techo -e "\\033[1;36mBadVPN installed successfully. To use it, create a screen session, run the badudp command and leave the screen running in the background. / BadVPN အောင်မြင်စွာ ထည့်သွင်းပြီးပါပြီ။ အသုံးပြုရန် screen session တစ်ခု ဖန်တီး၍ badudp command ကို 실행ပြီး screen ကို နောက်ခံတွင် ထားပေးပါ။\\033[0m"
	echo "" ; tput sgr0
	exit
else 
	echo ""
	exit
fi
fi
