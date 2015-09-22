#!/bin/bash

VERSION=$1
PYPY="/usr/bin/pypy"
ENV_NAME=pypy_env

if [ -z "$VERSION" ]; then
   echo "VERSION must be specified as first arg"
   exit 1
fi

echo "Creating virtualenv with $PYPY"
virtualenv --no-site-packages --python=$PYPY $ENV_NAME
if [ $? -ne 0 ]; then
   exit 1
fi

echo "Successfully build. Install cocaine-tools inside the virtualenv"
source $ENV_NAME/bin/activate
pip install cocaine-tools==$VERSION
deactivate
