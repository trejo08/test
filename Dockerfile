FROM ruby:2.6.2-alpine

RUN apk update && \
    apk add --no-cache build-base libpq postgresql-dev tzdata

# COPY Gemfile* /tmp/
# WORKDIR /tmp
RUN bundle install

WORKDIR /app
ADD . .
RUN ls -l
RUN env
RUN bundle install
# RUN rails db:create && rails db:migrate

# EXPOSE 3000:3000
ENTRYPOINT rails s -b 0.0.0.0