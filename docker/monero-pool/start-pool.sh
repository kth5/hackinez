#!/bin/bash
docker run -it -d -p 3333:3333 -p 5555:5555 -p 7777:7777 -p 8117:8117 -p 8888:8888 --link redis:redis --link monerod:monerod --restart unless-stopped --cpuset-cpus=1 -m 768m --name xmr-pool cryptonote-xmr-pool
