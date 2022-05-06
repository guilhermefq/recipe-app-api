FROM python:3.10.4-alpine
MAINTAINER Softgran

ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip

# RUN python -m venv ./venv
# RUN source ./venv/bin/activate

COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# For the application don't run with root account
RUN adduser -D user
USER user
