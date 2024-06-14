#!/bin/bash

if [ $(whoami) != 'root' ]
then
    echo "Tenes que ser el root"
    exit 28
fi

sudo mount -t vboxsf conexionVirtual /media/compartida

exit 0
