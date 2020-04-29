![](https://raw.githubusercontent.com/WDAqua/Qanary/master/doc/logo-qanary_s.png)

# Build and run the complete Qanary Question Answering Pipeline component in a Docker container

For details about the Qanary framework see the information in the [Qanary Framework repository](https://github.com/WDAqua/Qanary).

Currently, this is an alpha software artifact. Feedback is very much welcomed.


## Motivation

Following the Qanary methodology, the [*Qanary QA Pipeline* component](https://github.com/WDAqua/Qanary/tree/master/qanary_pipeline-template) is the mediator between the [Qanary components](https://github.com/WDAqua/Qanary-question-answering-components) used to build a Question Answering system. Although it is meant to be customized (therefore the fragment *template* in the repository name) in many scenarios it has proven to be fulfilling its purpose without any change of the source code. Hence, if it is planned to implement a Qanary-driven Question Answering system with an off-the-shelf Qanary pipeline component, then the hereby provided Docker configuration will enable you to build and run easily the complete Qanary pipeline component from scratch. 

The Qanary framework repository contains a prepared [Dockerfile](https://github.com/WDAqua/Qanary/blob/master/qanary_pipeline-template/Dockerfile). It could be used to run a JAR file in a Docker container. The JAR needs to be built. In daily business, this is a faster process. However, here the complete process of building and running a Qanary Pipeline component is baked into just a single process. 

**Summing up, the Dockerfile provides you quick start and out-of-the-box solution to run a Qanary pipeline component.**

## Build and run a Qanary Pipeline component in a Docker container

For details on the following process see the official [Docker introduction](https://docs.docker.com/get-started/part2/).

***Step 1:*** Clone this repository
```
git clone https://github.com/WDAqua/Qanary-Pipeline-Docker.git
```

***Step 2:*** Switch to the cloned directory
```
cd Qanary-Pipeline-Docker
```

***Step 3:*** Build the Docker image
```
docker build --tag "qanarypipeline" .
```

***Step 4:*** Start the Docker container
Now, the Docker container will be started. Inside of the container the Qanary framework repository is cloned automatically, followed by building all Qanary framework components via Maven (which requires downloading many packages). Hence, the whole process might take a while.

The Dockerfile already contains a predefined triplestore endpoint (Stardog) that can be used for test purposes (c.f., https://github.com/WDAqua/Qanary-Pipeline-Docker/blob/master/Dockerfile#L10). Change this line to connect to your own triplestore.

To see the process you might start the Qanary Pipeline Docker container listening on port 8080 using the following command:
```
docker run --tty --publish 8080:8080 --name "qanarypipeline" qanarypipeline:latest
```

To start the component in the background (detached), you might use the following command:
```
docker run --detach --publish 8080:8080 --name "qanarypipeline" qanarypipeline
```

After the Qanary Pipeline component was built and started, it will be available at the standard URL which you might test using http://127.0.0.1:8080 (Spring Boot Admin UI) or http://127.0.0.1:8080/startquestionansweringwithtextquestion (a simple test UI).



## More information

 * Qanary framework: https://github.com/WDAqua/Qanary
 * Qanary question answering components: https://github.com/WDAqua/Qanary-question-answering-components
 * Question Answering vocabulary: https://github.com/WDAqua/QAOntology


***


While observing problems or other contributions please [create an issue](https://github.com/WDAqua/Qanary-Pipeline-Docker/issues/new).
