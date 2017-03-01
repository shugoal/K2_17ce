#/bin/sh
echo "begin install k2 17ce"
if [ $# == 1 ]; then
	echo "17CE user name -->$1"
	echo "if the user name is error ,ctrl +c exit"
	sleep 3
else 
	echo "please use the cmd-->"
	echo "     ./install.sh   xxx@xxx.com"
	exit 1
fi
echo 
echo 
echo "By Dandan!"
cd /tmp
CE_URL="http://git.oschina.net/godvmxi/K2_17ce/raw/master/17ce"
wget -T 30 $CE_URL  -O 17ce.t

sed   "s/USER_NAME/$1/g" 17ce.t > 17ce
chmod +x  17ce
#cp 17ce /etc/init.d/17ce
#ln -s /etc/init.d/17ce  /etc/rc.d/S9917ce
