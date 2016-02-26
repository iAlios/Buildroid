# Buildroid
android build dockerfile

You will need 3 directories: android-soruce, ccache and android-build

    mkdir android-source
    mkdir ccache
    docker run -i -v ./android-source:/srv/android -v ./ccache:/srv/ccache -t Buidroid/Dockerfile /bin/bash
    cd /srv/android
    repo init ....

that's it.
