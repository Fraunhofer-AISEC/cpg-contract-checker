 1) FortuneTigersPunk
   "before each" hook for "should deploy successfully":
 Error: too many arguments:  in Contract constructor (count=4, expectedCount=0, code=UNEXPECTED_ARGUMENT, version=contracts/5.5.0)
  at Logger.makeError (node_modules\@ethersproject\logger\src.ts\index.ts:225:28)
  at Logger.throwError (node_modules\@ethersproject\logger\src.ts\index.ts:237:20)
  at Logger.checkArgumentCount (node_modules\@ethersproject\logger\src.ts\index.ts:303:18)
  at ContractFactory.<anonymous> (node_modules\@ethersproject\contracts\src.ts\index.ts:1227:16)
  at step (node_modules\@ethersproject\contracts\lib\index.js:48:23)
  at Object.next (node_modules\@ethersproject\contracts\lib\index.js:29:53)
  at C:\Users\loobj\hardhat-tutorial\node_modules\@ethersproject\contracts\lib\index.js:23:71
  at new Promise (<anonymous>)
  at __awaiter (node_modules\@ethersproject\contracts\lib\index.js:19:12)
  at ContractFactory.deploy (node_modules\@ethersproject\contracts\lib\index.js:1132:16)
