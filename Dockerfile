FROM ubuntu:16.04
MAINTAINER svd "svd@svd.org"

COPY docker-entrypoint.sh /
RUN apt update &&\
    apt install -y squid && \
    mkdir -p /var/cache/squid &&\
    chmod +x /docker-entrypoint.sh
COPY conf/squid.conf /etc/squid/squid.conf
COPY conf/squid_passwd /etc/squid/squid_passwd
ENTRYPOINT [ "/docker-entrypoint.sh" ]
CMD [ "squid" ]
EXPOSE 3128 3130
