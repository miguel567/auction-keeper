#!/bin/bash
dir="$(dirname "$0")"

source ${dir}/my_environment.sh  # Set the RPC host, account address, and keys.
source _virtualenv/bin/activate # Run virtual environment

# Allows keepers to bid different prices
MODEL=$1

/mnt/c/Users/migue/Documents/docker/auction-keeper/bin/auction-keeper \
   --rpc-host ${SERVER_ETH_RPC_HOST:?} \
   --rpc-port ${SERVER_ETH_RPC_PORT?:} \
   --rpc-timeout 30 \
   --eth-from ${ACCOUNT_ADDRESS?:} \
   --eth-key ${ACCOUNT_KEY?:} \
   --type flip \
   --ilk ETH-A \
   --from-block 14764534 \
   --vat-dai-target 1000 \
   --model ${dir}/${MODEL} \
   --debug \
2> >(tee -a -i auction-keeper-flip-ETH-A.log >&2)
