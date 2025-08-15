#!/bin/bash

JANUS_BIN="/opt/janus/bin/janus"
JANUS_CFG="/opt/janus/etc/janus"
PIDFILE="/var/run/janus.pid"

start_janus() {
    if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
        echo "Janus läuft bereits (PID $(cat $PIDFILE))!"
    else
        echo "Starte Janus..."
        nohup $JANUS_BIN -C $JANUS_CFG > /var/log/janus.log 2>&1 &
        echo $! > $PIDFILE
        echo "Janus gestartet (PID $!)."
    fi
}

stop_janus() {
    if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
        echo "Stoppe Janus (PID $(cat $PIDFILE))..."
        kill "$(cat "$PIDFILE")"
        rm -f "$PIDFILE"
        echo "Janus gestoppt."
    else
        echo "Janus läuft nicht."
    fi
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
    status)
        if [ -f "$PIDFILE" ] && kill -0 "$(cat "$PIDFILE")" 2>/dev/null; then
            echo "Janus läuft (PID $(cat $PIDFILE))."
        else
            echo "Janus läuft nicht."
        fi
        ;;
    *)
        echo "Benutzung: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac