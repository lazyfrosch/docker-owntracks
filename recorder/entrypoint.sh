#!/bin/bash

VOL=/data

handle_env() {
    var="$1"
    value="${!var}"
    if [ -n "$value" ]; then
        echo "Setting config value for ${var}..."
        echo "${var} = \"${value}\"" >> /etc/default/ot-recorder
    fi
}

handle_env OTR_HOST
handle_env OTR_USER
handle_env OTR_PASS

test -d "$VOL/store" || mkdir "$VOL/store"

chown -R owntracks.owntracks "$VOL"

exec "$@"
