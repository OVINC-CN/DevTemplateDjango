FROM python:3.10
RUN mkdir -p /usr/src/app/logs
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN pip3 install -U pip && pip3 install -r requirements.txt
RUN apt-get update \
    && apt-get install -y gettext \
    && cp env.example .env \
    && python3 manage.py compilemessages -l zh_Hans \
    &&  rm -rf .env || echo
