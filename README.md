Hardware & Co - Benchmark Memcached
===================================

Benchmark memcached utilisé pour les tests CPU de [Hardware & Co](https://hardwareand.co/). Lance un benchmark de memcached en utilisant [memtier](https://github.com/RedisLabs/memtier_benchmark). Nécessite le paquet (Ubuntu/Debian) `memcached` et l'installation de `memtier-benchmark`.

## Utilisation
`./bench.sh`

## Sortie
Lire la dernières lignes produites par la commande, de format :
```
[RUN #1 100%,   6 secs]  0 threads:     2000000 ops,  344135 (avg:  318832) ops/sec, 9.81MB/sec (avg: 9.09MB/sec),  0.58 (avg:  0.63) msec latency
``` 

Le score final est donné par le nombre d'opérations moyenne par secondes, ici 318832 ops/sec.

Copyright © 2025 Nicolas Derumigny.
This work is free. You can redistribute it and/or modify it under the
terms of the Do What The Fuck You Want To Public License, Version 2,
as published by Sam Hocevar. See the COPYING file for more details.
