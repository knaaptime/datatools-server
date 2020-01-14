FROM maven:3-jdk-8

RUN apt-get update && apt-get -y install curl

ENV EDITOR_BACKEND_ROOT="/opt/gtfs-editor"

WORKDIR ${EDITOR_BACKEND_ROOT}

ADD pom.xml ${EDITOR_BACKEND_ROOT}/pom.xml
ADD src ${EDITOR_BACKEND_ROOT}/src
ADD configurations ${EDITOR_BACKEND_ROOT}/configurations
ADD jmeter ${EDITOR_BACKEND_ROOT}/jmeter
ADD scripts ${EDITOR_BACKEND_ROOT}/scripts
ADD .git ${EDITOR_BACKEND_ROOT}/.git

# Build OTP
RUN mvn package -DskipTests=true
