FROM alpine:latest

COPY ./files/webproc /webproc_gost/webproc
COPY ./files/gost /webproc_gost/gost
COPY ./files/gost_cfg.json /etc/gost_config.json

RUN chmod +x /webproc_gost/webproc
RUN chmod +x /webproc_gost/gost


EXPOSE 80 1080

WORKDIR /webproc_gost/

CMD ./webproc -p 80 -c /etc/gost_config.json -- ./gost -C /etc/gost_config.json

