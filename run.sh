docker run \
    --name webproc-gost \
    -d \
    -p 8080:80 \
    -p 1080:1080 \
    -v /your/config/file:/etc/gost_config.json \
    --log-opt "max-size=100m" \
    -e "HTTP_USER=foo" \
    -e "HTTP_PASS=bar" \
    --restart always \
    tecpoirot/webproc-gost