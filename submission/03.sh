#!/bin/bash

BITCOIN_CLI="bitcoin-cli -regtest"

if ! bitcoin-cli -regtest listwallets | grep -q "btrustwallet"; then
  bitcoin-cli -regtest createwallet "btrustwallet" >/dev/null
fi

ADDRESS=$($BITCOIN_CLI getnewaddress "" bech32)

if [ -z "$ADDRESS" ]; then
  exit 1
fi
$BITCOIN_CLI generatetoaddress 50 "$ADDRESS" >/dev/null
$BITCOIN_CLI generatetoaddress 50 "$ADDRESS" >/dev/null
$BITCOIN_CLI generatetoaddress 50 "$ADDRESS" >/dev/null
$BITCOIN_CLI generatetoaddress 50 "$ADDRESS" >/dev/null
sleep 2

echo "$ADDRESS"


# Created a SegWit address.
# Add funds to the address.
# Return only the Address
