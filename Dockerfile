# => Build container
FROM tcr.devfun.top/ubi9/openjdk-17:1.16-1.1693315921 as builder
USER root
WORKDIR /app
COPY . . 
RUN mvn package
        
# => Run container
FROM tcr.devfun.top/tomcat:10.1.13-jre17-temurin-jammy

# Static build
COPY --from=builder /app/target /usr/local/tomcat/webapps
