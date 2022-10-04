PS E:\vs code files> npx hardhat run --network Goerli scripts/deploy.js
npm WARN config global `--global`, `--local` are deprecated. Use `--location=global` instead.
× Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y
Error: missing argument:  in Contract constructor (count=0, expectedCount=2, code=MISSING_ARGUMENT, version=contracts/5.6.2)
    at Logger.makeError (E:\vs code files\node_modules\@ethersproject\logger\src.ts\index.ts:261:28)
    at Logger.throwError (E:\vs code files\node_modules\@ethersproject\logger\src.ts\index.ts:273:20)
    at Logger.checkArgumentCount (E:\vs code files\node_modules\@ethersproject\logger\src.ts\index.ts:332:18)
    at ContractFactory.<anonymous> (E:\vs code files\node_modules\@ethersproject\contracts\src.ts\index.ts:1237:16)
    at step (E:\vs code files\node_modules\@ethersproject\contracts\lib\index.js:48:23)
    at Object.next (E:\vs code files\node_modules\@ethersproject\contracts\lib\index.js:29:53)
    at E:\vs code files\node_modules\@ethersproject\contracts\lib\index.js:23:71
    at new Promise (<anonymous>)
    at __awaiter (E:\vs code files\node_modules\@ethersproject\contracts\lib\index.js:19:12)
    at ContractFactory.deploy (E:\vs code files\node_modules\@ethersproject\contracts\lib\index.js:1138:16) {
  reason: 'missing argument:  in Contract constructor',
  code: 'MISSING_ARGUMENT',
  count: 0,
  expectedCount: 2
}
