FROM ruby:2.7

RUN apt-get update
RUN apt-get install -y software-properties-common build-essential curl make gcc git nodejs yarn wget libpq-dev

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

WORKDIR /app

ENV SECRET_KEY_BASE="allow_me_install_bundle"
ENV PATH="$PATH:/opt/yarn/bin"
ENV BUNDLE_PATH="/bundle"
ENV BUNDLE_JOBS=5

RUN gem update --system --no-document
RUN gem install bundler
RUN bundle install

COPY . /app
RUN yarn install