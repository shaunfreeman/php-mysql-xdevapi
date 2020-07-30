FROM ubuntu:18.04

MAINTAINER Shaun Freeman <shaun@shaunfreeman.co.uk>

COPY compile-php.sh /usr/local/bin/compile-php.sh
RUN ["chmod", "+x", "/usr/local/bin/compile-php.sh"]

RUN apt-get update \
    && apt-get install -y --no-install-recommends  \
        unzip \
        libzip4 \
        git \
        wget \
        file \
        ca-certificates \
        build-essential \
        autoconf \
        bison \
        cmake \
        pkg-config \
        re2c \
        dpkg-dev \
        libprotobuf-dev \
        libboost-dev \
        libcurl4-openssl-dev \
        libfreetype6-dev \
        libjpeg-turbo8-dev \
        libpng-dev \
        libicu-dev \
        libmysqlclient-dev \
        libssl-dev \
        zlib1g-dev \
        libxml2-dev \
        curl \
        libsqlite3-dev \
        libonig4 \
        libprotobuf10 \
        protobuf-compiler \
        libfreetype6 \
        zlib1g \
        libjpeg-turbo8 \
        libxml2 \
        libzip-dev \
        libargon2-0 \
        libargon2-0-dev \
        libsodium-dev \
        libsodium23 \
        libedit2 \
        libedit-dev \
        libonig-dev \
    && compile-php.sh \
    # clean up
    && apt-get remove -y --no-install-recommends  \
        wget \
        file \
        build-essential \
        autoconf \
        bison \
        cmake \
        pkg-config \
        re2c \
        dpkg-dev \
        libprotobuf-dev \
        libboost-dev \
        libcurl4-openssl-dev \
        libfreetype6-dev \
        libjpeg-turbo8-dev \
        libpng-dev \
        libicu-dev \
        libmysqlclient-dev \
        libssl-dev \
        zlib1g-dev \
        libxml2-dev \
        libzip-dev \
        libargon2-0-dev \
        libsodium-dev \
        libedit-dev \
        libsqlite3-dev \
        libonig-dev \
    && apt-get autoremove -y \
    && rm -rf /var/lib/apt/lists/*

COPY docker-php-entrypoint.sh /usr/local/bin/
RUN ["chmod", "+x", "/usr/local/bin/docker-php-entrypoint.sh"]
ENTRYPOINT ["/usr/local/bin/docker-php-entrypoint.sh"]

CMD ["php", "-a"]


ARG user
ARG uid

RUN useradd -u $uid $user \
    && mkdir /home/xdevapi && chown $user:$user /home/xdevapi