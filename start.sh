#!/bin/bash
C_FORCE_ROOT=1 celery -A api.v1.resources.tasks worker --detach --loglevel=error --logfile="/root/shogun/shogun-celery.log"
gunicorn -b 0.0.0.0:8000 api.app:app --workers 3 --timeout 90 --log-level error   --error-logfile /root/shogun/shogun-error.log  --access-logfile /root/shogun/shogun-access.log--