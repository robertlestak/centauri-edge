#!/bin/bash

mo /etc/nginx/static/index.template.html > /etc/nginx/static/index.html

/docker-entrypoint.sh nginx -g "daemon off;"