#! /bin/bash

# Before releasing:
# * test & build.
# * ensure version is bumped in `setup.py`.
# * create a version tag. `git tag -a v-N.N.N`
# run this script. ./scripts/build_and_release_to_pypi.sh

set -e  # fail on first error

rm -rf ./build
rm -rf ./dist
rm -rf ./venv
python3.5 -m venv venv
source venv/bin/activate
pip install --upgrade pip
python3 -m pip install --upgrade setuptools wheel
python3 setup.py sdist bdist_wheel
python3 -m pip install --upgrade twine
# python3 -m twine upload --repository testpypi dist/*
python3 -m twine upload --repository pypi dist/*
