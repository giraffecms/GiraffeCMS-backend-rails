FROM ruby:2.6.2-alpine

RUN apk update && \
apk upgrade && \
apk add --no-cache \
git \
linux-headers \
postgresql-dev \
build-base \
libxml2-dev \
nodejs \
tzdata \
libxslt-dev

RUN mkdir -p /giraffecms
WORKDIR /giraffecms
COPY Gemfile /giraffecms/Gemfile
COPY Gemfile.lock /giraffecms/Gemfile.lock
RUN bundle install --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3

COPY . /giraffecms
COPY ./config/database.yml.docker /giraffecms/config/database.yml

EXPOSE 3000
