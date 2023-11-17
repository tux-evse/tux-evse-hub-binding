#!/usr/bin/bash

LIST_API=""

for API in $(ls /run/user/${UID}/apis/ws/); do
    LIST_API="${LIST_API} --ws-client unix:/run/user/${UID}/apis/ws/${API}"
done

/usr/bin/afb-binder -M -p 8081 -vvv \
    ${LIST_API} \
    --roothttp /usr/redpesk/tux-evse-hub-binding/htdocs