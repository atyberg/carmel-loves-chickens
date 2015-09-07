FROM nginx:1.9.4
COPY ./static /www
ADD nginx.conf /etc/nginx/nginx.conf
