# SchemaServer project

This project was "calfed" from the Schema Framework project.  There are
two reasons for which I did this:

- The Schema FastCGI object can stand on its own, able to respond to
  HTTP requests, potentially working any framework that expoits its
  features.
- The Schema FastCGI object is more stable than the rest of the
  framework.  It rarely gets updates and thus should have a version
  number independent to the frequently updated framework.

## Installation

### Download

There are a few options for downloading the project, from selecting
a specific (non-master) branch, to downloading the files without the
repository history.  In the following cases, it is assumed that the
clone is made in the home directory.

- Download the full repository
  `git clone https://gitub.com/cjungmann/SchemaServer.git`

- Download the master branch without history:
  `git clone --depth=1  https://gitub.com/cjungmann/SchemaServer.git`

- Download the only dev repository
  `git clone -b dev --single-branch https://gitub.com/cjungmann/SchemaServer.git`

### Install

Having downloaded what you need, build and install with the following

~~~sh
cd ~/SchemaServer/src
./configure
make
sudo make install
~~~~

### Test Installation

The Makefile includes a script that sets up a simple SchemaServer service
and runs tests of **schema.fcgi** in command line mode and in webserver mode.
The files will be copied to */var/www/SchemaServer_Test* to ensure that
Apache will permit the site to run.

While still in ~/SchemaServer/src, run

~~~sh
make run-test
~~~

### Uninstall Test Installation

While still in ~/SchemaServer/src, run

~~~sh
sudo make remove-test
~~~

## Documentation

### Some Documentation has been Left Behind

This project is a migration from the [Schema Framework](www.github.com/cjungmann/schemafw)
and some SchemaServer documentation may not yet be incorporated into
this repository.  In particular, the [UserGuide](https://github.com/cjungmann/schemafw/blob/master/userguide/UserGuide.md)
is may be useful if the other documentation in this project is not
sufficient.

### New Man pages

There are two man pages
- `man schema.fcgi` that describes how to use the executable and its
  command line arguments.
- `man 7 schema.fcgi` is an informational document, especially for
  a quick guide for establishing a new SchemaServer product.


