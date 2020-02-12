FROM openjdk:11
FROM maven:3.6.3-jdk-11

RUN git clone https://github.com/WDAqua/Qanary

WORKDIR /Qanary

RUN mvn clean install -Ddockerfile.skip=true
RUN find /Qanary/qanary_pipeline-template/target/ -name "qa.pipeline-*.*.*.jar" -exec cp {} /Qanary/qanary_pipeline-template/target/qa.pipeline-latest.jar \;

# there is a prepared Stardog triplestore, change the triplestore definition to your own
ENTRYPOINT java -jar /Qanary/qanary_pipeline-template/target/qa.pipeline-latest.jar --qanary.triplestore="http://admin:admin@webengineering.ins.hs-anhalt.de:40158/qanary"

