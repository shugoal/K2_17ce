#!/bin/sh
echo "begin install k2 17ce"
echo "By Dandan!"
cd /tmp
CE_URL="http://git.oschina.net/mjyhj/K2_17ce/raw/master/17ce"
rm  -rf 17ce*
wget -T 30 $CE_URL  -O 17ce
cp 17ce /etc/init.d/17ce
chmod +x  /etc/init.d/17ce
ln -sf /etc/init.d/17ce  /etc/rc.d/S9917ce
rm -rf /tmp/17ce
/etc/init.d/17ce stop
/etc/init.d/17ce start
