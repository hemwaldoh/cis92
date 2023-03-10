FROM docker.io/ubuntu:20.04

RUN apt update -y && DEBIAN_FRONTEND=noninteractive apt install -y python3-pip tzdata postgresql-client
RUN python3 -m pip install django psycopg2-binary
RUN echo 'alias python=python3' >> ~/.bashrc
RUN mkdir /db
RUN mkdir /var/lib/postgresql
COPY app/ /app

WORKDIR /app/mysite

ENTRYPOINT ["./entrypoint.sh"]