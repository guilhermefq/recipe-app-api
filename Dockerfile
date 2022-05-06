FROM python:3.10.4-alpine
MAINTAINER Softgran

ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip

# RUN python -m venv ./venv
# RUN source ./venv/bin/activate

COPY ./requirements.txt /requirements.txt
# apk=package manager(inside image alpine) 
RUN apk add --update --no-cache postgresql-client
RUN apk add --update --no-cache --virtual .temp-build-deps \
      gcc libc-dev linux-headers postgresql-dev

RUN pip install -r /requirements.txt
RUN apk del .temp-build-deps

RUN mkdir /app
WORKDIR /app
COPY ./app /app

# For the application don't run with root account
RUN adduser -D user
USER user
