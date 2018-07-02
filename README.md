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

- Clone the project from github
  ~~~sh
  cd ~
  git clone https://github.com/cjungmann/SchemaServer.git
  cd SchemaServer/src
  ./configure
  make
  sudo make install
  ~~~~

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


