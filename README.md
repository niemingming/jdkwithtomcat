# jdkwithtomcat
docker login --username=  repospath
docker tag imageid path
docker push tag  

#docker镜像打包
docker build DockerfilePath  -t tag

#启动命令及一些参数追加
docker run -d --name dads --add-host address:ip -p port:port tag

#进入容器内
docker exec -it containerId /bin/bash
