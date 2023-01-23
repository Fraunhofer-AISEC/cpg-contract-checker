Error: invalid hex string (argument="value", value="-0x0e8800", code=INVALID_ARGUMENT, version=bytes/5.5.0)
    at Logger.makeError (/home/augustin/tokenart/tokenart-contracts/node_modules/@ethersproject/logger/src.ts/index.ts:225:28)
    at Logger.throwError (/home/augustin/tokenart/tokenart-contracts/node_modules/@ethersproject/logger/src.ts/index.ts:237:20)
    at Logger.throwArgumentError (/home/augustin/tokenart/tokenart-contracts/node_modules/@ethersproject/logger/src.ts/index.ts:241:21)
    at hexStripZeros (/home/augustin/tokenart/tokenart-contracts/node_modules/@ethersproject/bytes/src.ts/index.ts:304:16)
    at hexValue (/home/augustin/tokenart/tokenart-contracts/node_modules/@ethersproject/bytes/src.ts/index.ts:295:21)
    at /home/augustin/tokenart/tokenart-contracts/node_modules/@ethersproject/providers/src.ts/json-rpc-provider.ts:646:35
    at Array.forEach (<anonymous>)
    at Function.JsonRpcProvider.hexlifyTransaction (/home/augustin/tokenart/tokenart-contracts/node_modules/@ethersproject/providers/src.ts/json-rpc-provider.ts:644:100)
    at /home/augustin/tokenart/tokenart-contracts/node_modules/@ethersproject/providers/src.ts/json-rpc-provider.ts:210:60 {
  reason: 'invalid hex string',
  code: 'INVALID_ARGUMENT',
  argument: 'value',
  value: '-0x0e8800'
}
