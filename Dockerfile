FROM ruby:2.2

WORKDIR /tmp
ADD Gemfile Gemfile.lock ./
RUN bundle install

RUN apt-get update
RUN apt-get install -y nodejs

RUN mkdir /app
WORKDIR /app
