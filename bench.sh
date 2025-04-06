#!/bin/bash
set -e
SELF=`readlink -f $0`
DIR=`dirname $SELF`
if [ "$1" == "" ]; then
    NB_THREADS=$((`lscpu | grep "^Processeur(s)" | sed -E "s/.* ([0-9]+)/\1/g"`))
else
    NB_THREADS=$1
fi

memcached -t ${NB_THREADS} &
MEMCACHED_PID=$!
sleep 2

/usr/bin/memtier_benchmark --protocol=memcache_text --port=11211 --hide-histogram -t ${NB_THREADS} -o /dev/null

kill $MEMCACHED_PID 2>/dev/null >/dev/null
wait $MEMCACHED_PID 2>/dev/null >/dev/null
