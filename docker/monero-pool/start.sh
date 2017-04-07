#!/bin/bash
docker run -id -d --restart unless-stopped --cpuset-cpus=0 -m 256m --name redis redis
docker run -it -d -v /data/monero/chain:/root/.bitmonero -v /data/monero/wallet:/wallet -p 18080:18080 -p 18081:18081 -p 18082:18082 --restart unless-stopped --cpuset-cpus=0 -m 1g --name monerod monerod
