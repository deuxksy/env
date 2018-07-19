#!/bin/sh
#
#/etc/rc.d/init.d/<servicename>
#<description of the *service*>
#<any general comments about this init script>

# Source function library.
. /etc/init.d/functions

start() {
        echo -n "Starting <servicename>: "
        <start daemons, perhaps with the daemon function>
        touch /var/lock/subsys/<servicename>
        return <return code of starting daemon>
}

stop() {
        echo -n "Shutting down <servicename>: "
        <stop daemons, perhaps with the killproc function>
        rm -f /var/lock/subsys/<servicename>
        return <return code of stopping daemon>
}

stop() {
        echo -n "process search check <servicename>: "
        return <return code of stopping daemon>
}

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    status)
        status
        ;;
    restart)
        stop
        start
        ;;
    *)
        echo "Usage: <servicename> {start|stop|status|restart}"
        exit 1
        ;;
esac
exit $?