#!/usr/bin/env bash
SENTINEL_VERSION="0.18.4"
SENTINEL_URL="https://releases.hashicorp.com/sentinel/${SENTINEL_VERSION}/sentinel_${SENTINEL_VERSION}_linux_amd64.zip"
SENTINEL_ZIP_DIR="sentinel"
TMP_DIR="/workspace"

################# Download protoc #################
echo "Downloading Sentinel ......"
apt update -y
apt install wget unzip -y
wget ${SENTINEL_URL} -P ${TMP_DIR}/${SENTINEL_ZIP_DIR}
unzip -o ${TMP_DIR}/${SENTINEL_ZIP_DIR}/sentinel_${SENTINEL_VERSION}_linux_amd64.zip -d ${TMP_DIR}/${SENTINEL_ZIP_DIR}