#!/bin/sh
# 宝塔面板数据备份
set -e
DATE=$(date +%Y%m%d%H%M%S)
echo '开始备份...'
cd /docker_backup
tar -cpvzf /docker_backup/export/baota_backup_$DATE.tar.gz data
echo -e "\033[32m 备份成功! /docker_backup/export/baota_backup_${DATE}.tar.gz \033[0m"
