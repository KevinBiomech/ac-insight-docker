#!/bin/bash

AC_NAME="EQL"
AC_SUPPLY=500000000
SAPLING_ACTIVATION_HEIGHT=5000000

USER=my_rpcuser
PASSWD=my_rpcpassword
SEEDIP=46.101.124.153

docker run -d --rm --name $AC_NAME -ti \
  --net host \
  --mount "src=$AC_NAME,dst=/home/komodo/" \
  kmdplatform/komodod:sapling_lite \
  -rpcuser=$USER \
  -rpcpassword=$PASSWD \
  -bind=0.0.0.0 \
  -rpcbind=127.0.0.1 \
  -rpcallowip=0.0.0.0/0 \
  -whitelist=127.0.0.1 \
  -ac_name=$AC_NAME \
  -ac_supply=$AC_SUPPLY \
  -ac_sapling=$SAPLING_ACTIVATION_HEIGHT \
  -addnode=$SEEDIP \
  -printtoconsole=1 \
  -server=1 \
  -txindex=1 \
  -addressindex=1 \
  -timestampindex=1 \
  -spentindex=1 \
  -uacomment='bitcore' \
  -showmetrics=0 \
  -zmqpubrawtx='tcp://127.0.0.1:8332' \
  -zmqpubhashblock='tcp://127.0.0.1:8332' \
  -reindex
