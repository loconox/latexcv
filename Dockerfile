FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update -q \
    && apt-get install -qy build-essential wget libfontconfig1

# Fixed CTAN mirror: mirror.ctan.org redirects to a random mirror, some of which
# serve an incomplete TLS certificate chain that wget rejects
ARG CTAN_MIRROR=https://ctan.mines-albi.fr/systems/texlive/tlnet

# Install TexLive with scheme-basic
RUN wget ${CTAN_MIRROR}/install-tl-unx.tar.gz \
	&& mkdir /install-tl-unx \
	&& tar -xvf install-tl-unx.tar.gz -C /install-tl-unx --strip-components=1 \
	&& echo "selected_scheme scheme-basic" >> /install-tl-unx/texlive.profile \
	&& /install-tl-unx/install-tl -profile /install-tl-unx/texlive.profile -repository ${CTAN_MIRROR} \
	&& rm -r /install-tl-unx \
	&& rm install-tl-unx.tar.gz

ENV PATH="/usr/local/texlive/2026/bin/x86_64-linux:${PATH}"

# Install latex packages
RUN tlmgr option repository ${CTAN_MIRROR} \
    && tlmgr install latexmk xifthen ifmtarg gillius xkeyval fontspec moresize fontawesome7 luatexbase paracol multirow wrapfig float pgf transparent \
    etoolbox

ENV HOME=/data
WORKDIR /data

VOLUME ["/data"]
