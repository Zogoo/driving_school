FROM ruby:2.7

RUN apt-get update

# Libraries for development environment
RUN apt-get install -y software-properties-common build-essential 
RUN apt-get install -y curl wget make gcc git nodejs libpq-dev

# Yarn installation
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt update && apt install -y yarn

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

WORKDIR /app

ENV SECRET_KEY_BASE="allow_me_install_bundle"
ENV PATH="$PATH:/opt/yarn/bin"

RUN gem update --system --no-document
RUN gem install bundler
RUN bundle install

COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
RUN yarn install

# Add a script to be executed every time the container starts.
COPY scripts/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]