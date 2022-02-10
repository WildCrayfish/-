#!/bin/bash
case $1 in
"start"){
    for i in node101 node102 node103 node104 node105
    do

echo "================     启动时间同步服务          ==========="

echo "================   $i正在启动时间同步          ==========="
        ssh $i "systemctl start ntpd"
    done
};;
"stop"){
    for i in node101 node102 node103 node104 node105
    do
echo "================     关闭时间同步服务          ==========="
echo "================   $i正在关闭时间同步          ==========="
        ssh $i "systemctl stop ntpd"
    done
};;
"status"){
    for i in node101 node102 node103 node104 node105
    do
echo "================     $i  当前  状态            ==========="
        ssh $i "systemctl status ntpd"
    done
};;
"date"){
    for i in node101 node102 node103 node104 node105
    do
echo "================     $i  当前  时间            ==========="
        ssh $i "date"
    done
};;
esac
