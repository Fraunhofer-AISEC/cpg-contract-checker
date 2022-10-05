/home/mohit/aave-v3/aave-fork/node_modules/@ethersproject/logger/lib/index.js:233
        var error = new Error(message);
                    ^

Error: missing provider (operation="sendTransaction", code=UNSUPPORTED_OPERATION, version=abstract-signer/5.6.2)
    at Logger.makeError (/home/mohit/aave-v3/aave-fork/node_modules/@ethersproject/logger/lib/index.js:233:21)
    at Logger.throwError (/home/mohit/aave-v3/aave-fork/node_modules/@ethersproject/logger/lib/index.js:242:20)
    at Wallet.Signer._checkProvider (/home/mohit/aave-v3/aave-fork/node_modules/@ethersproject/abstract-signer/lib/index.js:395:20)
    at Wallet.<anonymous> (/home/mohit/aave-v3/aave-fork/node_modules/@ethersproject/abstract-signer/lib/index.js:144:30)
    at step (/home/mohit/aave-v3/aave-fork/node_modules/@ethersproject/abstract-signer/lib/index.js:48:23)
    at Object.next (/home/mohit/aave-v3/aave-fork/node_modules/@ethersproject/abstract-signer/lib/index.js:29:53)
    at /home/mohit/aave-v3/aave-fork/node_modules/@ethersproject/abstract-signer/lib/index.js:23:71
    at new Promise (<anonymous>)
    at __awaiter (/home/mohit/aave-v3/aave-fork/node_modules/@ethersproject/abstract-signer/lib/index.js:19:12)
    at Wallet.Signer.sendTransaction (/home/mohit/aave-v3/aave-fork/node_modules/@ethersproject/abstract-signer/lib/index.js:139:16) {
  reason: 'missing provider',
  code: 'UNSUPPORTED_OPERATION',
  operation: 'sendTransaction'
}
