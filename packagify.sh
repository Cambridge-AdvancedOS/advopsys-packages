#!/bin/sh

# Exploit previous git install to bootstrap, even though we will reinstall it
#cd /
#git clone https://github.com/Cambridge-AdvancedOS/advopsys-packages.git
#cd advopsys-packages
#cd ..

# Blow away the existing package system, which isn't properly registered
rm -Rf /usr/local/*
rm -Rf /var/db/pkg/*

export ASSUME_ALWAYS_YES=yes
pkg

mkdir -p /data

cd packages/All
pkg add					\
	bash-5.1.12.pkg			\
	calc-2.14.0.13.pkg		\
	git-2.34.1.pkg			\
	sudo-1.9.8p2.pkg		\
	tmux-3.2a.pkg			\
	py38-anytree-l41-2.8.0.pkg	\
	py38-flamegraph-l41-20230113.pkg \
	py38-ipympl-0.7.0.pkg		\
	py38-ipywidgets-7.5.1_3.pkg	\
	py38-jupyterlab-3.1.14.pkg	\
	py38-jupyterlab-widgets-1.0.2.pkg \
	py38-matplotlib-3.4.3.pkg	\
	py38-numpy-1.20.3,1.pkg		\
	py38-pandas-1.2.5,1.pkg		\
	py38-python-dtrace-0.0.13.pkg	\
	py38-graphviz-0.10.1.pkg	\
	npm-6.14.8_1.pkg

cd ../..

# Unclear why this is required, but it appears to be.
# jupyter-lab build

#cd /root
#ssh-keygen -f /root/.ssh/id_rsa -N ''
#cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
