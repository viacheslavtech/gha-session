FROM registry.access.redhat.com/ubi8/openjdk-17-runtime:1.14

EXPOSE 8080

ARG SEMVER_NEW_VERSION
ENV SEMVER_NEW_VERSION=${SEMVER_NEW_VERSION:-v0.0.1-default}

ENV APP_HOME=/opt/gha-session
ENV LOG_DIR=/opt/gha-session/logs


RUN mkdir -p ${LOG_DIR}
COPY gha-session-${SEMVER_NEW_VERSION}.jar ${APP_HOME}/app.jar

WORKDIR ${APP_HOME}

ENTRYPOINT ["java", "-jar","app.jar"]