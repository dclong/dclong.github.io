#!/bin/bash

ln -svfT /app/ /workdir
mkdir -p /app/pkgs
curl -sL https://deb.nodesource.com/setup_10.x | bash -
apt-get update -y
apt-get install -y wajig git nodejs highlight
pip3 install pelican loguru py4j
mkdir -p /app/archives
ln -svf /app/archives /root/

mkdir -p /root/.ssh
cp /app/ssh/* /root/.ssh/
# blog
if [[ ! -e /app/archives/blog ]]; then
    git clone git@github.com:dclong/blog.git /app/archives/
fi
git -C /app/archives/blog pull origin master
git -C /app/archives/blog submodule init
git -C /app/archives/blog submodule update --recursive --remote

# config
if [[ ! -e /app/archives/config ]]; then
    git clone git@github.com:dclong/config.git /app/archives/
fi
git -C /app/archives/config pull origin master
python3 /app/archives/config/linstall.py poetry -ic
python3 /app/archives/config/linstall.py ipy3 -ic
# python3 /app/archives/config/linstall.py bash_it -ic
python3 /app/archives/config/linstall.py svim -ic --disable-true-colors

# dsutil
if [[ ! -e /app/archives/dsutil ]]; then
    git clone git@bitbucket.org:dclong/dsutil.git /app/archives/
fi
git -C /app/archives/dsutil pull origin dev
cd /app/archives/dsutil/
poetry env use python3
poetry build
pip3 install dist/dsutil*.whl

