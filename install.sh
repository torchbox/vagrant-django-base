#!/bin/bash

# Script to set up dependencies for Django on Vagrant.

PGSQL_VERSION=9.1

# Need to fix locale so that Postgres creates databases in UTF-8
cp -p /vagrant_data/etc-bash.bashrc /etc/bash.bashrc
locale-gen en_GB.UTF-8
dpkg-reconfigure locales

export LANGUAGE=en_GB.UTF-8
export LANG=en_GB.UTF-8
export LC_ALL=en_GB.UTF-8

# Install essential packages from Apt
apt-get update -y
# Python dev packages
apt-get install -y build-essential python python-dev python-setuptools python-pip
# Postgresql
apt-get install -y postgresql-$PGSQL_VERSION libpq-dev
# Dependencies for image processing with PIL
apt-get install -y libjpeg62-dev zlib1g-dev libfreetype6-dev liblcms1-dev

# postgresql global setup
cp /vagrant_data/pg_hba.conf /etc/postgresql/$PGSQL_VERSION/main/
/etc/init.d/postgresql reload

# virtualenv global setup
easy_install -U pip
easy_install virtualenv virtualenvwrapper stevedore virtualenv-clone

# bash environment global setup
cp -p /vagrant_data/bashrc /home/vagrant/.bashrc

# install our common Python packages in a temporary virtual env so that they'll get cached
su - vagrant -c "mkdir -p /home/vagrant/.pip_download_cache && \
    virtualenv /home/vagrant/yayforcaching && \
    PIP_DOWNLOAD_CACHE=/home/vagrant/.pip_download_cache /home/vagrant/yayforcaching/bin/pip install -r /vagrant_data/common_requirements.txt && \
    rm -rf /home/vagrant/.virtualenvs/yayforcaching"
