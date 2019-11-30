#!/bin/sh

if [ -n "$USER_NAME" -a -n "$USER_PASSWORD" ];then
  SERVER_SETTING="auth_basic \"Auth\";auth_basic_user_file /etc/nginx/.htpasswd;"
else
  SERVER_SETTING=""
fi
cat /tmp/nginx.conf.template | \
  sed -e "s/{{TARGET}}/${TARGET}/g" | \
  sed -e "s/{{SERVER_SETTING}}/${SERVER_SETTING}/g" \
  > /etc/nginx/nginx.conf
htpasswd -m -b -c /etc/nginx/.htpasswd "${USER_NAME}" "${USER_PASSWORD}" 

exec "$@"

