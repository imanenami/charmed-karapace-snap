#!/bin/bash

set -e

"${SNAP}"/usr/bin/setpriv \
    --clear-groups \
    --reuid snap_daemon \
    --regid snap_daemon -- \
    "${SNAP}"/bin/karapace "${SNAP_DATA}"/etc/karapace/karapace.config.json \
    >"${SNAP_COMMON}/var/log/karapace/server.log" 2>&1
