FROM openjdk:18-jdk-alpine

ENV PLANTUML_VERSION=1.2021.14
ENV LANG en_US.UTF-8

RUN \
  apk add --no-cache graphviz wget ca-certificates && \
  apk add --no-cache graphviz wget ca-certificates ttf-dejavu fontconfig && \
  mkdir /plantuml && \
  wget "http://downloads.sourceforge.net/project/plantuml/${PLANTUML_VERSION}/plantuml.${PLANTUML_VERSION}.jar" -O /plantuml/plantuml.jar && \
  wget "http://beta.plantuml.net/batikAndFop.zip" -O deps.zip && \
  unzip deps.zip -d /plantuml && \
  apk del wget ca-certificates

WORKDIR /plantuml

ENTRYPOINT ["java", "-Djava.awt.headless=true", "-jar", "/plantuml/plantuml.jar", "-p"]

CMD ["-tsvg"]
