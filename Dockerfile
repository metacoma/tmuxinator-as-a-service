FROM tsl0922/ttyd:alpine
RUN apk update \
&& apk add ruby \
           ruby-etc \
           ruby-bigdecimal \
           ruby-io-console \
           ruby-irb \
           ca-certificates \
           libressl \
           less \
&& apk add --virtual .build-dependencies \
           build-base \
           ruby-dev \
           libressl-dev \
&& gem install bundler || apk add ruby-bundler \
&& bundle config build.nokogiri --use-system-libraries \
&& bundle config git.allow_insecure true \
&& gem install json \
\
&& gem cleanup \
&& apk del .build-dependencies \
&& rm -rf /usr/lib/ruby/gems/*/cache/* \
          /var/cache/apk/* \
          /tmp/* \
          /var/tmp/*

RUN gem install tmuxinator

