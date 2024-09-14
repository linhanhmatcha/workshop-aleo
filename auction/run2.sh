#!/bin/bash
# First check that Leo is installed.
if ! command -v leo &> /dev/null
then
    echo "leo is not installed."
    exit
fi

echo "
NETWORK=testnet
PRIVATE_KEY=APrivateKey1zkpExXV7Q95fbjBDLMDPnZ3AkPma7ZVeKp6CH7kYbZkWv6v
ADDRESS=aleo1uvust0aydrgl8xv6396fet2u02xpv2xqkk28n0d6dcv7wh2yacrqaqy9s0
ENDPOINT=https://api.explorer.aleo.org/v1
" > .env && source .env

leo run finish "{
  owner: aleo1uvust0aydrgl8xv6396fet2u02xpv2xqkk28n0d6dcv7wh2yacrqaqy9s0.private,
  bidder: aleo1xlf33n8qzxsxf8gjflacduyem3feeg6xjjcga84e95ge3fjfg5gqp0zpen.private,
  amount: 76u64.private,
  is_winner: false.private,
  _nonce: 6215948942084896395051295002438680994419584061039278432795030855995993795050group.public
}"