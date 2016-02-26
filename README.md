# Buildroid
android build dockerfile

Dockerfile 创建image

    # docker buildt <image-name> .
    # for example
    docker buildt android_build
    
docker执行创建 container

    # docker runv <host>:<container>p <host>:<container>-name <container-name>it <image-name> /bin/bash
    # for example
    docker runv /mnt/disk1:/homep 10022:22-name android_builderit android_build /bin/bash
    
docker 启动
    
    # docker start <image-name>
    # for example
    docker start android_builder
