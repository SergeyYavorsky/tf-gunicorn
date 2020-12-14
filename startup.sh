#!/bin/bash

cd /opt
if [ ! -f "apps/app.py" ]; then
    mv app.py apps/app.py
fi
gunicorn --bind 0.0.0.0:5000 --access-logfile - --error-logfile - --workers 5 wsgi:app

