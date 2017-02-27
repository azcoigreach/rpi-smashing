FROM hypriot/rpi-ruby:2.2.2

ARG dir=/srv/dashboard
WORKDIR $dir

RUN apt-get update && apt-get install gcc make -y
RUN gem install bundler smashing --no-ri --no-rdoc -y
RUN smashing new $dir
RUN bundle
RUN apk del --no-cache .gems-deps

EXPOSE 3030

CMD sed -i "s/YOUR_AUTH_TOKEN/${TOKEN}/" config.ru && smashing start -p $PORT
