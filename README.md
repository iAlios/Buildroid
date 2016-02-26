# Buildroid
android build dockerfile

You will need 3 directories: android-soruce, ccache and android-build

    mkdir android-source
    mkdir ccache
    docker run -i -v ./android-source:/srv/android -v ./ccache:/srv/ccache -t Buidroid/Dockerfile /bin/bash
    cd /srv/android
    repo init ....

that's it.

Dockerfile 创建image

    # docker build -t <image-name> .
    # for example
    docker build -t android_build
    
docker执行创建 container

    # docker run -v <host>:<container> -p <host>:<container> --name <container-name> -it <image-name> /bin/bash
    # for example
    docker run -v /mnt/disk1:/home -p 10022:22 --name android_builder -it android_build /bin/bash
    
docker 启动
    
    # docker start <image-name>
    # for example
    docker start android_builder
    
