npx hardhat test test/test-dependency-test.js 


  Test
testContract.address:0x5FbDB2315678afecb367f032d93F642f64180aa3
testDep.address:0xe7f1725E7734CE288F8367e1Bb143E90bb3F0512
testDep injected dependency address:0x0000000000000000000000000000000000000000
internal hello function called
internalHello response:internal hello
helloWithDependency function called
    1) Test dependency


  0 passing (18s)
  1 failing

  1) Test
       Test dependency:
     **Error: call revert exception [ See: https:
      at Logger.makeError (node_modules/@ethersproject/logger/src.ts/index.ts:261:28)
      at Logger.throwError (node_modules/@ethersproject/logger/src.ts/index.ts:273:20)
      at Interface.decodeFunctionResult (node_modules/@ethersproject/abi/src.ts/interface.ts:427:23)
      at Contract.<anonymous> (node_modules/@ethersproject/contracts/src.ts/index.ts:400:44)
      at step (node_modules/@ethersproject/contracts/lib/index.js:48:23)
      at Object.next (node_modules/@ethersproject/contracts/lib/index.js:29:53)
      at fulfilled (node_modules/@ethersproject/contracts/lib/index.js:20:58)
