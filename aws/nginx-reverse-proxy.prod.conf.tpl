upstream $COMPOSE_PROJECT_NAME-upstream {
    server $LOAD_BALANCER.$DOMAIN_NAME.$DOMAIN_EXTENSION:$HTTP_PORT;
}

server {
    listen          80;
    server_name     unlock-web-app.$DOMAIN_NAME.$DOMAIN_EXTENSION;

    # HTTPS 301 permanent
    return          301 https://$host$request_uri;
}

# server {
#     # Ugly fix because some request are still redirected to upstream port with http
#     listen          $HTTP_PORT;
#     server_name     map.$DOMAIN_NAME.$DOMAIN_EXTENSION;
#
#     # HTTPS 301 permanent
#     return          301 https://$host$request_uri;
# }

server {
    listen                      443;
    server_name                 unlock-web-app.$DOMAIN_NAME.$DOMAIN_EXTENSION;

    ssl                         on;
    ssl_certificate             /etc/nginx/certs/aa4b7242bb72fa81.crt;
    ssl_certificate_key         /etc/nginx/certs/thecamp.deprotected.key;
    ssl_protocols               TLSv1 TLSv1.1 TLSv1.2;
    ssl_prefer_server_ciphers   On;
    ssl_ciphers                 ECDH+AESGCM:DH+AESGCM:ECDH+AES256:DH+AES256:ECDH+AES128:DH+AES:ECDH+3DES:DH+3DES:RSA+AESGCM:RSA+AES:RSA+3DES:!aNULL:!MD5:!DSS;

    access_log                  /var/log/nginx/$COMPOSE_PROJECT_NAME.$DOMAIN_NAME.$DOMAIN_EXTENSION.access.log;
    error_log                   /var/log/nginx/$COMPOSE_PROJECT_NAME.$DOMAIN_NAME.$DOMAIN_EXTENSION.error.log;
    error_page                  404 /404.html;

    # Block access to "hidden" files and directories whose names begin with a
    # period. This includes directories used by version control systems such
    # as Subversion or Git to store control files or .htaccess, .htpasswd
    location ~ (^|/)\. {
        return 403;
    }

    # Proxy pass to upstream
    location / {
        proxy_pass          http://$COMPOSE_PROJECT_NAME-upstream;
        proxy_buffering     off;
        proxy_set_header    Host                $host;
        proxy_set_header    X-Real-IP           $remote_addr;
        proxy_set_header    X-Forwarded-For     $proxy_add_x_forwarded_for;
        proxy_set_header    X-Forwarded-Host    $host:443;
        proxy_set_header    X-Forwarded-Server  $host;
        proxy_set_header    X-Forwarded-Port    $server_port;
        proxy_set_header    X-Forwarded-Proto   https;
        proxy_set_header    X-Real-Port         $server_port;
        proxy_set_header    X-Real-Scheme       $scheme;

        # Enables WS support
        proxy_http_version  1.1;
        proxy_set_header    Upgrade     $http_upgrade;
        proxy_set_header    Connection  'upgrade';
        proxy_cache_bypass  $http_upgrade;
    }
}