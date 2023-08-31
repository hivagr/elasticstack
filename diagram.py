from diagrams import Cluster, Diagram
from diagrams.aws.analytics import ES
from diagrams.elastic.observability import APM
from diagrams.elastic.elasticsearch import Beats
from diagrams.elastic.elasticsearch import Kibana
from diagrams.elastic.elasticsearch import Logstash
from dotenv import load_dotenv
import os

load_dotenv()

apm_version           = os.getenv("STACK_VERSION")
filebeat_version      = os.getenv("STACK_VERSION")
metricbeat_version    = os.getenv("STACK_VERSION")
logstash_version      = os.getenv("STACK_VERSION")
kibana_version        = os.getenv("STACK_VERSION")
elastic_version       = os.getenv("STACK_VERSION")

print("\nGenerating Diagram...")

with Diagram("Docker cluster", show=True):

    with Cluster("Elastic"):

        apmserver     = APM("APM-server: " +apm_version)
        metricbeat    = Beats("Metricbeat: " +metricbeat_version)
        filebeat      = Beats("Filebeat: " +filebeat_version)
        logstash      = Logstash("Logstash: " +logstash_version)
        kibana        = Kibana("Kibana: " +kibana_version)
        elasticsearch = ES("Elasticsearch: " +elastic_version)

    apmserver >> elasticsearch
    metricbeat >> elasticsearch
    filebeat >> elasticsearch
    logstash >> elasticsearch
    elasticsearch << kibana