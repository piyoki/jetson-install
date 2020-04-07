#! /bin/bash

menu () {
read -p ' ->  Do you wish to install other packages? (y/n) ' VAL
#if y conetinue, else done
if [ "$VAL" == "y" ]
then
	echo -e "				     
+      which packages you wish to install:  	     	+
|  						     	|
|     1.  All (default)				     	|
|     2.  code-oss (vscode for aarch64)		     	|
|     3.  jetson-stats 				     	|
|     4.  psensor				     	|
|     5.  resilio-sync				     	|
|     6.  Archiconda (Anaconda for aarch64)	     	|
|     7.  ibus-pinyin				     	|
|     8.  jupyter lab				     	|
|     9.  kazam (screen recorder)		     	|
|     10. nomachine			 	     	|
|     11. pycharm				     	|
|     12. docker					|
+                                                    	+
"
	read -p ' ->  Put the package # you wish to install here: ' NUM
	echo -e " ->  You choose #$NUM.
 ->  Download will start in 3 seconds."
	sleep 3
	install
else
	echo -e " ->  Installation ends..."
	echo -e " ->  Enjoy!
"
fi
}

intro (){
echo -e "
+-------------------------------------------------------+
@@@@@@@@@@@@ Welcome to the world of Jetson @@@@@@@@@@@@@
|                                                    	|
|                                                    	|
|    You may pick the following packages to install:  	|
|  						     	|
|    1.  All (default)				     	|
|    2.  code-oss (vscode for aarch64)		     	|
|    3.  jetson-stats (recommended)		     	|
|    4.  psensor					|
|    5.  resilio-sync				    	|
|    6.  Archiconda (Anaconda for aarch64)	     	|
|    7.  ibus-pinyin				     	|
|    8.  jupyter lab				     	|
|    9.  kazam (screen recorder)			|
|    10. nomachine (recommended)		      	|
|    11. pycharm (ide)				        |
|    12. docker						|
|                                                    	|
|                                                    	|
+-------------------------------------------------------+
"
read -p ' ->  Put the package # you wish to install here: ' NUM
echo -e " ->  You choose #$NUM.
 ->  Download will start in 3 seconds."
}

install (){
case $NUM in
	1)
		oss_code
		jetson_stats
		psensor
		resilio_sync
		archiconda
		ibus_pinyin
		jupyter_lab
		kazam
		nomachine
		pycharm
		docker
		echo -e " ->  Congratualations!! All packages have been installed successfully!
 ->  Enjoy!"
		;;
	2)
		oss_code
		echo -e " ->  code-oss has been installed successfully!"
		menu
		;;
	3)
		jetson_stats
		echo -e " ->  jetson-stats has been installed successfully!"
		echo -e " ->  Type 'sudo jtop' to start using jetson-stats."
		menu
		;;
	4)
		psensor
		echo -e " ->  psensor has been installed successfully!"
		menu
		;;
	5)
		resilio_sync
		echo -e " ->  resilio-sync has been installed successfully!"
		echo -e " ->  Type localhost:8888 on a web browser to finish the sync setup"
		menu
		;;
	6)
		archiconda
		echo -e " ->  Archiconda has been installed successfully!"
		menu
		;;
	7)
		ibus_pinyin
		echo -e " ->  ibus-pinyin has been installed successfully!"
		menu
		;;
	8)
		jupyter_lab
		echo -e " ->  jupyter lab has been installed successfully!"
		echo -e " ->  Type 'jupyter lab' to start using jupyter lab."
		menu
		;;
	9)
		kazam
		echo -e " ->  kazam has been installed successfully!"
		menu
		;;
	10)
		nomachine
		echo -e " ->  nomachine has been installed successfully!"
		menu
		;;
	11)
		pycharm
		echo -e " ->  pycharm has been installed successfully!"
		echo -e " ->  Type 'pycharm' to start using pycharm."
		menu
		;;
	12)
		docker
		echo -e " ->  docker has been installed successfully!"
		menu
		;;
esac
}

#func 1
ness (){
cd ~
sudo apt-get install nano
sudo apt-get install curl
sudo apt-get install python3-pip python3-dev
sudo apt-get install python-pip
sudo apt-get install python-setuptools
sudo apt-get install python3-setuptools
}

#func 2
oss_code (){
cd ~
curl -s https://packagecloud.io/install/repositories/swift-arm/vscode/script.deb.sh | sudo bash
sudo apt-get install code-oss
}

#func 3
jetson_stats (){
cd ~
sudo -H pip install jetson-stats
sudo -H pip install -U jetson-stats
}

#func 4
psensor (){
cd ~
sudo apt install lm-sensors hddtemp
sudo apt install psensor
}

#func 5
resilio_sync (){
cd ~
wget https://download-cdn.resilio.com/2.6.4.1344/Debian/resilio-sync_2.6.4.1344-1_arm64.deb
sudo dpkg -i resilio-sync_2.6.4.1344-1_arm64.deb
sudo systemctl enable resilio-sync
rm -rf resilio-sync_2.6.4.1344-1_arm64.deb
}

#func 6
archiconda (){
cd ~
wget https://github.com/Archiconda/build-tools/releases/download/0.2.3/Archiconda3-0.2.3-Linux-aarch64.sh
sudo sh Archiconda3-0.2.3-Linux-aarch64.sh
export PATH=~/archiconda3/bin:$PATH
rm -rf Archiconda3-0.2.3-Linux-aarch64.sh
}

#func 7
ibus_pinyin (){
cd ~
sudo apt-get install ibus-pinyin
}

#func 8
jupyter_lab (){
cd ~
pip3 install jupyterlab
pip3 install --upgrade --force jupyter-console
export PATH=$PATH:~/.local/bin
}

#func 9
kazam (){
cd ~
sudo apt-get install kazam
}

#func 10
nomachine (){
cd ~
wget https://download.nomachine.com/download/6.9/Arm/nomachine_6.9.2_1_arm64.deb
sudo dpkg -i nomachine_6.9.2_1_arm64.deb
rm rf nomachine_6.9.2_1_arm64.deb
}

#func 11
pycharm (){
cd ~
sudo apt-get update && sudo apt-get install openjdk-8-jdk
wget https://download.jetbrains.com/python/pycharm-professional-2019.3.4.tar.gz?_ga=2.42966822.2056165753.1586158936-1955479096.1586158936 -O pycharm-professional-2019.3.4.tar.gz
tar -xzf pycharm-professional-2019.3.4.tar.gz && cd pycharm-2019.3.4/bin
sudo chmod +x pycharm.sh && mv pycharm.sh pycharm
sudo rm -rf pycharm-professional-2019.3.4.tar.gz
cd ~
echo 'export PATH=/home/'$USER'/pycharm-2019.3.4/bin:$PATH' >> .bashrc
}

#func 12
docker (){
cd ~
sudo wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker $USER
sudo systemctl enable docker 
}

# exec
intro
sleep 3
ness
install

