FROM ruby:2.4.0
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir -p /backlogg/backlogg-api-users
WORKDIR /backlogg/backlogg-api-users
COPY . ./
RUN gem install bundler --no-document
RUN bundle install
EXPOSE 3001
# ENTRYPOINT ["bundle", "exec"]
ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["rails", "server", "-p", "3001", "-b", "0.0.0.0"]