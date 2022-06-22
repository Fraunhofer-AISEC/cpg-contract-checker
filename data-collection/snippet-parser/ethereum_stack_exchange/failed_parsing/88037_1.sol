Compiling your contracts...
===========================
> Everything is up to date, there is nothing to compile.



Starting migrations...
======================
> Network name:    'development'
> Network id:      1601793094416
> Block gas limit: 6721975 (0x6691b7)


1_initial_migration.js
======================

   Replacing 'Migrations'
   ----------------------
   > transaction hash:    0x4fb4b21d2027a322007e1f6baddcd3b4297eeb056b1578e51b2065817c0171e8
   > Blocks: 0            Seconds: 0
   > contract address:    0x174B3B88E5BC6384e5d6a3f6361c1dE08530CB46
   > block number:        47
   > block timestamp:     1601794571
   > account:             0x1Bd55dfB97737246e924A7817FF9105c3b539dFa
   > balance:             98.63353568
   > gas used:            221555 (0x36173)
   > gas price:           20 gwei
   > value sent:          0 ETH
   > total cost:          0.0044311 ETH


   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:           0.0044311 ETH


2_deploy_contracts.js
=====================

   Replacing 'UniswapV2Factory'
   ----------------------------
   > transaction hash:    0x8008a6b4dc127546de32f80e4410c7bddab6d79eb1f04bb0056de14edff0cb74
   > Blocks: 0            Seconds: 0
   > contract address:    0xa44f9937Eb97eAA8D177fF288fb2ad357bbA7B3c
   > block number:        49
   > block timestamp:     1601794571
   > account:             0x1Bd55dfB97737246e924A7817FF9105c3b539dFa
   > balance:             98.53171312
   > gas used:            5049130 (0x4d0b2a)
   > gas price:           20 gwei
   > value sent:          0 ETH
   > total cost:          0.1009826 ETH


   Replacing 'Token1'
   ------------------
   > transaction hash:    0x743f8d49e2ac6d1efe4186abf5250c98f3e4c246dfedb2cd86d33453d31d7a61
   > Blocks: 0            Seconds: 0
   > contract address:    0xdc660AE67657C80Eb467256796011a1650bE2221
   > block number:        50
   > block timestamp:     1601794571
   > account:             0x1Bd55dfB97737246e924A7817FF9105c3b539dFa
   > balance:             98.50611422
   > gas used:            1279945 (0x1387c9)
   > gas price:           20 gwei
   > value sent:          0 ETH
   > total cost:          0.0255989 ETH


   Replacing 'Token2'
   ------------------
   > transaction hash:    0x8eeaf3b763940b57ad18c716d8e638ca7b984493f7aac2c707bfdb62039287f1
   > Blocks: 0            Seconds: 0
   > contract address:    0x78b4e2e0b46fF97536F5ecb1d238d229732492F6
   > block number:        51
   > block timestamp:     1601794571
   > account:             0x1Bd55dfB97737246e924A7817FF9105c3b539dFa
   > balance:             98.48051532
   > gas used:            1279945 (0x1387c9)
   > gas price:           20 gwei
   > value sent:          0 ETH
   > total cost:          0.0255989 ETH

token1Address
0xdc660AE67657C80Eb467256796011a1650bE2221
token2Address
0x78b4e2e0b46fF97536F5ecb1d238d229732492F6

Error: Returned error: VM Exception while processing transaction: revert
    at module.exports (/var/www/html/uniswap/core/migrations/2_deploy_contracts.js:28:17)
    at <anonymous>
    at process._tickCallback (internal/process/next_tick.js:189:7)
Truffle v5.1.44 (core: 5.1.44)
Node v8.17.0
