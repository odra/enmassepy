#!/usr/bin/env bash

if [[ -z $APP_PORT ]]; then
    APP_PORT=9090
fi

if [[ -z $STATS_PORT ]]; then
    STATS_PORT=9191
fi

uwsgi \
--chdir /opt/app \
--http-socket 0.0.0.0:$APP_PORT \
--manage-script-name \
--mount /=app:app \
--stats 0.0.0.0:$STATS_PORT
