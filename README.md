## webproc-gost



### 运行方式

```bash
$ docker run \
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
```

**说明：**

- 容器内 `80` 端口为 webproc 服务
- 容器内 `1080` 端口为 gost 代理服务，类行为 `auto://`，支持 HTTP 代理和 SOCKS5 代理
- gost 的默认配置文件为 `/etc/gost_config.json`，可以通过挂载自己的文件覆盖
- gost 默认配置文件只在本地启动 auto 类型代理，需要调整的话，通过 webproc 的 WebUI 进行控制

### 默认 gost 配置文件

```json
{
    "ServeNodes": [
        ":1080"
    ],
    "ChainNodes": [
    ]
}
```