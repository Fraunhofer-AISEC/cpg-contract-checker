Error: call revert exception [ See: https:
    at step (/Users/aryanraj/Desktop/Fork/Dbank/node_modules/@ethersproject/contracts/lib/index.js:48:23)
    at Contract.<anonymous> (/Users/aryanraj/Desktop/Fork/Dbank/node_modules/@ethersproject/contracts/src.ts/index.ts:400:44)
    at Interface.decodeFunctionResult (/Users/aryanraj/Desktop/Fork/Dbank/node_modules/@ethersproject/abi/src.ts/interface.ts:427:23)
    at Logger.throwError (/Users/aryanraj/Desktop/Fork/Dbank/node_modules/@ethersproject/logger/src.ts/index.ts:281:20)
    at Logger.makeError (/Users/aryanraj/Desktop/Fork/Dbank/node_modules/@ethersproject/logger/src.ts/index.ts:269:28) {
  reason: null,
  code: 'CALL_EXCEPTION',
  method: 'getBalance(address)',
  data: '0x',
  errorArgs: null,
  errorName: null,
  errorSignature: null,
  address: '0xAD2935E147b61175D5dc3A9e7bDa93B0975A43BA',
  args: [ '0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266' ],
  transaction: {
    data: '0xf8b2cb4f000000000000000000000000f39fd6e51aad88f6f4ce6ab8827279cfffb92266',
    to: '0xAD2935E147b61175D5dc3A9e7bDa93B0975A43BA',
    from: '0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266',
    gasLimit: BigNumber { value: "29022680" }
  }
}
