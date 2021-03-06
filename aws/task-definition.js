[
    {
        "name":"web",
        "image":"${REGISTRY}/${COMPOSE_PROJECT_NAME}-web:${GIT_LAST_TAG}",
        "essential":true,
        "environment":${TASK_ENVIRONMENT},
        "memoryReservation":${NGINX_MEMORY_LIMIT},
        "portMappings":[
            {
                "hostPort":0,
                "containerPort":80,
                "protocol":"tcp"
            },
            {
                "hostPort":0,
                "containerPort":443,
                "protocol":"tcp"
            }
        ]
    },
    {
        "name":"filebeat",
        "image":"${REGISTRY}/${COMPOSE_PROJECT_NAME}-filebeat:${GIT_LAST_TAG}",
        "essential":false,
        "environment":${TASK_ENVIRONMENT},
        "memoryReservation":${FILEBEAT_MEMORY_LIMIT},
        "volumesFrom":[
            {
                "readOnly":true,
                "sourceContainer":"web"
            }
        ],
        "command":[
            "filebeat",
            "-e"
        ]
    }
]
