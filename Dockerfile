FROM webhippie/ruby:latest
ENTRYPOINT [""]

# renovate: datasource=rubygems depName=asciidoctor
ENV ASCIIDOCTOR_VERSION=2.0.17

# renovate: datasource=rubygems depName=asciidoctor-pdf
ENV ASCIIDOCTOR_PDF_VERSION=1.6.2

# renovate: datasource=rubygems depName=asciidoctor-diagram
ENV ASCIIDOCTOR_DIAGRAM_VERSION=2.2.2

# renovate: datasource=rubygems depName=asciidoctor-epub3
ENV ASCIIDOCTOR_EPUB3_VERSION=1.5.1

# renovate: datasource=rubygems depName=asciidoctor-mathematical
ENV ASCIIDOCTOR_MATHEMATICAL_VERSION=0.3.5

# renovate: datasource=rubygems depName=asciidoctor-revealjs
ENV ASCIIDOCTOR_REVEALJS_VERSION=4.1.0

RUN apk update && \
  apk upgrade && \
  apk add py-pygments py-seqdiag@testing py-nwdiag@testing py-actdiag@testing cmake bison flex-dev mtex2mml-dev lasem-dev && \
  gem install asciidoctor:${ASCIIDOCTOR_VERSION} asciidoctor-pdf:${ASCIIDOCTOR_PDF_VERSION} asciidoctor-diagram:${ASCIIDOCTOR_DIAGRAM_VERSION} asciidoctor-epub3:${ASCIIDOCTOR_EPUB3_VERSION} asciidoctor-mathematical:${ASCIIDOCTOR_MATHEMATICAL_VERSION} asciidoctor-revealjs:${ASCIIDOCTOR_REVEALJS_VERSION} rouge coderay pygments.rb epubcheck kindlegen && \
  apk del cmake bison flex-dev mtex2mml-dev lasem-dev && \
  rm -rf /var/cache/apk/*
