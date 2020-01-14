FROM openjdk:8u121-jre-alpine

RUN apk add --update curl bash ttf-dejavu && rm -rf /var/cache/apk/*

ENV EDITOR_BACKEND_ROOT="/opt/gtfs-editor"

WORKDIR ${EDITOR_BACKEND_ROOT}

ADD run.sh ${EDITOR_BACKEND_ROOT}/run.sh
ADD auth0.pem /auth0.pem
ADD configurations/default/env.yml ${EDITOR_BACKEND_ROOT}/env.yml
ADD configurations/default/server.yml ${EDITOR_BACKEND_ROOT}/server.yml
ADD target/dt-*.jar ${EDITOR_BACKEND_ROOT}/server.jar

ENV PORT=9966
EXPOSE ${PORT}

EXPOSE 4000

ENTRYPOINT exec ./run.sh