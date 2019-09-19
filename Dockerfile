FROM ruby:2.6.4

WORKDIR /app

COPY . ./

RUN gem install bundler && bundle install