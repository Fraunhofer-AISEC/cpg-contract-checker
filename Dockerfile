# Build container
FROM eclipse-temurin:11-jdk as builder

WORKDIR /build
COPY . .

RUN ./gradlew --no-daemon --parallel build installDist


# App container
FROM eclipse-temurin:11-jre

# Install and configure Neo4j
RUN apt-get update && apt-get install -y wget gnupg && rm -rf /var/lib/apt/lists/*
RUN wget -O - https://debian.neo4j.com/neotechnology.gpg.key | apt-key add - && echo 'deb https://debian.neo4j.com stable latest' | tee -a /etc/apt/sources.list.d/neo4j.list && apt-get update && apt-get install -y neo4j=1:4.4.8 && rm -rf /var/lib/apt/lists/*
RUN neo4j-admin set-initial-password password

COPY --from=builder /build/cpg-contract-checker-app/build/install/ /
RUN ln -s /cpg-contract-checker-app/bin/cpg-contract-checker-app /usr/local/bin/
