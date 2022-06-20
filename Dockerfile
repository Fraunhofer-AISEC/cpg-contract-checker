# Build container
FROM eclipse-temurin:11-jdk as builder

WORKDIR /build
COPY . .

RUN ./gradlew --no-daemon --parallel build installDist


# App container
FROM eclipse-temurin:11-jre

COPY --from=builder /build/cpg-contract-checker-app/build/install/ /
RUN ln -s /cpg-contract-checker-app/bin/cpg-contract-checker-app /usr/local/bin/
