#!/bin/bash

# 获取 Bash 脚本所在目录绝对路径
SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
readonly BASE_DIR=$SCRIPT_DIR

readonly files_dir=$BASE_DIR/files
readonly gost_url='https://github.com/ginuerzh/gost/releases/latest/download/gost-linux-amd64-2.11.2.gz'
readonly webproc_url='https://github.com/jpillora/webproc/releases/latest/download/webproc_0.4.0_linux_amd64.gz'

mkdir -p "$files_dir"
curl -L "$gost_url" | zcat > "$files_dir/gost"
curl -L "$webproc_url" | zcat > "$files_dir/webproc"

cp "$BASE_DIR/gost_cfg.json" "$files_dir"/


readonly IMG_TAG='tecpoirot/webproc-gost'

docker build -t "$IMG_TAG" "$BASE_DIR"

docker push "$IMG_TAG"
