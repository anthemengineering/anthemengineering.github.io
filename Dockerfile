FROM ruby:2.5

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# Set default locale for the environment
# See https://github.com/jekyll/jekyll/issues/4268#issuecomment-167406574
ENV LC_ALL C.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD bundle exec jekyll serve --host 0.0.0.0
EXPOSE 4000
