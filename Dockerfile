FROM alpine:edge


LABEL maintaner="me"
ADD script* /home/
ADD healthcheck* /home/
EXPOSE 8000

ENV S_LOC /home/script.sh

WORKDIR /home/
ENTRYPOINT ["script.sh", "&"]


HEALTHCHECK --interval=5m --timeout=3s \
  CMD /home/healthcheck.sh
 
