FROM docker.elastic.co/beats/elastic-agent:8.7.1
#FROM docker.elastic.co/beats/elastic-agent:${STACK_VERSION}

USER 0

RUN apt update && \
    apt install nginx -y && \
    chown -R elastic-agent:elastic-agent /var/log/nginx/*

EXPOSE 80

CMD ["nginx"]
