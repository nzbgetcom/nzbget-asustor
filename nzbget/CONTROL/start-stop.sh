#!/bin/sh

APP_PATH="/usr/local/AppCentral/nzbgetcom"
NZBGET="$APP_PATH/nzbget/nzbget"

start_nzbget() {
    if [ -n "$(pidof nzbget)" ]; then
        echo "nzbget already running ..."
    else
        $NZBGET -D
    fi
}

stop_nzbget() {
    $NZBGET -Q
    sleep 1
    while [ -n "$(pidof nzbget)" ]; do
        killall nzbget
    done
}

case "$1" in
    start)
        echo "Starting nzbget ..."
        start_nzbget
        ;;

    stop)
        echo "Stopping nzbget ..."
        stop_nzbget
        ;;

    restart)
        echo "Restarting nzbget ..."
        stop_nzbget
        sleep 5
        start_nzbget
        ;;

    *)
        echo "Usage: $0 {start|stop|restart}"
        ;;
esac

exit 0
