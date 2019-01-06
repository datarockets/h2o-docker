FROM alpine

RUN apk update \
    && apk upgrade \
    && addgroup -S h2o \
    && adduser -D -S -h /h2o -s /sbin/nologin -G h2o h2o \
    && mkdir /var/run/h2o \
    && chown h2o:h2o /var/run/h2o \
    && apk add openssl \
    && apk add h2o
COPY --chown=h2o:h2o base.yml /h2o/base.yml

EXPOSE 80
CMD h2o -c /h2o/base.yml
