vagrant-django-base
===================

A Vagrant box based on Ubuntu trusty32, configured for Django development
according to Torchbox's adopted practices. Things preinstalled beyond the base
trusty32 box include:

* postgresql 9.3 (with locale fixed to create databases as UTF-8)
* virtualenv and virtualenvwrapper
* dependencies for Pillow, a drop-in replacement for the Python Imaging Library PIL
* a pip download cache pre-seeded with Django and various other common packages
* git (sometimes required for pip dependencies that aren't in PyPI)
* Node.js, CoffeeScript and LESS

We use this box in conjunction with https://github.com/torchbox/vagrant-django-template
as the initial template for our Django projects. vagrant-django-template will
successfully build from a vanilla trusty32 base box, but using vagrant-django-base
instead will skip some of the time-consuming initial setup.

Build instructions
------------------
To generate the .box file:

    ./build.sh

To install locally:

    vagrant box add django-base-v2.2 django-base-v2.2.box
