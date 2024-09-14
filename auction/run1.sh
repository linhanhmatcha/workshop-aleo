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

leo run resolve "{
  owner: aleo1uvust0aydrgl8xv6396fet2u02xpv2xqkk28n0d6dcv7wh2yacrqaqy9s0.private,
  bidder: aleo1zpf7e70zkxvv7waqhkusrn3ydx3rzrq7883e33vley7uv3js4ggs353gje.private,
  amount: 48u64.private,
  is_winner: false.private,
  _nonce: 8148481678730599253192372780238122766538639545019682830089452628105153598293group.public
}" "{
    owner: aleo1uvust0aydrgl8xv6396fet2u02xpv2xqkk28n0d6dcv7wh2yacrqaqy9s0.private,
  bidder: aleo1xlf33n8qzxsxf8gjflacduyem3feeg6xjjcga84e95ge3fjfg5gqp0zpen.private,
  amount: 76u64.private,
  is_winner: false.private,
  _nonce: 717831677259374080264776968701629508956240814877749365287810533309978266008group.public
}"