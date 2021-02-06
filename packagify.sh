#!/bin/sh

# Bootstrap package database and cache
mkdir -p /var/cache/pkg
cp /advopsys-packages/packages-base/* /var/cache/pkg
cp /advopsys-packages/var.db.pkg/* /var/db/pkg

# Base packages for most things
pkg install -y bash calc git-lite npm python sudo tmux
pkg install -y py37-idna py37-setuptools py37-typing-extensions py37-sniffio py37-cython py37-numpy py37-pandas libzmq4

# Replace a couple of key dependencies due to baseline package
# breakage (anyio) or needing a newer version (tornado).
pkg add /advopsys-packages/packages-local/py37-tornado-6.1.txz
pkg add /advopsys-packages/packages-local/py37-anyio-2.0.2_1.txz

# Dependencies/additions for Jupyter.  Some could probably be above our local
# package dependencies, but I haven't tried to shift them up yet.
pkg install -y py37-matplotlib py37-traitlets py37-ipython py37-pyzmq py37-Jinja2 py37-packaging py37-jsonschema
pkg install -y py37-json5 py37-requests py37-prometheus-client py37-terminado py37-send2trash py37-pygments
pkg install -y py37-argon2-cffi py37-defusedxml py37-testpath py37-pandocfilters-1.4.3 py37-bleach-3.1.5
pkg install -y py37-mistune-0.8.4 py37-nest-asyncio py37-async_generator-1.10 py37-entrypoints-0.3
pkg install -y py37-webencodings-0.5.1

# IPython and related components; updated versions with newer dependencies
pkg add /advopsys-packages/packages-local/py37-notebook-6.2.0.txz                # for py37-widgetsnbextension
pkg add /advopsys-packages/packages-local/py37-nbformat-5.1.2.txz                # for py37-ipywidgets
pkg add /advopsys-packages/packages-local/py37-widgetsnbextension-3.5.1_2.txz    # for py37-ipywidgets
pkg add /advopsys-packages/packages-local/py37-ipykernel5-5.4.3.txz              # for py37-ipympl
pkg add /advopsys-packages/packages-local/py37-ipywidgets-7.5.1_3.txz            # for py37-ipympl
pkg add /advopsys-packages/packages-local/py37-ipympl-0.5.8.txz

# Jupyter and Jupterlab; updated versions with newer dependencies
pkg add /advopsys-packages/packages-local/py37-jupyter_core-4.7.0.txz
pkg add /advopsys-packages/packages-local/py37-jupyter-packaging-0.7.11.txz
pkg add /advopsys-packages/packages-local/py37-jupyter-server-1.2.0.txz
pkg add /advopsys-packages/packages-local/py37-jupyter_client-6.1.11.txz

pkg add /advopsys-packages/packages-local/py37-nbclassic-0.2.6.txz
pkg add /advopsys-packages/packages-local/py37-nbclient-0.5.1.txz
pkg add /advopsys-packages/packages-local/py37-nbconvert-6.0.7_1.txz

pkg add /advopsys-packages/packages-local/py37-jupyterlab-pygments-0.1.2.txz
pkg add /advopsys-packages/packages-local/py37-jupyterlab-server-2.1.1.txz
pkg add /advopsys-packages/packages-local/py37-jupyterlab-3.0.2.txz

# Install python-dtrace
pkg add /advopsys-packages/packages-local/py37-python-dtrace-0.0.11.txz

# Unclear why this is required, but it appears to be.
jupyter-lab build

mkdir -p /data
