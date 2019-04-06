FROM alexdo/python-2.4-alpine

ENV PIP=6.0.8 \
    ZC_BUILDOUT=2.2.5 \
    SETUPTOOLS=9.1 \
    PLONE_MAJOR=3.3 \
    PLONE_VERSION=3.3.6 \
    DOWNLOAD_FILENAME=Plone-3.3.6-UnifiedInstaller-20110816.tgz 

RUN addgroup -g 500 plone \
 && adduser -S -D -G plone -u 500 plone \
 && mkdir -p /plone /data

RUN apk add --no-cache --virtual .build-deps \
    gcc \
    libc-dev \
    zlib-dev \
    libjpeg-turbo-dev \
    libpng-dev \
    libxml2-dev \
    libxslt-dev \
    build-base \
    pcre-dev \
 && apk add --no-cache --virtual .run-deps \
    su-exec \
    bash \
    rsync \
    zlib \
    libxml2 \
    libxslt \
    libjpeg-turbo \
 && wget -O Plone.tgz https://launchpad.net/plone/$PLONE_MAJOR/$PLONE_VERSION/+download/$DOWNLOAD_FILENAME \
 && tar -zxvf Plone.tgz  \
 && ./Plone-$PLONE_VERSION-UnifiedInstaller/install.sh standalone \
        --target=/plone \
        --libz=global \
        --libjpeg=global \
        --with-python=/usr/local/bin/python2.4 ; cat /install.log \
 && rm -rf /plone/zinstance \
 && ln -s /data /plone/zinstance \
 && chown -R plone:plone /plone /data \
 && apk del .build-deps \
 && rm -rf /Plone.tgz /Plone-$PLONE_VERSION-UnifiedInstaller install.log /plone/buildout-cache/downloads/*

VOLUME /data

COPY docker-entrypoint.sh /

EXPOSE 8080
WORKDIR /plone/zinstance

HEALTHCHECK --interval=1m --timeout=5s --start-period=1m \
  CMD nc -z -w5 127.0.0.1 8080 || exit 1

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["start"]