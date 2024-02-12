ARG BUILD_FROM
FROM $BUILD_FROM

USER root

RUN set -ex \
 && apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    		bash go nodejs nodejs-npm \
 && apt-get purge -y  --auto-remove wget \
 && apt-get clean 

RUN go install github.com/cespare/reflex@latest

RUN pnpm install

COPY run_addon.sh /
RUN chmod a+x /run_addon.sh

ENTRYPOINT [ "/run_addon.sh" ]