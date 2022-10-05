  Am I Rich Already
    ✓ checks if contract called balanceOf with certain wallet on the ERC20 token (249ms)
    ✓ returns false if the wallet has less than 1000000 coins (190ms)
    ✓ returns true if the wallet has at least 1000000 coins (159ms)
    Tests if a random number is returned:
     Error: cannot estimate gas; transaction may fail or may require manual gas limit (error={"name":"RuntimeError","results":{"0x0a0b028de6cf6e8446853a300061305501136cefa5f5eb3e96afd95dbd73dd92":{"error":"revert","program_counter":609,"return":"0x"}},"hashes":["0x0a0b028de6cf6e8446853a300061305501136cefa5f5eb3e96afd95dbd73dd92"],"message":"VM Exception while processing transaction: revert"}, tx={"data":"0xdbdff2c1","to":{},"from":"0x17ec8597ff92C3F44523bDc65BF0f1bE632917ff","gasPrice":{"type":"BigNumber","hex":"0x77359400"},"type":0,"nonce":{},"gasLimit":{},"chainId":{}}, code=UNPREDICTABLE_GAS_LIMIT, version=abstract-signer/5.4.1)
      at Logger.makeError (node_modules/@ethersproject/logger/src.ts/index.ts:225:28)
      at Logger.throwError (node_modules/@ethersproject/logger/src.ts/index.ts:237:20)
      at /home/name/git/trucol/tested/new_test/test_vrf3/node_modules/@ethersproject/abstract-signer/src.ts/index.ts:301:31
      at process._tickCallback (internal/process/next_tick.js:68:7)



  3 passing (4s)
