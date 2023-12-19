#!/usr/bin/bash

/usr/bin/afb-binder -M -p 1234 -vvv \
    --auto-api=/run/user/${UID}/apis/ws \
    --roothttp=/usr/redpesk/tux-evse-webapp/htdocs
