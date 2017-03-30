#!/bin/sh
CRON_FILE=/etc/crontabs/root
CE_URL="http://git.oschina.net/mjyhj/K2_17ce/raw/master/17ce"
echo "begin install k2 17ce"
cd /tmp
killall -9 17ce_v3
rm  -rf 17ce*
wget -T 30 $CE_URL  -O 17ce.t

sed   "s/USER_NAME/$1/g" 17ce.t > 17ce
cp 17ce /etc/init.d/17ce
chmod +x  /etc/init.d/17ce
ln -sf /etc/init.d/17ce  /etc/rc.d/S9917ce
rm -rf /tmp/17ce
/etc/init.d/17ce stop
/etc/init.d/17ce start

#####0 4 * * * /etc/init.d/17ce start >> /tmp/17ce.log 2>&1#####
#####**0 1 * * 0 echo "" > /tmp/17ce.log####