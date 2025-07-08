#!/bin/bash

cd ~
python3 -m venv /home/odoo/venv
. /home/odoo/venv/bin/activate
pip3 install -r /home/odoo/src/requirements.txt

exec "$@"