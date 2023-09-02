#!/bin/sh

export APP_MODULE=${APP_MODULE-src.app.main:app}
export HOST=${HOST:-0.0.0.0}
export PORT=${PORT:-8001}

# Activate the virtual environment
source venv/bin/activate


# The program is run with the following command:
# exec uvicorn --reload --host "$HOST" --port "$PORT" "$APP_MODULE"

exec uvicorn app.main:app --reload --host "$HOST" --port "$PORT"