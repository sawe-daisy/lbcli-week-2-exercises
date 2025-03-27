#!/bin/bash

BITCOIN_CLI="bitcoin-cli -regtest -rpcwallet=btrustwallet"

# if ! $BITCOIN_CLI getwalletinfo &>/dev/null; then
#   bitcoin-cli -regtest createwallet "btrustwallet"
# fi

ADDRESS=$($BITCOIN_CLI getnewaddress "" bech32)

# if [ -z "$ADDRESS" ]; then
#   exit 1
# fi

$BITCOIN_CLI generatetoaddress 50 "$ADDRESS"
$BITCOIN_CLI generatetoaddress 50 "$ADDRESS"

echo $ADDRESS

# Created a SegWit address.
# Add funds to the address.
# Return only the Address
