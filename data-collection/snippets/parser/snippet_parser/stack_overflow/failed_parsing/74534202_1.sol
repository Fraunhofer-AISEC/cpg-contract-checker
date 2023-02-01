Error: call revert exception [ See: https:
    at Logger.makeError (C:\Users\***\node_modules\@ethersproject\logger\lib\index.js:233:21)
    at Logger.throwError (C:\Users\***\node_modules\@ethersproject\logger\lib\index.js:242:20)
    at Interface.decodeFunctionResult (C:\Users\***\node_modules\@ethersproject\abi\lib\interface.js:388:23)
    at Contract.<anonymous> (C:\Users\***\node_modules\@ethersproject\contracts\lib\index.js:395:56)
    at step (C:\Users\***\node_modules\@ethersproject\contracts\lib\index.js:48:23)
    at Object.next (C:\Users\***\node_modules\@ethersproject\contracts\lib\index.js:29:53)
    at fulfilled (C:\Users\***\node_modules\@ethersproject\contracts\lib\index.js:20:58)
    at processTicksAndRejections (node:internal/process/task_queues:96:5) {
  reason: null,
  code: 'CALL_EXCEPTION',
  method: 'myTestFunction()',
  data: '0x',
  errorArgs: null,
  errorName: null,
  errorSignature: null,
  address: '0xB9d9e972100a1dD01cd441774b45b5821e136043',
  args: [],
  transaction: {
    data: '0xd100387c',
    to: '0xB9d9e972100a1dD01cd441774b45b5821e136043',
    from: '0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266'
  }
}
