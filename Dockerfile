FROM ruby:alpine3.16

ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN apk add make

RUN apk add --update \
  build-base \
  libxml2-dev \
  #chromium-chromedriver
  libxslt-dev \
  && rm -rf /var/cache/apk/*

# Use libxml2, libxslt a packages from alpine for building nokogiri
RUN bundle config build.nokogiri --use-system-libraries


ADD Gemfile* $APP_HOME/
RUN bundle install

ADD . $APP_HOME

EXPOSE 8000

CMD ["bundle", "exec", "rackup", "--host", "0.0.0.0", "-p", "8000"]
