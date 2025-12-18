FROM eclipse-temurin:21-jre-jammy

WORKDIR /app

COPY build/libs/*.jar app.jar
RUN mkdir /otel

ADD https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v2.23.0/opentelemetry-javaagent.jar \
    /otel/opentelemetry-javaagent.jar

RUN addgroup --system appgroup && adduser --system appuser --ingroup appgroup && chown -R appuser:appgroup /app /otel
USER appuser

EXPOSE 8080

ENV JAVA_TOOL_OPTIONS="-javaagent:/otel/opentelemetry-javaagent.jar"
ENTRYPOINT ["java","-jar","/app/app.jar"]