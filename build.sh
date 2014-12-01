#!/bin/bash

# to build django-base-v2.box:
vagrant up
rm -f django-base-v2.2.box
vagrant package --output django-base-v2.2.box

# to install locally:
# vagrant box add django-base-v2.2 django-base-v2.2.box
