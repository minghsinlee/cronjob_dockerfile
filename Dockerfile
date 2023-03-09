FROM docker.io/library/alpine
RUN apk add curl bash && rm -rf  /var/cache/apk
COPY init.sh /init.sh
ENV PATH=$PATH:/script
ENTRYPOINT ["sh","/init.sh"]
