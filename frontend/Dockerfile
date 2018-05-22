FROM ruby:2.5.1

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs && npm install -g yarn

COPY Gemfile /home/code/
COPY Gemfile.lock /home/code/
RUN cd /home/code \
  && bundle install --path vendor/bundle --frozen --jobs 4

COPY package.json package-lock.json /home/code/
RUN cd /home/code && npm install

COPY config.ru Rakefile /home/code/
COPY app /home/code/app
COPY bin /home/code/bin
COPY config /home/code/config
COPY db /home/code/db
COPY lib /home/code/lib
COPY public /home/code/public

WORKDIR /home/code
CMD sh -c 'bundle exec rails s -b 0.0.0.0'
