#!/bin/sh /etc/rc.common
# Copyight (C) 2017  www.17ce.com
START=99
UPDATE_URL="http://www.cdnunion.com/FP2P/soft/17ce_version.php"
TEMP_FILE="/tmp/update.txt"
UPDATE_FILE="/tmp/update.tgz"
WORK_DIR="/tmp/17ce/"
SAVE_DIR="/usr/share/17ce"
UUID="$SAVE_DIR/UUID"
USER="$SAVE_DIR/user"
check_update()
{
        wget -T 30 $UPDATE_URL -O  $TEMP_FILE
        TURL=`cat $TEMP_FILE|awk '{print $2}'`
        echo "will download update file -> $TURL"
        wget -T 60 $TURL  -O $UPDATE_FILE
}
init_conf()
{
        check_update
        mkdir -p $WORK_DIR
        tar xzvf  $UPDATE_FILE -C /tmp/17ce
        rm -rf $TEMP_FILE  $UPDATE_FILE
        if [ ! -f "$WORK_DIR/libstdc++.so.6" ]; then
                echo "will download libstc++ "
                wget -T 60 -O $WORK_DIR/libstdc++.so.6 http://www.17ce.com/soft/route/files/libstdc++.so.6.0.21;

        fi
        mkdir -p $SAVE_DIR
}
save_file()
{
    echo "save $WORK_DIR/$1 -> $SAVE_DIR/$1"
    cp  -f $WORK_DIR/$1 $SAVE_DIR/$1
}
restore_file()
{
    if [ -f $SAVE_DIR/$1 ]; then 
        echo "restore $SAVE_DIR/$1 -> $RESTORE_DIR/$1"
        cp  -f $WORK_DIR/$1 $SAVE_DIR/$1
    else
        echo "SAVE_DIR/$1 not exist"
    fi
}
start()
{
        echo "begin start 17ce"
        echo "~~~~~~"
        sleep 2
        echo "~~~~~~"
        sleep 2
        echo "~~~~~~"
        sleep 2
        init_conf
        restore_file UUID
        restore_file user
        echo "create link"
        ln -sf /lib/libc.so.0  /tmp/17ce/libc.so
        ln -sf /usr/lib/libpolarssl.so  /tmp/17ce/libmbedtls.so.9
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$WORK_DIR
        $WORK_DIR/17ce_v3 -u USER_NAME
        echo "17ce Client has stated."
        save_file UUID
        save_file user
}

stop()
{
        killall -9 17ce_v3
        sleep 1
        echo "17ce Client has stoped."
}
