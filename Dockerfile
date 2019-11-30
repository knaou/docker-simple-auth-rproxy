FROM nginx:alpine

RUN apk --no-cache add apache2-utils

COPY nginx.conf.template /tmp/nginx.conf.template
COPY startup.sh /startup.sh
RUN chmod +x /startup.sh

EXPOSE 3000
ENTRYPOINT /entrypoint.sh
CMD ["/usr/sbin/nginx", "-g", "daemon off;"]
