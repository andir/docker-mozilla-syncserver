#!/bin/bash

#if settings-file not existing, template it
[ ! -f $CONFIG_HOME/syncserver.ini ] && dockerize -template $CONFIG_HOME/syncserver.ini.j2:$CONFIG_HOME/syncserver.ini

cd $SERVER_HOME
# run sync-server
./local/bin/gunicorn --access-logfile=- --error-logfile=- --paste $CONFIG_HOME/syncserver.ini
