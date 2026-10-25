# =========================================================================
# Dockerfile backend — build en 2 étapes (build Maven + runtime léger)
# =========================================================================

# ---- Étape 1 : compilation ----
FROM maven:3.9-eclipse-temurin-21 AS build
WORKDIR /app
# Cache des dépendances : on copie d'abord le pom seul
COPY pom.xml .
RUN mvn -B -q dependency:go-offline
# Puis les sources
COPY src ./src
RUN mvn -B -q package -DskipTests

# ---- Étape 2 : image d'exécution ----
FROM eclipse-temurin:21-jre-alpine
WORKDIR /app
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
