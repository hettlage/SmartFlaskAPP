#!/bin/bash

. ~/.bashrc

pyenv local 3.10.0
python3 -m venv venv
source venv/bin/activate
python3 -V

echo "----- Install requirements"
python3 -m pip install -r ./requirements.txt
python3 -m pip install pytest-cov

echo "----- Run tests"
pytest --cov=main utests --junitxml=./xmlReport/output.xml
python -m coverage xml

deactivate
pyenv local system

