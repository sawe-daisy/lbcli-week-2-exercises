#!/bin/bash

# Set recipient address and amount
RECIPIENT="2MvLcssW49n9atmksjwg2ZCMsEMsoj3pzUP"
AMOUNT_SATOSHIS=20000000  # 0.20000000 BTC

# UTXOs extracted from decoded transaction
UTXO_TXID_1="23c19f37d4e92e9a115aab86e4edc1b92a51add4e0ed0034bb166314dde50e16"
UTXO_VOUT_1=0
UTXO_TXID_2="23c19f37d4e92e9a115aab86e4edc1b92a51add4e0ed0034bb166314dde50e16"
UTXO_VOUT_2=1

# Get a change address from the wallet
CHANGE_ADDRESS=$(bitcoin-cli -regtest getrawchangeaddress)

# Define total UTXO amount from decoded transaction
TOTAL_INPUT_SATOSHIS=$((16430198 + 7248910))  # 23,673,108 satoshis

# Set transaction fee (10,000 satoshis)
FEE_SATOSHIS=10000

# Calculate change amount
CHANGE_SATOSHIS=$((TOTAL_INPUT_SATOSHIS - AMOUNT_SATOSHIS - FEE_SATOSHIS))

# Convert amounts to BTC format
AMOUNT_BTC=$(printf "%.8f" "$(echo "$AMOUNT_SATOSHIS / 100000000" | bc -l)")
CHANGE_BTC=$(printf "%.8f" "$(echo "$CHANGE_SATOSHIS / 100000000" | bc -l)")

# Create the raw transaction
RAW_TX_HEX=$(bitcoin-cli -regtest createrawtransaction \
  "[{\"txid\":\"$UTXO_TXID_1\",\"vout\":$UTXO_VOUT_1}, {\"txid\":\"$UTXO_TXID_2\",\"vout\":$UTXO_VOUT_2}]" \
  "{\"$RECIPIENT\":$AMOUNT_BTC}")


echo $RAW_TX_HEX




# Create a raw transaction with an amount of 20,000,000 satoshis to this address: 2MvLcssW49n9atmksjwg2ZCMsEMsoj3pzUP 
# Use the UTXOs from the transaction below
# raw_tx="01000000000101c8b0928edebbec5e698d5f86d0474595d9f6a5b2e4e3772cd9d1005f23bdef772500000000ffffffff0276b4fa0000000000160014f848fe5267491a8a5d32423de4b0a24d1065c6030e9c6e000000000016001434d14a23d2ba08d3e3edee9172f0c97f046266fb0247304402205fee57960883f6d69acf283192785f1147a3e11b97cf01a210cf7e9916500c040220483de1c51af5027440565caead6c1064bac92cb477b536e060f004c733c45128012102d12b6b907c5a1ef025d0924a29e354f6d7b1b11b5a7ddff94710d6f0042f3da800000000"
