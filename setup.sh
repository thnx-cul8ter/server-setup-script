#!/bin/bash
#this script auto installs paper 1.19.2 with a few plugins
#and auto generats a start script
echo "downloading paper 1.19.2 please wait"
wget "https://api.papermc.io/v2/projects/paper/versions/1.19.2/builds/301/downloads/paper-1.19.2-301.jar"
echo "done downloading"
echo "setting up start script"
touch start.sh
echo "#!/bin/bash">>start.sh
args="java -jar paper-1.19.2-300.jar -XX:+UseG1GC"
echo "how much ram should the server use? (type <number>G so for example 4G for 4 gigs)"
read ram
args="$args -Xmx$ram Xms$ram"
echo "ok, using $ram of ram"
echo "do you want a server(bad) gui or do you want to interact purely through the shell? (y/n)"
read gui
if [[ $gui = "n" ]]
then
	args="$args --nogui"
fi
echo $args>>start.sh
echo "downloading plugins"
mkdir plugins
cd plugins
wget https://github.com/thnx-cul8ter/server-setup-script/raw/main/plugins.zip
unzip plugins.zip
cd ..
echo "done downloading plugins"
#dumb question i know
#but i still have to ask since im automating it
echo "do you accept the minecraft eula? (y/n)"
read eula
if [[ $eula = "y" ]]
then
	touch eula.txt
	echo "eula=true">>eula.txt
fi
echo "please also forward udp port 24454 so that simple voice chat will work"
echo "done run start.sh to start the server"
