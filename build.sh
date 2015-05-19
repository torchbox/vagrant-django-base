#!/bin/bash

# to build django-base-v3.0.0.box:
vagrant destroy
vagrant up
vagrant halt
rm -f django-base-v3.0.0.box
vagrant package --output django-base-v3.0.0.box

# to install locally:
# vagrant box add django-base-v3.0.0 django-base-v3.0.0.box
