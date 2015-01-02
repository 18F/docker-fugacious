FROM quay.io/ozzyjohnson/passenger:2.2

MAINTAINER Oswald Johnson <oswald.johnson@gsa.gov>

ENV DEBIAN_FRONTEND noninteractive

ENV APP_REPO https://github.com/ozzyjohnson/fugacious.git 

# Configure NGINX.
RUN rm -f /etc/service/nginx/down
RUN rm /etc/nginx/sites-enabled/default

# Pepare APP.
RUN mkdir /home/app/webapp

WORKDIR /home/app/webapp

RUN git clone $APP_REPO .

ADD extra_config.rb /app/extra_config.rb

RUN chown -R app:app .

# Build APP.
RUN sudo -u app -H \
    bundle install \
    --jobs 8 \
    --without \
        development \
        test \
    --path .bundle;

RUN sudo -u app -H rake assets:precompile

# Pre-compile the passenger native extension.
RUN sudo -u app -H passenger-config build-native-support

# Configure APP.
RUN sudo -u app -H ruby /app/extra_config.rb
ADD webapp.conf /etc/nginx/sites-enabled/webapp.conf

# Fix the ENV.
ADD rails-env.conf /etc/nginx/main.d/rails-env.conf

EXPOSE 80
