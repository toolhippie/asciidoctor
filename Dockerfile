FROM ghcr.io/dockhippie/ruby:latest@sha256:d02cb54261cf9551bcc72f96f53ced9b235e681580455f383d56619a107cca42
ENTRYPOINT [""]

# renovate: datasource=rubygems depName=asciidoctor
ENV ASCIIDOCTOR_VERSION=2.0.26

# renovate: datasource=rubygems depName=asciidoctor-pdf
ENV ASCIIDOCTOR_PDF_VERSION=2.3.24

# renovate: datasource=rubygems depName=asciidoctor-diagram
ENV ASCIIDOCTOR_DIAGRAM_VERSION=3.1.0

# renovate: datasource=rubygems depName=asciidoctor-epub3
ENV ASCIIDOCTOR_EPUB3_VERSION=2.3.0

# renovate: datasource=rubygems depName=asciidoctor-mathematical
ENV ASCIIDOCTOR_MATHEMATICAL_VERSION=0.3.5

# renovate: datasource=rubygems depName=asciidoctor-revealjs
ENV ASCIIDOCTOR_REVEALJS_VERSION=5.2.0

RUN apk update && \
  apk upgrade && \
  apk add py3-pygments py3-seqdiag@testing py3-nwdiag@testing cmake bison flex-dev mtex2mml-dev lasem-dev ruby-mathematical && \
  gem install asciidoctor:${ASCIIDOCTOR_VERSION} asciidoctor-pdf:${ASCIIDOCTOR_PDF_VERSION} asciidoctor-diagram:${ASCIIDOCTOR_DIAGRAM_VERSION} asciidoctor-epub3:${ASCIIDOCTOR_EPUB3_VERSION} asciidoctor-mathematical:${ASCIIDOCTOR_MATHEMATICAL_VERSION} asciidoctor-revealjs:${ASCIIDOCTOR_REVEALJS_VERSION} rouge coderay pygments.rb epubcheck kindlegen && \
  apk del cmake bison flex-dev mtex2mml-dev lasem-dev && \
  rm -rf /var/cache/apk/*
