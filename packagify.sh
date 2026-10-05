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
pkg add Hashed/*				\
	py311-python-dtrace-0.0.15.pkg		\
	py311-flamegraph-l41-20261003.pkg

cd ../..
