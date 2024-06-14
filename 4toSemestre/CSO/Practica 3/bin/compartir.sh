#!/bin/bash

if [ $(whoami) != 'root' ]
then
    echo "Tenes que ser el root"
    exit 28
fi

mount -t vboxsf conexionVirtual /media/compartida

exit 0
