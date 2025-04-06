#!/bin/bash
set -e
SELF=`readlink -f $0`
DIR=`dirname $SELF`
if [ "$1" == "" ]; then
    NB_THREADS=$((`nproc`))
else
    NB_THREADS=$1
fi

killall memcached | true
memcached -t ${NB_THREADS} &
MEMCACHED_PID=$!
sleep 2

/usr/local/bin/memtier_benchmark --protocol=memcache_text --key-pattern P:P --port=11211 --hide-histogram -t $((NB_THREADS/2)) -n $((524288/NB_THREADS/2)) -o /tmp/memtier_results

echo "" 1>&2

cat /tmp/memtier_results | grep -E "Totals" | sed "s/Totals *\([0-9.]\+\)\s*[0-9.]\+\s*[0-9.]\+\s*\([0-9.]\+\).*/[Memcached]: \1 ops\/sec    Latency: \2 ms/g" >&2

kill $MEMCACHED_PID 2>/dev/null >/dev/null
wait $MEMCACHED_PID 2>/dev/null >/dev/null
