FROM ruby:2.4.2-slim

RUN apt-get update
RUN apt-get install -y wget
RUN wget https://github.com/candopanda/codepanda/archive/0.0.1.tar.gz
RUN tar -xvzf 0.0.1.tar.gz
WORKDIR codepanda-0.0.1

RUN bundle install --without development test
CMD ruby config.ru
