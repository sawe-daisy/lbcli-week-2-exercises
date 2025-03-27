#!/bin/bash

BITCOIN_CLI="bitcoin-cli -regtest -rpcwallet=btrustwallet"

$BITCOIN_CLI listunspent

# List the current UTXOs in your wallet.
