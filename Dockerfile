FROM docker.io/library/alpine
RUN apk add curl bash && rm -rf  /var/cache/apk
COPY init.sh /init.sh
ENTRYPOINT ["sh","/init.sh"]
