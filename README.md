# Elastic Stack

## Content

- [Prerequisites](#prerequisites)
- [Install](#install)
- [Usage](#usage)


This repository contains a Docker Compose file that allows you to easily set up and deploy the Elastic Stack, consisting of Elasticsearch, Kibana, Logstash, Filebeat, and Metricbeat.

The Elastic Stack is a powerful suite of open-source tools used for centralized logging, log analysis, and monitoring.

![](docker_cluster.png)

## Prerequisites

Before using this Docker Compose configuration, make sure you have the following prerequisites installed on your system:

* Docker: [Install Docker](https://docs.docker.com/install/)
* Docker Compose: [Install Docker Compose](https://docs.docker.com/compose/install/)

## Install

To start the Elastic Stack services, follow these steps:

1. Clone this repository to your local machine.
2. Navigate to the repository directory.

```
$ git clone https://github.com/hivagr/elasticstack.git
$ cd elasticstack
```

3. Adjust the configuration files as needed (see the Configuration section below).

### Start Basic

Start the basic services using Docker Compose.

```
$ docker-compose up -d
```

This command will pull the necessary Docker images, create and start the containers (Elasticsearch, Logstash, Kibana, Metricbeat & Filebeat) in the background. Please note that the first startup might take a few minutes as the images are downloaded.

1. Once the services are up and running, you can access the following components:
* Elasticsearch: http://localhost:9200
* Kibana: http://localhost:5601

### Start Fleet server

To install the Fleet server follow the following steps:

1. Go to [Fleet Settings](http://localhost:5601/app/fleet/agents) go to outputs and edit the Hosts field:

   from `http://elasticsearch:9200` to `https://es01:9200`

   In the **Advanced YAML configuration** field add:

   ```
   ssl.certificate_authorities: ['/usr/share/certs/ca/ca.crt']
   ```

   click on **Save and apply settings** and **Save and deploy**


2. Go to [Fleet Agents](http://localhost:5601/app/fleet) click on **add server** and fill in the name `fleet-server` and add the url `https://fleet-server:8220`  and click on **Generate Fleet Server Policy**

   Now copy the `fleet-server-service-token` from the output and paste it in the `docker-fleet-server.yml` as the value of the environment variable `FLEET_SERVER_SERVICE_TOKEN`

   Start the docker-compose file this wil start a elastic-agent with a fleet-server integration and add it to elastic cluster.
   ```
   docker-compose -f docker-fleet-server.yml up -d
   ```

### Start APM

There are 2 option that you can use for APM one that runs as a integration based on the elastic-agent and one that runs as separate server.

#### Based on elastic-agent

1. Go the [APM](http://localhost:5601/app/home#/tutorial/apm) integration and click on **APM integration** and then on **Add Elastic APM** <br>

   Fill in the following fields:

   **Integration name:** `apm`<br>
   **Host:** `agent-apm:8200`<br>
   **URL:** `http://agent-apm:8200`<br>
   **New agent policy name::** `apm-policy`<br>

   And click on **Save and continue**

2. Now a pop-up is shown click now on **Add Elastic Agent to your hosts**
3. Copy from the output the `enrollment-token` and paste it in the `docker-agent-apm.yml` as the value of the environment variable `FLEET_ENROLLMENT_TOKEN`
4. Start now the docker-compose file this wil start a elastic-agent container with the APM integration and add it to the elastic cluster.
   ```
   docker-compose -f docker-agent-apm up -d
   ```
5. Click now on **Install APM Agent** and then **Check APM Server status**

#### Based on APM server

1. Start the docker-compose file this will start a apm-server container and it will add it to the elastic cluster.
   ```
   docker-compose -f docker-apm.yml up
   ```


## Usage

The configuration files for each component are located in the config directory. Feel free to modify these files according to your requirements.

Here's a brief overview of each component's configuration directories:

* APM-server: `apm-server`
* Filebeat: `filebeat`
* Logstash: `logstash`
* metricbeat: `metricbeat`

Make sure to restart the respective services after making any changes to the configuration files.

### Example messages

In the `usage` directory you can find some files that you can use for the usage of Elastic.

#### Logstash

This will post a minimal message on port `5044` where logstash is listening on:

```bash
curl -XPOST -H "Content-Type: application/json" -d '{
  "@timestamp": "2023-07-13T12:34:56.789Z",
  "message": "This is a sample log entry.",
  "severity": "INFO",
  "source": "example.com",
  "application": "myapp"
}' http://localhost:5044
```

This will post a couple of messages on port `5044` where logstash is listening on:

```bash
./send_http_logstash.sh
```
