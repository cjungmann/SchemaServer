# Build the Documentation

The files in this directory are used to build the **man** and **info**
pages for the SchemaServer.

The commands that build this documentation is in the Makefile in the
src directory.  Specify target *update-docs*.  This can be done by
changing to the *src* directory, or run here with a **make** command
line option.

Build version 1

    cd ../src
    sudo make update-docs

Build version 2

    sudo make -C ../src update-docs

