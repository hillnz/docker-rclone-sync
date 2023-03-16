FROM rclone/rclone:1.62.2

RUN apk add --no-cache \
    bash \
    coreutils

ENV RCLONE_CONFIG= RCLONE_TIME= RCLONE_DESTINATION= RCLONE_DELETE_FILES_LIST=

ADD entrypoint.sh /opt/

ENTRYPOINT /opt/entrypoint.sh
