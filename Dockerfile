FROM resin/rpi-raspbian:latest

RUN apt-get update && apt-get install ruby ruby-dev

RUN gem install bundler

RUN gem install smashing

CMD ["/bin/bash"]
