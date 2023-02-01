# Build container
FROM eclipse-temurin:11-jdk as builder

WORKDIR /build
COPY . .

RUN ./gradlew --no-daemon --parallel build installDist


# App container
FROM eclipse-temurin:11-jre

# Install and configure Neo4j
RUN apt-get update \
    && apt-get --no-install-recommends install -y wget gnupg
RUN wget -O - https://debian.neo4j.com/neotechnology.gpg.key | gpg --dearmor -o /etc/apt/keyrings/neo4j.gpg \
    && echo 'deb [signed-by=/etc/apt/keyrings/neo4j.gpg] https://debian.neo4j.com stable 4.4' | tee /etc/apt/sources.list.d/neo4j.list \
    && apt-get update \
    && apt-get --no-install-recommends install -y neo4j
RUN neo4j-admin set-initial-password password

COPY --from=builder /build/cpg-contract-checker-app/build/install/ /
RUN ln -s /cpg-contract-checker-app/bin/cpg-contract-checker-app /usr/local/bin/
