# Buildroid
android build dockerfile

You will need 3 directories: android-soruce, ccache and android-build

  mkdir android-source
  mkdir ccache
  git clone https://github.com/gfreed/android-build.git android-build
  cd android-build
  ./build.sh
  cd /srv/android
  repo init ....

that's it.
