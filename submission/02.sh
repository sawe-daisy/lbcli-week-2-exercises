#!/bin/bash
# Create a new Bitcoin address, for receiving change.
BITCOIN_CLI="bitcoin-cli -regtest"
NEW_ADDRESS=$($BITCOIN_CLI getnewaddress)