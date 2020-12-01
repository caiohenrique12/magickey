FROM ruby:2.5

RUN apt-get update -qq && apt-get install -y postgresql-client libgmp-dev && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn

WORKDIR /magickey
COPY Gemfile /magickey/Gemfile
COPY Gemfile.lock /magickey/Gemfile.lock
RUN bundle install
RUN yarn install --check-files
COPY . /magickey

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 7000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
