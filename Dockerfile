FROM python:alpine

RUN apk -uv add --no-cache jq less && pip install --no-cache-dir awscli

WORKDIR /aws

CMD sh
