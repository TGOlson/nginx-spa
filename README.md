# nginx-spa

Configuration for an nginx supported single page app run on docker.

Grab it from [docker hub](https://registry.hub.docker.com/u/tgolson/nginx-spa/).

Requirements:

1. Place all static assets in `/assets`. This will be the root static asset directory.
For example if your site is available at `example.com`, `example.com/index.html` will be served from `/assets/index.html`. Likewise, `example.com/css/styles.css` will be served from `/assets/css/styles.css`.

2. Provide an api server located at `http://api:8000`. The nginx server will forward all requests to `/api` to `http://api:8000`. Note: this will require [linking containers together](https://docs.docker.com/userguide/dockerlinks/) either manually or through a tool like `docker-compose`.
For example if your site is available at `example.com`, a request to `example.com/api/give/me/data` will be forwarded to `http://api:8000/give/me/data`.


Example Dockerfile:

```
FROM tgolson/nginx-spa
ADD ./assets /assets
```

### Advanced example using Docker Compose

```
proxy:
  image: tgolson/nginx-spa
  ports:
    - "8080:8080"
  volumes_from:
    - client
  links:
    - api
```

In this example the `nginx-spa` container still forwards all request to an api container, but also finds the expected assets from the client container.

Here is an example of the client container's `Dockerfile`.

```
FROM ubuntu
ADD ./public /assets
VOLUME /assets
```
