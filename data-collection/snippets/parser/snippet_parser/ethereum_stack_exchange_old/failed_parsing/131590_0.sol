PS E:\vs code files> npx hardhat test
npm WARN config global `--global`, `--local` are deprecated. Use `--location=global` instead.
× Help us improve Hardhat with anonymous crash reports & basic usage data? (Y/n) · y


    1) Deployment should assign the total supply of the token


  0 passing (4s)
  1 failing

  1) Token Contract
       Deployment should assign the total supply of the token:
     Error: missing argument: passed to contract (count=1, expectedCount=2, code=MISSING_ARGUMENT, version=contracts/5.6.2)
      at Logger.makeError (node_modules\@ethersproject\logger\src.ts\index.ts:261:28)
      at Logger.throwError (node_modules\@ethersproject\logger\src.ts\index.ts:273:20)
      at Logger.checkArgumentCount (node_modules\@ethersproject\logger\src.ts\index.ts:332:18)
      at E:\vs code files\node_modules\@ethersproject\contracts\src.ts\index.ts:187:12
      at step (node_modules\@ethersproject\contracts\lib\index.js:48:23)
      at Object.next (node_modules\@ethersproject\contracts\lib\index.js:29:53)
      at E:\vs code files\node_modules\@ethersproject\contracts\lib\index.js:23:71
      at new Promise (<anonymous>)
      at __awaiter (node_modules\@ethersproject\contracts\lib\index.js:19:12)
      at populateTransaction (node_modules\@ethersproject\contracts\lib\index.js:152:12)
