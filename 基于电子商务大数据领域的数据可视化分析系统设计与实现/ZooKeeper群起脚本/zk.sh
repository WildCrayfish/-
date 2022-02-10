#!/bin/bash
case $1 in
"start"){
    for i in node101 node102 node103
    do

echo "================     开始启动所有节点服务          ==========="

echo "================     正在启动 $i Zookeeper         ==========="
        ssh $i "/opt/module/zookeeper-3.5.7/bin/zkServer.sh start"
    done
};;
"stop"){
    for i in node101 node102 node103
    do
echo "================     开始启动所有节点服务          ==========="
echo "================     正在关闭 $i Zookeeper         ==========="
        ssh $i "/opt/module/zookeeper-3.5.7/bin/zkServer.sh stop"
    done
};;
"status"){
    for i in node101 node102 node103
    do
echo "================   $i 当前 Zookeeper 状态          ==========="
        ssh $i "/opt/module/zookeeper-3.5.7/bin/zkServer.sh status"
    done
};;
esac
