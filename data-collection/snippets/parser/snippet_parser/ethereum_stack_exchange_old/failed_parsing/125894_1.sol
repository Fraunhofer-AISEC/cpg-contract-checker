Error: call revert exception [ See: https:
    at Logger.makeError (/Users/nick/Documents/Tesi/Show Upgrade/node_modules/@ethersproject/logger/src.ts/index.ts:261:28)
    at Logger.throwError (/Users/nick/Documents/Tesi/Show Upgrade/node_modules/@ethersproject/logger/src.ts/index.ts:273:20)
    at Interface.decodeFunctionResult (/Users/nick/Documents/Tesi/Show Upgrade/node_modules/@ethersproject/abi/src.ts/interface.ts:423:23)
    at Contract.<anonymous> (/Users/nick/Documents/Tesi/Show Upgrade/node_modules/@ethersproject/contracts/src.ts/index.ts:400:44)
    at step (/Users/nick/Documents/Tesi/Show Upgrade/node_modules/@ethersproject/contracts/lib/index.js:48:23)
    at Object.next (/Users/nick/Documents/Tesi/Show Upgrade/node_modules/@ethersproject/contracts/lib/index.js:29:53)
    at fulfilled (/Users/nick/Documents/Tesi/Show Upgrade/node_modules/@ethersproject/contracts/lib/index.js:20:58) {
  reason: null,
  code: 'CALL_EXCEPTION',
  method: 'getImplementation()',
  errorArgs: null,
  errorName: null,
  errorSignature: null,
  address: '0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512',
  args: [],
  transaction: {
    data: '0xaaf10f42',
    to: '0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512',
    from: '0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266',
    gasLimit: BigNumber { value: "29021272" }
  }
}
