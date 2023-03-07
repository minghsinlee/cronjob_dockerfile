#!/bin/bash
if [ ! -e "/script/root" ]; then
        echo "[ /script/root文件不存在，请创建一个root命名的文件映射到/script/目录并按照crontab格式写好定时任务来使任务执行 ]"
        echo "[ 注意，如果有些脚本需要调用未安装的程序，请自行在alpine容器中安装好依赖应用 ]"
else
        echo "[ /script/root文件存在，将启动crond并从root文件执行cron ]"
        echo "[ 注意，如果有些脚本需要调用未安装的程序，请自行在alpine容器中安装好依赖应用 ]"
        crond -f -c /script
fi
