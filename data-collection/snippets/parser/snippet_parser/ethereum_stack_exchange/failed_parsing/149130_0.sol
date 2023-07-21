23 passing (4s)
  2 failing

  1) Treasury
       getBalance
         should return updated balance after depositing more tokens:
     Error: missing argument: passed to contract (count=2, expectedCount=4, code=MISSING_ARGUMENT, version=contracts/5.7.0)
      at Logger.makeError (node_modules/@ethersproject/logger/src.ts/index.ts:269:28)
      at Logger.throwError (node_modules/@ethersproject/logger/src.ts/index.ts:281:20)
      at Logger.checkArgumentCount (node_modules/@ethersproject/logger/src.ts/index.ts:340:18)
      at /home/brsh/WebstormProjects/dsb/node_modules/@ethersproject/contracts/src.ts/index.ts:187:12
      at step (node_modules/@ethersproject/contracts/lib/index.js:48:23)
      at Object.next (node_modules/@ethersproject/contracts/lib/index.js:29:53)
      at /home/brsh/WebstormProjects/dsb/node_modules/@ethersproject/contracts/lib/index.js:23:71
      at new Promise (<anonymous>)
      at __awaiter (node_modules/@ethersproject/contracts/lib/index.js:19:12)
      at populateTransaction (node_modules/@ethersproject/contracts/lib/index.js:152:12)

  2) Treasury
       deposit
         "before each" hook for "should deposit ETH successfully":
     Error: cannot estimate gas; transaction may fail or may require manual gas limit [ See: https:
