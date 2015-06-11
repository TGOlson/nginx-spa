# nginx-spa

Configuration for an nginx supported single page app run on docker.

Requirements:

1. Place all static assets in `/assets`. This will be the root static asset directory.

For example if your site is available at `example.com`, `example.com/index.html` will be served from `/assets/index.html`. Likewise, `example.com/css/styles.css` will be served from `/assets/css/styles.css`.

2. Provide an api server located at `http://api:8000`. The nginx server will forward all requests to `/api` to `http://api:8000`. Note: this will require [linking containers together](https://docs.docker.com/userguide/dockerlinks/) either manually or through a tool like `docker-compose`.

For example if your site is available at `example.com`, a request to `example.com/api/give/me/data` will be forwarded to `example.com/give/me/data`.
