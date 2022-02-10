#! /bin/bash

case $1 in
"start"){
        for i in node101 node102
        do
                echo " --------启动 $i 采集flume-------"
                ssh $i "nohup /opt/module/flume/bin/flume-ng agent -n a1 -c /opt/module/flume/conf/ -f /opt/module/flume/jobs/taildir_kafka.conf --name a1 -Dflume.root.logger=INFO,LOGFILE >/opt/module/flume/log1.txt 2>&1  &"
        done
};;     
"stop"){
        for i in node101 node102
        do
                echo " --------停止 $i 采集flume-------"
                ssh $i "ps -ef | awk'/taildir_kafka.conf/&&!/awk/{print\$2}' | xargs kill -9"
        done

};;
esac