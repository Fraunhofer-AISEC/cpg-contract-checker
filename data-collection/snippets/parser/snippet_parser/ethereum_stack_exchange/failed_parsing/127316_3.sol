PS C:\Users\Temitope\Desktop\kredar\smart_contract> npx hardhat run scripts/deploy.js --network ropsten
Error: too many arguments:  in Contract constructor (count=1, expectedCount=0, code=UNEXPECTED_ARGUMENT, version=contracts/5.6.0)
    at Logger.makeError (C:\Users\Temitope\Desktop\kredar\smart_contract\node_modules\@ethersproject\logger\src.ts\index.ts:261:28)
    at Logger.throwError (C:\Users\Temitope\Desktop\kredar\smart_contract\node_modules\@ethersproject\logger\src.ts\index.ts:273:20)
    at Logger.checkArgumentCount (C:\Users\Temitope\Desktop\kredar\smart_contract\node_modules\@ethersproject\logger\src.ts\index.ts:339:18)      
    at ContractFactory.getDeployTransaction (C:\Users\Temitope\Desktop\kredar\smart_contract\node_modules\@ethersproject\contracts\src.ts\index.ts:1218:16)
    at ContractFactory.<anonymous> (C:\Users\Temitope\Desktop\kredar\smart_contract\node_modules\@ethersproject\contracts\src.ts\index.ts:1246:53)    at step (C:\Users\Temitope\Desktop\kredar\smart_contract\node_modules\@ethersproject\contracts\lib\index.js:48:23)
    at ContractFactory.<anonymous> (C:\Users\Temitope\Desktop\kredar\smart_contract\node_modules\@ethersproject\contracts\src.ts\index.ts:1246:53)    at step (C:\Users\Temitope\Desktop\kredar\smart_contract\node_modules\@ethersproject\contracts\lib\index.js:48:23)
    at Object.next (C:\Users\Temitope\Desktop\kredar\smart_contract\node_modules\@ethersproject\contracts\lib\index.js:29:53)
    at fulfilled (C:\Users\Temitope\Desktop\kredar\smart_contract\node_modules\@ethersproject\contracts\lib\index.js:20:58)
    at processTicksAndRejections (node:internal/process/task_queues:96:5) {
  reason: 'too many arguments:  in Contract constructor',
  code: 'UNEXPECTED_ARGUMENT',
  count: 1,
  expectedCount: 0
}
