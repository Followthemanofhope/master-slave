#!/bin/bash

mysql=/usr/local/mysql/bin/mysql
master_ip=192.168.1475.150
repl_user=yang
repl_pass=123
log_file=$($mysql -u$repl_user -p$repl_pass -h$master_ip -e 'show master status;'| grep mysql_bin|awk '{print $1}')
lod_pos==$($mysql -u$repl_user -p$repl_pass -h$master_ip -e 'show master status;'| grep mysql_bin|awk '{print $2}')

$mysql -uroot -p123 -e "change master to master_host='$master_ip',master_user='lhj',master_password='123',master_log_file='$logfile',master_log_pos=$lop_pos;start slave;show slave status \G"

