#!/usr/bin/python

import sys
import mmap
import os

#print 'Number of arguments:', len(sys.argv), 'arguments.'
#print 'Argument List:', str(sys.argv)
#print 'primer argumento:', str(sys.argv[1])
if (len(sys.argv) != 2):
    print """ 
    Necesita indicar el archivo que quiere mapear en memoria.
    Algunas opciones:
        helloA.txt
        helloB.txt """
    exit(1)

# write a simple example file
#with open(sys.argv[1], "wb") as f:
#    f.write("Hello Python!\n")

with open(sys.argv[1], "r+b") as f:
    size = os.path.getsize(sys.argv[1])

    # memory-map the file, size 0 means whole file
    mm = mmap.mmap(f.fileno(), size)

    # read content via standard file methods
    print mm.readline()  # prints "Hello Python!"

    # read content via slice notation
    #print mm[:5]  # prints "Hello"

    # update content using slice notation;
    # note that new content must have same size
#    mm[6:] = " world!\n"

    # ... and read again using standard file methods
    print mm.readline()  # prints "Hello  world!"
    cmd = raw_input("Breakpoint para inspeccionar archivos mapeados en memoria ")

    # close the map
    mm.close()
