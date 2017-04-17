FROM nginx:1.11-alpine

RUN rm /etc/nginx/conf.d/default.conf
RUN rm /etc/nginx/nginx.conf

COPY nginx.conf /etc/nginx/
COPY templates/ templates/
COPY run.sh run.sh

ENTRYPOINT ./run.sh
