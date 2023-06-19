FROM alpine:3.18@sha256:82d1e9d7ed48a7523bdebc18cf6290bdb97b82302a8a9c27d4fe885949ea94d1

LABEL maintainer="Jose Manuel Requena Plens <jmrplens@protonmail.com>"

RUN apk update && \
    apk upgrade && \
    apk add curl=8.1.2-r0
    

COPY ./update-cloudflare-records.sh /usr/local/bin
COPY ./update-cloudflare-records.yaml /usr/local/bin

RUN cp -a /usr/local/bin/update-cloudflare-records.sh /usr/local/bin/update-cloudflare-records
RUN rm -rf /usr/local/bin/update-cloudflare-records.sh
RUN chmod +x /usr/local/bin/update-cloudflare-records

CMD ["update-cloudflare-records"]