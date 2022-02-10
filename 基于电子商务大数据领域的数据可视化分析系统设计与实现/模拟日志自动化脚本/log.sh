//日志自动化运行启动脚本
#!/bin/bash
for i in node101 node102; do
    echo "========== $i =========="
    ssh $i "cd /opt/module/applog/; java -jar gmall2020-mock-log-2020-05-10.jar >/dev/null 2>&1 &"
done 