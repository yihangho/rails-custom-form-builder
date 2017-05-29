FROM ruby:2.4.1

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash
RUN apt-get install -y nodejs

RUN mkdir /custom-form-builder
WORKDIR /custom-form-builder

COPY Gemfile .
# COPY Gemfile.lock .

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["bin/rails", "server", "puma", "--binding=0.0.0.0", "--port=3000", "--pid=/tmp/server.pid"]
