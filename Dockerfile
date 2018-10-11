FROM webhippie/ruby:latest

LABEL maintainer="Thomas Boerger <thomas@webhippie.de>" \
  org.label-schema.name="Asciidoctor" \
  org.label-schema.vendor="Thomas Boerger" \
  org.label-schema.schema-version="1.0"

ENTRYPOINT ["/usr/bin/asciidoctor"]

RUN apk update && \
  apk upgrade && \
  apk add \
    py-pygments \
    py-seqdiag@testing \
    py-nwdiag@testing \
    py-actdiag@testing \
    cmake \
    bison \
    flex-dev \
    lasem-dev \
    mtex2mml-dev && \
  gem install \
    asciidoctor \
    asciidoctor-pdf:1.5.0.alpha.16 \
    asciidoctor-diagram \
    asciidoctor-epub3:1.5.0.alpha.8 \
    asciidoctor-mathematical \
    asciidoctor-revealjs \
    rouge \
    coderay \
    pygments.rb \
    epubcheck \
    kindlegen && \
  apk del \
    cmake \
    bison \
    flex-dev \
    lasem-dev \
    mtex2mml-dev && \
  rm -rf /var/cache/apk/*
