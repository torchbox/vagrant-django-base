vagrant-django-base
===================

A Vagrant box based on Ubuntu precise32, configured for Django development
according to Torchbox's adopted practices. Things preinstalled beyond the base
precise32 box include:

* postgresql 9.1 (with locale fixed to create databases as UTF-8)
* virtualenv and virtualenvwrapper
* dependencies for PIL, the Python Imaging Library
* a pip download cache pre-seeded with Django and various other common packages
* git (sometimes required for pip dependencies that aren't in PyPI)

We use this box in conjunction with https://github.com/torchbox/vagrant-django-template
as the initial template for our Django projects. vagrant-django-template will
successfully build from a vanilla precise32 base box, but using vagrant-django-base
instead will skip some of the time-consuming initial setup.

Build instructions
------------------
To generate the .box file:

    ./build.sh

To install locally:

    vagrant box add django-base-v2 django-base-v2.box
