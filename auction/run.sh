#!/bin/bash
# First check that Leo is installed.
if ! command -v leo &> /dev/null
then
    echo "leo is not installed."
    exit
fi

echo "
We will be playing the role of three parties.

The private key and address of the first bidder.
private_key: APrivateKey1zkpBjA3TSy33f6EZZ965rJ4pSK8PSEMHSpH9K5uPfnEs8N4
address: aleo1zpf7e70zkxvv7waqhkusrn3ydx3rzrq7883e33vley7uv3js4ggs353gje

The private key and address of the second bidder.
private_key: APrivateKey1zkpEEs8BbYVYEN8MJkcsuEuGgb5v1cvqdPBcmZoJPB3R8Nm
address: aleo1xlf33n8qzxsxf8gjflacduyem3feeg6xjjcga84e95ge3fjfg5gqp0zpen

The private key and address of the auctioneer.
private_key: APrivateKey1zkpExXV7Q95fbjBDLMDPnZ3AkPma7ZVeKp6CH7kYbZkWv6v
address: aleo1uvust0aydrgl8xv6396fet2u02xpv2xqkk28n0d6dcv7wh2yacrqaqy9s0
"

echo "
Let's start an auction!

###############################################################################
########                                                               ########
########           Step 0: Initialize a new 2-party auction            ########
########                                                               ########
########                -------------------------------                ########
########                |  OPEN   |    A    |    B    |                ########
########                -------------------------------                ########
########                |   Bid   |         |         |                ########
########                -------------------------------                ########
########                                                               ########
###############################################################################
"

# echo "
# Let's take the role of the first bidder - we'll swap in the private key and address of the first bidder to .env.

# We're going to run the transition function "place_bid", slotting in the first bidder's public address and the amount that is being bid. The inputs are the user's public address and the amount being bid.

echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkpBjA3TSy33f6EZZ965rJ4pSK8PSEMHSpH9K5uPfnEs8N4
ADDRESS=aleo1zpf7e70zkxvv7waqhkusrn3ydx3rzrq7883e33vley7uv3js4ggs353gje
ENDPOINT=https://api.explorer.aleo.org/v1
" > .env && source .env

leo run place_bid $ADDRESS 48u64


echo "
###############################################################################
########                                                               ########
########         Step 1: The first bidder places a bid of 10           ########
########                                                               ########
########                -------------------------------                ########
########                |  OPEN   |    A    |    B    |                ########
########                -------------------------------                ########
########                |   Bid   |    48   |         |                ########
########                -------------------------------                ########
########                                                               ########
###############################################################################
"

#

echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkpEEs8BbYVYEN8MJkcsuEuGgb5v1cvqdPBcmZoJPB3R8Nm
ADDRESS=aleo1xlf33n8qzxsxf8gjflacduyem3feeg6xjjcga84e95ge3fjfg5gqp0zpen
ENDPOINT=https://api.explorer.aleo.org/v1
" > .env && source .env

# Have the second bidder place a bid of 90.
leo run place_bid $ADDRESS 76u64

echo "
###############################################################################
########                                                               ########
########          Step 2: The second bidder places a bid of 90         ########
########                                                               ########
########                -------------------------------                ########
########                |  OPEN   |    A    |    B    |                ########
########                -------------------------------                ########
########                |   Bid   |   48    |   76    |                ########
########                -------------------------------                ########
########                                                               ########
###############################################################################
"

