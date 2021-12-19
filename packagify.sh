#!/bin/sh

# Exploit previous git install to bootstrap, even though we will reinstall it
cd /
git clone https://github.com/Cambridge-AdvancedOS/advopsys-packages.git
cd advopsys-packages
cd ..

# Blow away the existing package system, which isn't properly registered
rm -Rf /usr/local/*
rm -Rf /var/db/pkg/*

export ASSUME_ALWAYS_YES=yes
pkg

mkdir -p /data

pkg add -y			\
	bash			\
	calc			\
	git			\
	sudo			\
	tmux			\
	py38-python-dtrace	\
	py38-jupyterlab		\
	py38-numpy		\
	py38-pandas		\
	py38-pygraphviz

# Unclear why this is required, but it appears to be.
# jupyter-lab build

cd /root
ssh-keygen -f /root/.ssh/id_rsa -N ''
cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
