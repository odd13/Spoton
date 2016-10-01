FROM ruby:2.2

RUN apt-get update
RUN apt-get install -y nodejs

WORKDIR /tmp
ADD Gemfile Gemfile.lock ./
RUN bundle install --jobs 8

RUN mkdir /app
WORKDIR /app
