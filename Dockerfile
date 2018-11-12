FROM ubuntu:18.04

ARG VERSION

RUN set -ex; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		software-properties-common \
	; \
	apt-add-repository ppa:bitcoin/bitcoin; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		bitcoind-${VERSION} \
	; \
	rm -rf /var/lib/apt/lists/*

RUN useradd -m -u 1000 -s /bin/bash runner
USER runner

ENTRYPOINT ["bitcoind"]
