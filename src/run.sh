#!/bin/sh

export APP_MODULE=${APP_MODULE-app.main:app}
export HOST=${HOST:-localhost}
export PORT=${PORT:-8002}
export WORKERS=2
export OTEL_EXPORTER_OTLP_ENDPOINT="http://localhost:4317"


# The program is run with the following command:
# exec uvicorn --reload --host "$HOST" --port "$PORT" "$APP_MODULE" --workers "$WORKERS"

# uvicorn app.main:app --reload --workers 1 --host 0.0.0.0 --port 8003
OTEL_RESOURCE_ATTRIBUTES=service.name=FastApi OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:4317 OTEL_EXPORTER_OTLP_PROTOCOL=grpc opentelemetry-instrument uvicorn  --host "$HOST" --port "$PORT" "$APP_MODULE" --workers "$WORKERS"
