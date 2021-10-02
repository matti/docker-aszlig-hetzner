FROM python:3

RUN pip install hetzner

WORKDIR /app
COPY app .
ENTRYPOINT [ "/app/entrypoint.sh" ]