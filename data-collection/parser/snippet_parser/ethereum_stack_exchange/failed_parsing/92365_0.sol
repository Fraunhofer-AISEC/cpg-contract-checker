    Deployment
      √ Should set the contract's address as owner (44ms)
      √ Should assign the totalSupply of credits to the creditsContract (114ms)
    Transactions
      1) Should fail if sender doesn't have enough tokens
      2) Should fail when user tries to access contract approve without access


  2 passing (5s)
  2 failing

  1) Credits.sol: Uint Tests
       Transactions
         Should fail if sender doesn't have enough tokens:
     AssertionError: Expected transaction to be reverted with Not enough tokens, but other exception was thrown: Error: insufficient funds for intrinsic transaction cost (error="Error: VM Exception while processing transaction: revert insufficient funds, revert", method="sendTransaction", transaction=undefined, code=INSUFFICIENT_FUNDS, version=providers/5.0.17)


  2) Credits.sol: Uint Tests
       Transactions
         Should fail when user tries to access contract approve without access:
     AssertionError: Expected transaction to be reverted with No access, but other exception was thrown: Error: invalid ENS name (argument="name", value="<SignerWithAddress 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266>", code=INVALID_ARGUMENT, version=providers/5.0.17)
