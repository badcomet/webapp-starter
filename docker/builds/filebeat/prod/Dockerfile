FROM 537872560676.dkr.ecr.eu-central-1.amazonaws.com/filebeat:5.2.2

ARG ENVIRONMENT
ENV ENVIRONMENT $ENVIRONMENT

COPY ./docker/builds/filebeat/$ENVIRONMENT/config /etc/filebeat/conf.d