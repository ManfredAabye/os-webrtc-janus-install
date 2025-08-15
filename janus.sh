#!/bin/bash

start_janus() {
    screen -fa -S VOICESERVER -d -U -m janus
}

stop_janus() {
    screen -S VOICESERVER -X quit
}

restart_janus() {
    stop_janus
    sleep 2
    start_janus
}

case "$1" in
    start)
        start_janus
        ;;
    stop)
        stop_janus
        ;;
    restart)
        restart_janus
        ;;

    *)
        echo "Benutzung: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac