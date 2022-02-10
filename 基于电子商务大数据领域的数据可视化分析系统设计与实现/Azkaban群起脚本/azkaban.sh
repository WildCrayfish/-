#!/bin/bash
start-web(){
	for i in node101; do
		ssh $i "cd /opt/module/azkaban/azkaban-web/ ; bin/start-web.sh"
	done
}

stop-web(){
	for i in node101; do
		ssh $i "cd /opt/module/azkaban/azkaban-web/ ; bin/shutdown-web.sh"
	done
}

start-exec(){
	for i in node101 node102 node103; do
		ssh $i "cd /opt/module/azkaban/azkaban-exec/ ; bin/start-exec.sh"
	done
}


active-exec(){
	for i in node101 node102 node103; do
		ssh $i "curl -G "$i:12321/executor?action=activate" && echo"
	done
}

stop-exec(){
	for i in node101 node102 node103; do
		ssh $i "cd /opt/module/azkaban/azkaban-exec/ ; bin/shutdown-exec.sh"
	done
}




case $1 in
	start-exec )
		start-exec
	;;
	active-exec )
		active-exec
	;;
	stop-exec )
		stop-exec
	;;
	stop-web )
		stop-web
	;;
	start-web )
		start-web
	;;
esac