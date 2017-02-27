FROM hypriot/rpi-ruby:2.2.2

ARG dir=/srv/dash
WORKDIR $dir

RUN apk add --no-cache g++ musl-dev make --virtual .gems-deps
RUN gem install bundler smashing --no-ri --no-rdoc
RUN smashing new $dir
RUN bundle
RUN apk del --no-cache .gems-deps

EXPOSE 3030

CMD sed -i "s/YOUR_AUTH_TOKEN/${TOKEN}/" config.ru && smashing start -p $PORT
