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
# Dependencies for image processing with PIL
apt-get install -y libjpeg62-dev zlib1g-dev libfreetype6-dev liblcms1-dev
# Git (we'd rather avoid people keeping credentials for git commits in the repo, but sometimes we need it for pip requirements that aren't in PyPI)
apt-get install -y git

# Postgresql
if ! command -v psql; then
    apt-get install -y postgresql-$PGSQL_VERSION libpq-dev
    cp /vagrant_data/pg_hba.conf /etc/postgresql/$PGSQL_VERSION/main/
    /etc/init.d/postgresql reload
fi

# virtualenv global setup
if ! command -v pip; then
    easy_install -U pip
fi
if [[ ! -f /usr/local/bin/virtualenv ]]; then
    easy_install virtualenv virtualenvwrapper stevedore virtualenv-clone
fi

# bash environment global setup
cp -p /vagrant_data/bashrc /home/vagrant/.bashrc

# install our common Python packages in a temporary virtual env so that they'll get cached
if [[ ! -e /home/vagrant/.pip_download_cache ]]; then
    su - vagrant -c "mkdir -p /home/vagrant/.pip_download_cache && \
        virtualenv /home/vagrant/yayforcaching && \
        PIP_DOWNLOAD_CACHE=/home/vagrant/.pip_download_cache /home/vagrant/yayforcaching/bin/pip install -r /vagrant_data/common_requirements.txt && \
        rm -rf /home/vagrant/yayforcaching"
fi

# Node.js, CoffeeScript and LESS
if ! command -v npm; then
    wget http://nodejs.org/dist/v0.10.0/node-v0.10.0.tar.gz
    tar xzf node-v0.10.0.tar.gz
    cd node-v0.10.0/
    ./configure && make && make install
    cd ..
    rm -rf node-v0.10.0/ node-v0.10.0.tar.gz
fi
if ! command -v coffee; then
    npm install -g coffee-script
fi
if ! command -v lessc; then
    npm install -g less
fi
