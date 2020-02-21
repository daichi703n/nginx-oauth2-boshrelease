#!/bin/bash

DIR=`pwd`

mkdir -p .downloads

cd .downloads

blob_download() {
  set -eu
  local package=$1
  local url=$2
  local f=$3
  if [ ! -f ${DIR}/blobs/${package}/${f} ];then
    curl -L -J ${url} -o ${f}
    bosh add-blob --dir=${DIR} ${f} ${package}/${f}
  fi
}

blob_download nginx http://nginx.org/download/nginx-1.17.0.tar.gz nginx-1.17.0.tar.gz
# headers-more-nginx-module-0.30.tar.gz
# nginx-upload-module-2.2.tar.gz
# pcre-8.40.tar.gz
# oauth2_proxy-2.2.0.tar.gz
# nginx-upload-module.patch
