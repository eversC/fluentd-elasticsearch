FROM fluent/fluentd:v0.14.25-onbuild
LABEL maintainer="eversmcc@gmail.com"

RUN apk add --update --virtual .build-deps \
        sudo build-base ruby-dev \

 && sudo gem install \
        fluent-plugin-elasticsearch \
        fluent-plugin-kubernetes_metadata_filter \

 && sudo gem sources --clear-all \
 && apk del .build-deps \
 && rm -rf /var/cache/apk/* \
           /home/fluent/.gem/ruby/2.3.0/cache/*.gem

EXPOSE 24284