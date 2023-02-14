$ /home/deb0rian/Projects/swap-example/node_modules/.bin/hardhat run scripts/deploy-swap.js
Getting contract
Error: invalid address or ENS name (argument="name", value={"interface":{"fragments":[{"type":"function","name":"exactInput","constant":false,"inputs":[{"name":"params","type":"tuple","indexed":null,"components":[{"name":"path","type":"bytes","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"bytes","_isParamType":true},{"name":"recipient","type":"address","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"address","_isParamType":true},{"name":"deadline","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"amountIn","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"amountOutMinimum","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true}],"arrayLength":null,"arrayChildren":null,"baseType":"tuple","_isParamType":true}],"outputs":[{"name":"amountOut","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true}],"payable":true,"stateMutability":"payable","gas":{"type":"BigNumber","hex":"0x01ba8140"},"_isFragment":true},{"type":"function","name":"exactInputSingle","constant":false,"inputs":[{"name":"params","type":"tuple","indexed":null,"components":[{"name":"tokenIn","type":"address","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"address","_isParamType":true},{"name":"tokenOut","type":"address","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"address","_isParamType":true},{"name":"fee","type":"uint24","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint24","_isParamType":true},{"name":"recipient","type":"address","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"address","_isParamType":true},{"name":"deadline","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"amountIn","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"amountOutMinimum","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"sqrtPriceLimitX96","type":"uint160","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint160","_isParamType":true}],"arrayLength":null,"arrayChildren":null,"baseType":"tuple","_isParamType":true}],"outputs":[{"name":"amountOut","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true}],"payable":true,"stateMutability":"payable","gas":{"type":"BigNumber","hex":"0x01ba8140"},"_isFragment":true},{"type":"function","name":"exactOutput","constant":false,"inputs":[{"name":"params","type":"tuple","indexed":null,"components":[{"name":"path","type":"bytes","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"bytes","_isParamType":true},{"name":"recipient","type":"address","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"address","_isParamType":true},{"name":"deadline","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"amountOut","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"amountInMaximum","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true}],"arrayLength":null,"arrayChildren":null,"baseType":"tuple","_isParamType":true}],"outputs":[{"name":"amountIn","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true}],"payable":true,"stateMutability":"payable","gas":{"type":"BigNumber","hex":"0x01ba8140"},"_isFragment":true},{"type":"function","name":"exactOutputSingle","constant":false,"inputs":[{"name":"params","type":"tuple","indexed":null,"components":[{"name":"tokenIn","type":"address","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"address","_isParamType":true},{"name":"tokenOut","type":"address","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"address","_isParamType":true},{"name":"fee","type":"uint24","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint24","_isParamType":true},{"name":"recipient","type":"address","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"address","_isParamType":true},{"name":"deadline","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"amountOut","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"amountInMaximum","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"sqrtPriceLimitX96","type":"uint160","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint160","_isParamType":true}],"arrayLength":null,"arrayChildren":null,"baseType":"tuple","_isParamType":true}],"outputs":[{"name":"amountIn","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true}],"payable":true,"stateMutability":"payable","gas":{"type":"BigNumber","hex":"0x01ba8140"},"_isFragment":true},{"type":"function","name":"uniswapV3SwapCallback","constant":false,"inputs":[{"name":"amount0Delta","type":"int256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"int256","_isParamType":true},{"name":"amount1Delta","type":"int256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"int256","_isParamType":true},{"name":"data","type":"bytes","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"bytes","_isParamType":true}],"outputs":[],"payable":false,"stateMutability":"nonpayable","gas":{"type":"BigNumber","hex":"0x01ba8140"},"_isFragment":true}],"_abiCoder":{"coerceFunc":null},"functions":{"exactInput((bytes,address,uint256,uint256,uint256))":{"type":"function","name":"exactInput","constant":false,"inputs":[{"name":"params","type":"tuple","indexed":null,"components":[{"name":"path","type":"bytes","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"bytes","_isParamType":true},{"name":"recipient","type":"address","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"address","_isParamType":true},{"name":"deadline","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"amountIn","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"amountOutMinimum","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true}],"arrayLength":null,"arrayChildren":null,"baseType":"tuple","_isParamType":true}],"outputs":[{"name":"amountOut","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true}],"payable":true,"stateMutability":"payable","gas":{"type":"BigNumber","hex":"0x01ba8140"},"_isFragment":true},"exactInputSingle((address,address,uint24,address,uint256,uint256,uint256,uint160))":{"type":"function","name":"exactInputSingle","constant":false,"inputs":[{"name":"params","type":"tuple","indexed":null,"components":[{"name":"tokenIn","type":"address","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"address","_isParamType":true},{"name":"tokenOut","type":"address","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"address","_isParamType":true},{"name":"fee","type":"uint24","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint24","_isParamType":true},{"name":"recipient","type":"address","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"address","_isParamType":true},{"name":"deadline","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"amountIn","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"amountOutMinimum","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"sqrtPriceLimitX96","type":"uint160","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint160","_isParamType":true}],"arrayLength":null,"arrayChildren":null,"baseType":"tuple","_isParamType":true}],"outputs":[{"name":"amountOut","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true}],"payable":true,"stateMutability":"payable","gas":{"type":"BigNumber","hex":"0x01ba8140"},"_isFragment":true},"exactOutput((bytes,address,uint256,uint256,uint256))":{"type":"function","name":"exactOutput","constant":false,"inputs":[{"name":"params","type":"tuple","indexed":null,"components":[{"name":"path","type":"bytes","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"bytes","_isParamType":true},{"name":"recipient","type":"address","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"address","_isParamType":true},{"name":"deadline","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"amountOut","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"amountInMaximum","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true}],"arrayLength":null,"arrayChildren":null,"baseType":"tuple","_isParamType":true}],"outputs":[{"name":"amountIn","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true}],"payable":true,"stateMutability":"payable","gas":{"type":"BigNumber","hex":"0x01ba8140"},"_isFragment":true},"exactOutputSingle((address,address,uint24,address,uint256,uint256,uint256,uint160))":{"type":"function","name":"exactOutputSingle","constant":false,"inputs":[{"name":"params","type":"tuple","indexed":null,"components":[{"name":"tokenIn","type":"address","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"address","_isParamType":true},{"name":"tokenOut","type":"address","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"address","_isParamType":true},{"name":"fee","type":"uint24","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint24","_isParamType":true},{"name":"recipient","type":"address","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"address","_isParamType":true},{"name":"deadline","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"amountOut","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"amountInMaximum","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true},{"name":"sqrtPriceLimitX96","type":"uint160","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint160","_isParamType":true}],"arrayLength":null,"arrayChildren":null,"baseType":"tuple","_isParamType":true}],"outputs":[{"name":"amountIn","type":"uint256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"uint256","_isParamType":true}],"payable":true,"stateMutability":"payable","gas":{"type":"BigNumber","hex":"0x01ba8140"},"_isFragment":true},"uniswapV3SwapCallback(int256,int256,bytes)":{"type":"function","name":"uniswapV3SwapCallback","constant":false,"inputs":[{"name":"amount0Delta","type":"int256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"int256","_isParamType":true},{"name":"amount1Delta","type":"int256","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"int256","_isParamType":true},{"name":"data","type":"bytes","indexed":null,"components":null,"arrayLength":null,"arrayChildren":null,"baseType":"bytes","_isParamType":true}],"outputs":[],"payable":false,"stateMutability":"nonpayable","gas":{"type":"BigNumber","hex":"0x01ba8140"},"_isFragment":true}},"errors":{},"events":{},"structs":{},"deploy":{"name":null,"type":"constructor","inputs":[],"payable":false,"stateMutability":"nonpayable","gas":null,"_isFragment":true},"_isInterface":true},"provider":"<WrappedHardhatProvider>","signer":"<SignerWithAddress 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266>","callStatic":{},"estimateGas":{},"functions":{},"populateTransaction":{},"filters":{},"_runningEvents":{},"_wrappedEmits":{},"address":"0xE592427A0AEce92De3Edee1F18E0157C05861564","resolvedAddress":{}}, code=INVALID_ARGUMENT, version=contracts/5.6.2)
    at Logger.makeError (/home/deb0rian/Projects/swap-example/node_modules/@ethersproject/logger/src.ts/index.ts:261:28)
    at Logger.throwError (/home/deb0rian/Projects/swap-example/node_modules/@ethersproject/logger/src.ts/index.ts:273:20)
    at Logger.throwArgumentError (/home/deb0rian/Projects/swap-example/node_modules/@ethersproject/logger/src.ts/index.ts:277:21)
    at /home/deb0rian/Projects/swap-example/node_modules/@ethersproject/contracts/src.ts/index.ts:123:16
    at step (/home/deb0rian/Projects/swap-example/node_modules/@ethersproject/contracts/lib/index.js:48:23)
    at Object.next (/home/deb0rian/Projects/swap-example/node_modules/@ethersproject/contracts/lib/index.js:29:53)
    at fulfilled (/home/deb0rian/Projects/swap-example/node_modules/@ethersproject/contracts/lib/index.js:20:58)
    at processTicksAndRejections (node:internal/process/task_queues:96:5) {
  reason: 'invalid address or ENS name',
  code: 'INVALID_ARGUMENT',
  argument: 'name',
  value: Contract {
    interface: Interface {
      fragments: [Array],
      _abiCoder: [AbiCoder],
      functions: [Object],
      errors: {},
      events: {},
      structs: {},
      deploy: [ConstructorFragment],
      _isInterface: true
    },
    provider: EthersProviderWrapper {
      _isProvider: true,
      _events: [],
      _emitted: [Object],
      disableCcipRead: false,
      formatter: [Formatter],
      anyNetwork: false,
      _networkPromise: [Promise],
      _maxInternalBlockNumber: -1024,
      _lastBlockNumber: -2,
      _maxFilterBlockRange: 10,
      _pollingInterval: 4000,
      _fastQueryDate: 0,
      connection: [Object],
      _nextId: 42,
      _hardhatProvider: [BackwardsCompatibilityProviderAdapter],
      _eventLoopCache: [Object],
      _network: [Object]
    },
    signer: SignerWithAddress {
      _isSigner: true,
      address: '0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266',
      _signer: [JsonRpcSigner],
      provider: [EthersProviderWrapper]
    },
    callStatic: {
      'exactInput((bytes,address,uint256,uint256,uint256))': [Function (anonymous)],
      'exactInputSingle((address,address,uint24,address,uint256,uint256,uint256,uint160))': [Function (anonymous)],                                                                                                         
      'exactOutput((bytes,address,uint256,uint256,uint256))': [Function (anonymous)],
      'exactOutputSingle((address,address,uint24,address,uint256,uint256,uint256,uint160))': [Function (anonymous)],                                                                                                        
      'uniswapV3SwapCallback(int256,int256,bytes)': [Function (anonymous)],
      exactInput: [Function (anonymous)],
      exactInputSingle: [Function (anonymous)],
      exactOutput: [Function (anonymous)],
      exactOutputSingle: [Function (anonymous)],
      uniswapV3SwapCallback: [Function (anonymous)]
    },
    estimateGas: {
      'exactInput((bytes,address,uint256,uint256,uint256))': [Function (anonymous)],
      'exactInputSingle((address,address,uint24,address,uint256,uint256,uint256,uint160))': [Function (anonymous)],                                                                                                         
      'exactOutput((bytes,address,uint256,uint256,uint256))': [Function (anonymous)],
      'exactOutputSingle((address,address,uint24,address,uint256,uint256,uint256,uint160))': [Function (anonymous)],                                                                                                        
      'uniswapV3SwapCallback(int256,int256,bytes)': [Function (anonymous)],
      exactInput: [Function (anonymous)],
      exactInputSingle: [Function (anonymous)],
      exactOutput: [Function (anonymous)],
      exactOutputSingle: [Function (anonymous)],
      uniswapV3SwapCallback: [Function (anonymous)]
    },
    functions: {
      'exactInput((bytes,address,uint256,uint256,uint256))': [Function (anonymous)],
      'exactInputSingle((address,address,uint24,address,uint256,uint256,uint256,uint160))': [Function (anonymous)],                                                                                                         
      'exactOutput((bytes,address,uint256,uint256,uint256))': [Function (anonymous)],
      'exactOutputSingle((address,address,uint24,address,uint256,uint256,uint256,uint160))': [Function (anonymous)],                                                                                                        
      'uniswapV3SwapCallback(int256,int256,bytes)': [Function (anonymous)],
      exactInput: [Function (anonymous)],
      exactInputSingle: [Function (anonymous)],
      exactOutput: [Function (anonymous)],
      exactOutputSingle: [Function (anonymous)],
      uniswapV3SwapCallback: [Function (anonymous)]
    },
    populateTransaction: {
      'exactInput((bytes,address,uint256,uint256,uint256))': [Function (anonymous)],
      'exactInputSingle((address,address,uint24,address,uint256,uint256,uint256,uint160))': [Function (anonymous)],                                                                                                         
      'exactOutput((bytes,address,uint256,uint256,uint256))': [Function (anonymous)],
      'exactOutputSingle((address,address,uint24,address,uint256,uint256,uint256,uint160))': [Function (anonymous)],                                                                                                        
      'uniswapV3SwapCallback(int256,int256,bytes)': [Function (anonymous)],
      exactInput: [Function (anonymous)],
      exactInputSingle: [Function (anonymous)],
      exactOutput: [Function (anonymous)],
      exactOutputSingle: [Function (anonymous)],
      uniswapV3SwapCallback: [Function (anonymous)]
    },
    filters: {},
    _runningEvents: {},
    _wrappedEmits: {},
    address: '0xE592427A0AEce92De3Edee1F18E0157C05861564',
    resolvedAddress: Promise { '0xE592427A0AEce92De3Edee1F18E0157C05861564' },
    'exactInput((bytes,address,uint256,uint256,uint256))': [Function (anonymous)],
    'exactInputSingle((address,address,uint24,address,uint256,uint256,uint256,uint160))': [Function (anonymous)],                                                                                                           
    'exactOutput((bytes,address,uint256,uint256,uint256))': [Function (anonymous)],
    'exactOutputSingle((address,address,uint24,address,uint256,uint256,uint256,uint160))': [Function (anonymous)],                                                                                                          
    'uniswapV3SwapCallback(int256,int256,bytes)': [Function (anonymous)],
    exactInput: [Function (anonymous)],
    exactInputSingle: [Function (anonymous)],
    exactOutput: [Function (anonymous)],
    exactOutputSingle: [Function (anonymous)],
    uniswapV3SwapCallback: [Function (anonymous)]
  }
}
error Command failed with exit code 1.
