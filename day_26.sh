docker run -it --name vbox -e QT_X11_NO_MITSHM=1  -v  /tmp/.X11-unix/:/tmp/.X11-unix -e DISPLAY=$DISPLAY -v /dev/vboxdrv:/dev/vboxdrv -v /dev/vboxdrvu:/dev/vboxdrvu jencryzthers/vboxinsidedocker

