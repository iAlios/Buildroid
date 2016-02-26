# Buildroid
android build dockerfile

Dockerfile 创建image

    # docker build -t <image-name> .
    # for example
    docker build -t android_build .
    
docker执行创建 container

    # docker run -v <host>:<container> -p <host>:<container> --name <container-name> -it <image-name> /bin/bash
    # for example
    docker run -v /mnt/disk1/docker:/srv -p 10022:22 --name android_builder -it android_build /bin/bash
    
docker 启动
    
    # docker start <image-name>
    # for example
    docker start android_builder

docker exec

    # docker exec -it <container-name> /bin/bash
    # for example
    docker exec -it android_builder /bin/bash

docker 使用 其他 用户登录

    # docker exec -u <user> -it <container-name> /bin/bash
    # for example
    docker exec -u root -it android_builder /bin/bash
    
