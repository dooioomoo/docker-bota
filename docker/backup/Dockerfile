FROM alpine:3.9.5
LABEL maintainer="ifui <ifui@foxmail.com>"

RUN mkdir /docker_backup

COPY app_backup.sh /docker_backup/app_backup.sh
COPY import.sh /docker_backup/import.sh
COPY export.sh /docker_backup/export.sh

RUN chmod +x /docker_backup/app_backup.sh \
    && chmod +x /docker_backup/import.sh \
    && chmod +x /docker_backup/export.sh \
    && sed -i "s/\r//" /docker_backup/app_backup.sh \
    && sed -i "s/\r//" /docker_backup/import.sh \
    && sed -i "s/\r//" /docker_backup/export.sh



CMD [ "sh", "/docker_backup/app_backup.sh" ]
