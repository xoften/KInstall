#!/bin/bash
if [ -z ${GOROOT} ]; then 
  echo "Please enter GO paths to bashrc/zshrc before running this"
  echo "Example: "
  echo "export GOROOT=/usr/local/go"
  echo "export GOPATH=$HOME/go"
exit -1
fi

figlet "installation tool"

cd
mkdir ~/tools
cd tools

#Dependencies
sudo apt install -y git build-essential libpcap-dev libusb-1.0-0-dev libnetfilter-queue-dev libglib2.0-dev wireless-tools aircrack-ng tshark reaver bully cowpatty seclists gcc make

#Python
sudo apt install -y python3 python3-pip python3-venv

#Pipx
python3 -m pip install pipx
pipx ensurepath

#Ruby
sudo apt install -y ruby

#Golang
wget "https://golang.org/dl/go1.15.6.linux-amd64.tar.gz" -O go1.15.6.linux-amd64.tar.gz
sudo tar -C /usr/local -xzf go1.15.6.linux-amd64.tar.gz
rm go1.15.6.linux-amd64.tar.gz 
read -n 1 
go version
echo "Does it show a go version above? Press any key to continue"
read -n 1

#Visual studio code
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install apt-transport-https
sudo apt update
sudo apt install code 

#masscan
git clone https://github.com/robertdavidgraham/masscan
cd masscan
make
cd ..

#Nishang
git clone https://github.com/samratashok/nishang.git

#Powersploit
git clone https://github.com/PowerShellMafia/PowerSploit.git

#Amsi-bypass
git clone https://github.com/S3cur3Th1sSh1t/Amsi-Bypass-Powershell.git

#Pwncat
pipx install pwncat

#CrackMapExec
pipx install crackmapexec

#Evil-winrm
sudo gem install evil-winrm 

#Chisel
go get -v github.com/jpillora/chisel

#BloodHound
echo "deb http://httpredir.debian.org/debian stretch-backports main" | sudo tee -a /etc/apt/sources.list.d/stretch-backports.list
sudo apt-get update
wget -O - https://debian.neo4j.com/neotechnology.gpg.key | sudo apt-key add -
echo 'deb https://debian.neo4j.com stable 4.0' > /etc/apt/sources.list.d/neo4j.list
sudo apt-get update
sudo apt-get install apt-transport-https
sudo apt-get install neo4j
systemctl stop neo4j
wget "https://github.com/BloodHoundAD/BloodHound/releases/download/4.0.1/BloodHound-linux-x64.zip" -O BloodHound-linux-x64.zip
unzip BloodHound-linux-x64.zip
rm BloodHound-linux-x64.zip

#CMSeek
git clone https://github.com/Tuhinshubhra/CMSeeK
cd CMSeeK
pip install -r requirements.txt
cd ..

#Joomscan
git clone https://github.com/rezasp/joomscan.git

#Droopescan
pipx install droopescan

#XSStrike
git clone https://github.com/s0md3v/XSStrike.git
cd XSStrike
pip install -r requirements.txt
cd ..

#Gobuster
go get github.com/OJ/gobuster

#PEASS
git clone https://github.com/carlospolop/privilege-escalation-awesome-scripts-suite.git

#Watson
git clone https://github.com/rasta-mouse/Watson.git

#Linux-exploit-suggester
wget "https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh" -O les.sh

#LinEnum
wget "https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh" -O LinEnum.sh

#LSE
wget "https://github.com/diego-treitos/linux-smart-enumeration/raw/master/lse.sh" -O lse.sh

#Linux software exploit suggester
git clone https://github.com/belane/linux-soft-exploit-suggester.git

#GTFOBlookup
git clone https://github.com/nccgroup/GTFOBLookup.git
cd GTFOBLookup
pip install -r requirements.txt
cd ..

#Mimikatz
wget "https://github.com/gentilkiwi/mimikatz/releases/download/2.2.0-20200918-fix/mimikatz_trunk.zip" -O mimikatz.zip
unzip mimikatz.zip

#Bettercap
go get -v github.com/bettercap/bettercap
cd $GOPATH/src/github.com/bettercap/bettercap
make build
sudo make install
cd ~/tools

#Responder
git clone https://github.com/lgandx/Responder.git

#Routersploit
git clone https://www.github.com/threat9/routersploit
cd routersploit
pip install -r requirements.txt
cd ..

#WitnessMe
pipx install witnessme

#Default HTTP Login Hunter
git clone https://github.com/InfosecMatter/default-http-login-hunter.git

#Sublister
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r
pip install -r requirements.txt
cd ..

#AMASS
go get -v github.com/OWASP/Amass/v3/

#DNSRecon
git clone https://github.com/darkoperator/dnsrecon.git
cd dnsrecon
pip install -r requirements.txt
cd ..

#xrdp
sudo apt-get install xdotool
wget http://old-releases.ubuntu.com/ubuntu/pool/universe/x/xwatchwin/xwatchwin_1.1.1-2_amd64.deb && sudo dpkg -i xwatchwin_1.1.1-2_amd64.deb && sudo apt-get install -f
git clone https://github.com/sensepost/xrdp.git
rm xwatchwin_1.1.1-2_amd64.deb

#wifite
git clone https://github.com/derv82/wifite2.git
cd wifite2
sudo python setup.py install
cd ..

#impacket
wget "https://github.com/SecureAuthCorp/impacket/releases/download/impacket_0_9_22/impacket-0.9.22.tar.gz" -O impacket.tar.gz
tar -xzf impacket.tar.gz
rm impacket.tar.gz

#Rustscan
wget "https://github.com/RustScan/RustScan/releases/download/2.0.1/rustscan_2.0.1_amd64.deb" -O rustscan_2.0.1_amd64.deb
sudo dpkg -i rustscan_2.0.1_amd64.deb
rm rustscan_2.0.1_amd64.deb

#RedRabbit (windows powershell script for red team)
wget "https://raw.githubusercontent.com/securethelogs/RedRabbit/master/RedRabbit.ps1" -O RedRabbit.ps1
