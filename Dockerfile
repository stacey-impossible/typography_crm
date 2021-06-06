FROM ruby:3.0.1-alpine

ENV PATH /root/.yarn/bin:$PATH

RUN apk update && apk upgrade && \
  apk add --no-cache bash git openssh \
  build-base nodejs tzdata postgresql-dev

RUN apk update \
  && apk add curl bash binutils tar gnupg \
  && rm -rf /var/cache/apk/* \
  && /bin/bash \
  && touch ~/.bashrc \
  && curl -o- -L https://yarnpkg.com/install.sh | bash \
  && apk del curl tar binutils

RUN apk add --no-cache file
RUN apk --update add imagemagick

WORKDIR /app
COPY Gemfile Gemfile.lock ./
RUN bundle install -j "$(getconf _NPROCESSORS_ONLN)" --retry 5 --without development test

ENV RAILS_ENV production
ENV RACK_ENV production
ENV RAILS_ROOT /app

COPY package.json yarn.lock ./
RUN yarn install --production=false

COPY . ./
RUN ./bin/webpack

RUN \
  RAILS_ENV=production \
  DATABASE_URL=postgresql:does_not_exist ./bin/rails

EXPOSE 3000
