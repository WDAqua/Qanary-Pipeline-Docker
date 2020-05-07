FROM openjdk:11
FROM maven:3.6.3-jdk-11

LABEL version="0.1"
LABEL description="Docker container for out-of-the-box Qanary pipeline"

RUN git clone https://github.com/WDAqua/Qanary

WORKDIR /Qanary

RUN mvn clean install -Ddockerfile.skip=true
RUN find /Qanary/qanary_pipeline-template/target/ -name "qa.pipeline-*.*.*.jar" -exec cp {} /Qanary/qanary_pipeline-template/target/qa.pipeline-latest.jar \;

# there is a prepared Stardog 7 triplestore, change the triplestore definition to contact your own triplestore if required
EXPOSE 8080
ENTRYPOINT java -jar /Qanary/qanary_pipeline-template/target/qa.pipeline-latest.jar --qanary.triplestore="http://admin:admin@webengineering.ins.hs-anhalt.de:40158/qanary" --qanary.triplestore.stardog5=true --server.host=http://127.0.0.1 --server.port=8080


