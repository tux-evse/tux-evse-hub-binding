#!/usr/bin/bash

/usr/bin/afb-binder -M -p 8081 -vvv \
    --auto-api=/run/user/${UID}/apis/ws/ \
    --roothttp /usr/redpesk/tux-evse-hub-binding/htdocs