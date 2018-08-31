FROM 537872560676.dkr.ecr.eu-central-1.amazonaws.com/nginx:1.13-alpine

ARG ENVIRONMENT
ENV ENVIRONMENT $ENVIRONMENT

# Config files
COPY ./docker/builds/web/$ENVIRONMENT/config/default.conf /etc/nginx/conf.d/default.conf

COPY ./docker/builds/web/$ENVIRONMENT/thecamp-unlock-web-app-frontend-entrypoint /usr/local/bin/
RUN chmod 755 /usr/local/bin/thecamp-unlock-web-app-frontend-entrypoint

ENTRYPOINT ["thecamp-unlock-web-app-frontend-entrypoint"]
CMD ["nginx", "-g", "daemon off;"]