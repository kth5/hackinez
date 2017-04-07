#!/bin/bash
(cd monerod; docker build -t monerod .)
(cd cryptonote-xmr-pool; docker build -t cryptonote-xmr-pool .)
