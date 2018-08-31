FROM 537872560676.dkr.ecr.eu-central-1.amazonaws.com/nginx:1.13-alpine

ARG ENVIRONMENT
ENV ENVIRONMENT $ENVIRONMENT

COPY ./app /var/www/html

# Config files
COPY ./docker/builds/web/$ENVIRONMENT/config/default.conf /etc/nginx/conf.d/default.conf

RUN \
    chown www-data:www-data /etc/nginx/conf.d/default.conf && \
    # Find and chown files that have not proper permission (much faster than a recursive chown)
    find /var/www/html -not -user www-data -exec chown www-data {} \+ && \
    find /var/www/html -not -group www-data -exec chgrp www-data {} \+

COPY ./docker/builds/web/$ENVIRONMENT/thecamp-unlock-web-app-frontend-entrypoint /usr/local/bin/
RUN chmod 755 /usr/local/bin/thecamp-unlock-web-app-frontend-entrypoint

ENTRYPOINT ["thecamp-unlock-web-app-frontend-entrypoint"]
CMD ["nginx", "-g", "daemon off;"]