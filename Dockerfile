FROM debian:stretch

MAINTAINER Giuseppe Morelli <info@giuseppemorelli.net>

VOLUME /var/www/
VOLUME /etc/nginx/sites-enabled/

ENV NGINX_USER_UID     33
ENV NGINX_USER_GID     33
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update \
    && apt-get -y install \
    nginx \
    && apt-get clean \
    && rm -rf \
    /var/lib/apt/lists/* \
    /tmp/* \
    /var/tmp/* \
    /usr/share/man \
    /usr/share/doc \
    /usr/share/doc-base

RUN mkdir /var/www/html/

COPY script /opt/script/
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/sites-enabled /etc/nginx/sites-enabled

EXPOSE 80
EXPOSE 443

CMD ["/opt/script/entrypoint.sh"]