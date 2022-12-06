All contracts have already been compiled, skipping compilation.


  Example

Setting up signer...
  signer: 0x8199Bcbd047e404d6c192969590CB7fCc0CCe2f0

Deploying example contract...
  example contract: 0xEA645fB4c45c22E2E75eD2ABB1fAD9525A7329f8

Testing swap - borrows 1 ETH, paying with ETH

Ensuring that contract can cover fees...
  contract ETH balance 0
  contract will not be able to cover fee, sending from signer...
  signer ETH balance 19228617140000000000
  new contract ETH balance 0

Performing flash swap...
    1) successfully flash swaps


  0 passing (2s)
  1 failing

  1) Example
       successfully flash swaps:
     Error: VM Exception while processing transaction: revert UniswapV2: LOCKED
      at HttpProvider.send (node_modules/@nomiclabs/buidler/src/internal/core/providers/http.ts:36:34)
      at wrapper_1.wrapSend (node_modules/@nomiclabs/buidler/src/internal/core/providers/accounts.ts:219:21)
      at Proxy.cloningSendWrapper (node_modules/@nomiclabs/buidler/src/internal/core/providers/wrapper.ts:9:12)
      at wrapper_1.wrapSend (node_modules/@nomiclabs/buidler/src/internal/core/providers/gas-providers.ts:23:21)
      at Proxy.cloningSendWrapper (node_modules/@nomiclabs/buidler/src/internal/core/providers/wrapper.ts:9:12)
      at wrapper_1.wrapSend (node_modules/@nomiclabs/buidler/src/internal/core/providers/gas-providers.ts:41:21)
      at Proxy.cloningSendWrapper (node_modules/@nomiclabs/buidler/src/internal/core/providers/wrapper.ts:9:12)
      at EthersProviderWrapper.send (node_modules/@nomiclabs/buidler-ethers/src/ethers-provider-wrapper.ts:13:48)
      at /Users/justinsacco/TESTcointaker1/uniswap-flash-swapper/node_modules/@ethersproject/providers/lib/json-rpc-provider.js:164:35
      at process._tickCallback (internal/process/next_tick.js:68:7)
