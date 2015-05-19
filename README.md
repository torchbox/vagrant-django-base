Vagrant box for Django development
==================================

A Vagrant box based on Ubuntu trusty32, with the dependencies for developing Django projects preinstalled.

Usage
-----

This box is available on Vagrant cloud (aka Atlas) so can be used by just setting your base box to ``torchbox/django``.

To create a new Vagrantfile that uses this box, run the following:

```
vagrant init torchbox/django
```

What's inside
-------------

 - Python 2.7.9 with virtualenv and pip
 - Python 3.4.3 with pip (use bundled pyvenv for virtual environments)
 - NodeJS 0.12.3 with npm 2.9.1
 - PostgreSQL 9.3.6
 - Redis 2.8.4
 - Vim, Git, GCC (with C++ support)
 - Development headers for Python (2 and 3), PostgreSQL and some image libraries (libjpeg, zlib, etc)
 - Prebuilt wheels for Pillow 2.8.1 and psycopg2 2.6 for both python versions (and pip configured to use them)


Build instructions
------------------

To generate the .box file:

    ./build.sh

To install locally:

    vagrant box add django-base-v3.0.0 django-base-v3.0.0.box
