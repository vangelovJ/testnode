
FROM node:7-onbuild

LABEL maintaner "me"
COPY main.js /usr/src/app/main.js
COPY package.json /usr/src/app/package.json


HEALTHCHECK --interval=5s \
            --timeout=5s \
            CMD curl -f http://127.0.0.1:8000 || exit 1


EXPOSE 8000
