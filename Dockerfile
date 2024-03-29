FROM ubuntu:jammy
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -q \
    && apt-get install -qy build-essential wget libfontconfig1

# Install TexLive with scheme-basic
RUN wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz; \
	mkdir /install-tl-unx; \
	tar -xvf install-tl-unx.tar.gz -C /install-tl-unx --strip-components=1; \
    echo "selected_scheme scheme-basic" >> /install-tl-unx/texlive.profile; \
	/install-tl-unx/install-tl -profile /install-tl-unx/texlive.profile; \
    rm -r /install-tl-unx; \
	rm install-tl-unx.tar.gz

ENV PATH="/usr/local/texlive/2023/bin/x86_64-linux:${PATH}"

# Install latex packages
RUN tlmgr install latexmk xifthen ifmtarg gillius xkeyval fontspec moresize fontawesome5 luatexbase paracol multirow wrapfig float pgf transparent \
    etoolbox

ENV HOME /data
WORKDIR /data

VOLUME ["/data"]
