from diagrams import Cluster, Diagram
from diagrams.aws.analytics import ES
from diagrams.elastic.elasticsearch import Beats
from diagrams.elastic.elasticsearch import Kibana
from diagrams.elastic.elasticsearch import Logstash

filebeat_version      = 'v8.7.1'
metricbeat_version    = 'v8.7.1'
logstash_version      = 'v8.7.1'
kibana_version        = 'v8.8.1'
elastic_version       = 'v8.8.1'

print("\nGenerating Diagram...")

with Diagram("Docker cluster", show=True):

    with Cluster("Elastic"):

        metricbeat    = Beats("Metricbeat: " +metricbeat_version)
        filebeat      = Beats("Filebeat: " +filebeat_version)
        logstash      = Logstash("Logstash: " +logstash_version)
        kibana        = Kibana("Kibana: " +kibana_version)
        elasticsearch = ES("Elasticsearch: " +elastic_version)

    metricbeat >> elasticsearch
    filebeat >> elasticsearch
    logstash >> elasticsearch
    elasticsearch << kibana