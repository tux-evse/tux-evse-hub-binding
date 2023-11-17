#!/usr/bin/bash

/usr/bin/afb-binder -M -p 8080 -vvv \
    --ws-client unix:/run/user/${UID}/apis/ws/helloworld \
    --roothttp /usr/redpesk/tux-evse-hub-binding/htdocs