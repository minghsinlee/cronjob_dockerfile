#### cronjob_dockerfile

本项目是一个基于alpine的cronjob任务运行容器，用于将自定义脚本运行在容器中

（很无意义，只为nas应用容器化）

This project is a cronjob task running container based on Alpine, which is used to run custom scripts in a container 

(with little practical significance, only for containerizing NAS applications).

--

使用方法

将项目下载至任意目录，使用docker build来创建镜像，然后准备好cron配置文件（example文件夹中有提供），在运行时指定即可。

例:

构建： `docker build -t YOUR_IMAGE_NAME:TAG .`

运行： `docker run -d --name YOUR_CONTAINER_NAME -v /etc/localtime:/etc/localtime:ro -v /PATH/TO/YOUR/SCRIPT:/script YOUR_IMAGE_NAME:TAG`

注意事项：

1：由于容器基于alpine，如需调用alpine默认未自带的程序，可在Dockerfile中的apk add环节添加自己需要的应用或使用其它方案安装应用然后再build镜像。

2：容器需要映射一个目录用来获取你的自定义脚本，我在Dockerfile和启动脚本中指定了容器的/script目录用来启动，为方便映射与自定义定时任务，crond配置目录也指定到了容器/script，所以映射进这个目录的文件夹应该有两样文件：自定义脚本和以root命名的cron语法文件，本项目在example目录中已提供了一个默认的文件，可以下载后自行修改，语法与crontab的语法相同。

3：由于计划任务的时效性原因，建议在启动命令里添加本机到容器的/etc/localtime文件映射，以便同步时区。（为什么不在容器里直接安装时区，原因两点，一是需要另安装apk包会造成臃肿，二是不同时区需要根据自己情况改动，不如直接映射方便。）
