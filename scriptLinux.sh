#!/usr/bin/env bash

#------------------VARIAVEIS-------------------#

URL_GOOGLE_CHROME="https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb"

DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"

PROGRAMAS_PARA_INSTALAR=(
	snapd
	gnome-tweaks
	plank
	git
	nmap
	metasploid
	virtualbox
	nodejs
	workbench
	inxi
	)


#-------------------------------------------------------#

#--------------------EXECUÇÃO-------------------------------#

sudo apt update -y

mkdir "#DIRETORIO_DOWNLOADS"
wget -c "URL_GOOGLE_CHROME" -P "$DIRETORIO_DOWNLOADS"

sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb

for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR}; do
	if ! dpkg -l | grep -q $nome_do_programa; then
		apt install "$nome_do_programa" -y
	else
		echo "[INSTALADO] - $nome_do_programa"
	fi
done


sudo snap install spotify
sudo snap install code --classic
sudo snap install sublime-text --classic


#---------------------FINALIZAÇÃO-----------------------#

sudo apt update && sudo apt dist-upgrade -y
sudo apt autoclean
sudo apt autoremove -y

