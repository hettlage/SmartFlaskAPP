#!/bin/bash

. ~/.bashrc
export PYENV_ROOT="$HOME/.pyenv"
xport PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

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

