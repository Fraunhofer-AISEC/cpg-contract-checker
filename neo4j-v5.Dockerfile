# Build container
FROM eclipse-temurin:17-jdk as builder

WORKDIR /build
COPY . .

RUN ./gradlew --no-daemon --parallel build installDist


# App container
FROM eclipse-temurin:17-jre

# Install and configure Neo4j
RUN apt-get update \
    && apt-get --no-install-recommends install -y wget gnupg
RUN wget -O - https://debian.neo4j.com/neotechnology.gpg.key | gpg --dearmor -o /etc/apt/keyrings/neo4j.gpg \
    && echo 'deb [signed-by=/etc/apt/keyrings/neo4j.gpg] https://debian.neo4j.com stable 5' | tee /etc/apt/sources.list.d/neo4j.list \
    && apt-get update \
    && apt-get --no-install-recommends install -y neo4j
    
#RUN mkdir /etc/neo4j/plugins
RUN pwd
RUN find . | grep neo4j/plugins

#RUN wget -P /etc/neo4j/plugins https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/5.19.0/apoc-5.19.0-extended.jar

RUN ls -lah /usr/share/neo4j
RUN ls -lah /var/lib/neo4j
RUN ls -lah /etc/neo4j

#RUN mkdir /usr/share/neo4j/plugins
#RUN wget -P /usr/share/neo4j/plugins https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/5.19.0/apoc-5.19.0-extended.jar

#RUN ls /var/lib/neo4j/
#RUN wget -P /var/lib/neo4j/plugins/ https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/5.19.0/apoc-5.19.0-extended.jar
#RUN ls /usr/share/neo4j/plugins
#ENV NEO4J_HOME=/usr/share/neo4j

RUN neo4j-admin dbms set-initial-password password



COPY --from=builder /build/cpg-contract-checker-app/build/install/ /
RUN ln -s /cpg-contract-checker-app/bin/cpg-contract-checker-app /usr/local/bin/
