#!/bin/sh
CE_URL="http://git.oschina.net/mjyhj/K2_17ce/raw/master/17ce"
echo "begin install k2 17ce"
cd /tmp
killall -9 17ce_v3
rm  -rf 17ce*
wget -T 30 $CE_URL  -O 17ce.t
cp 17ce.t /etc/init.d/17ce
chmod +x  /etc/init.d/17ce
ln -sf /etc/init.d/17ce  /etc/rc.d/S9917ce
rm -rf /tmp/17ce
/etc/init.d/17ce stop
/etc/init.d/17ce start
