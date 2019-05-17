FROM ruby:latest

RUN apt-get update -qq && \
    apt-get -y install mysql-client
RUN mkdir /sparring-workspace

WORKDIR /sparring-workspace

ADD Gemfile /sparring-workspace/Gemfile
RUN bundle install --path=vendor/bundle --jobs=4

COPY . /sparring-workspace

