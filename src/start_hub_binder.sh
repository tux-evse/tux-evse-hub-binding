#!/usr/bin/bash

LIST_API=""

for API in $(ls /run/user/${UID}/apis/ws/); do
    LIST_API="${LIST_API} --ws-client public:unix:/run/user/${UID}/apis/ws/${API}"
done

/usr/bin/afb-binder -M -p 1234 -vvv \
    ${LIST_API} \
    --roothttp /usr/redpesk/tux-evse-webapp/htdocs
