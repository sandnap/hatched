FROM ruby:2.7.1

RUN addgroup --gid 1000 kirt
RUN adduser --disabled-password --gecos '' --uid 1000 --gid 1000 kirt

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    apt-get install -y git-core zlib1g-dev build-essential libssl-dev && \
    apt-get install -y libreadline-dev libyaml-dev && \
    apt-get install -y libxml2-dev libxslt1-dev libcurl4-openssl-dev && \
    apt-get install -y software-properties-common libffi-dev nodejs yarn && \
    apt-get install -y vim libpq-dev postgresql-client
RUN mkdir /hatched
WORKDIR /hatched
COPY Gemfile /hatched/Gemfile
COPY Gemfile.lock /hatched/Gemfile.lock
RUN bundle install
COPY . /hatched

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
