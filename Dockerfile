FROM nginx
ADD nginx.conf /etc/nginx/nginx.conf
RUN mkdir assets
