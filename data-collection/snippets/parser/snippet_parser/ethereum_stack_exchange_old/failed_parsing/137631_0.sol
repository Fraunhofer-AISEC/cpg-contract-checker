    Contract: DappToken
    ✔ initializes the contract with the correct values (106ms)
    1) allocates the initial supply upon deployment
    > No events were emitted
    2) transfers token ownership
    > No events were emitted
    ✔ approves tokens for delegated transfer (352ms)
    3) handles delegated token transfers
    > No events were emitted

  Contract: DappTokenSale
    4) initializes the contract with the correct values
    > No events were emitted
    5) facilitates token buying
    > No events were emitted
    6) ends token sale
    > No events were emitted


  2 passing (2s)
  6 failing

  1) Contract: DappToken
       allocates the initial supply upon deployment:

      sets the total supply to 1,000,000
      + expected - actual

      -0
      +1000000

      at /mnt/d/Practice/LEarn/BlockChain/Dapp/Cryptocurrency on Ethereum/token_sale/test/DappToken.js:26:14
      at processTicksAndRejections (internal/process/task_queues.js:97:5)

  2) Contract: DappToken
       transfers token ownership:
     AssertionError: error message must contain revert
      at /mnt/d/Practice/LEarn/BlockChain/Dapp/Cryptocurrency on Ethereum/token_sale/test/DappToken.js:39:7
      at processTicksAndRejections (internal/process/task_queues.js:97:5)

  3) Contract: DappToken
       handles delegated token transfers:
     Error: Returned error: VM Exception while processing transaction: revert
      at /mnt/d/Practice/LEarn/BlockChain/Dapp/Cryptocurrency on Ethereum/token_sale/test/DappToken.js:98:41

  4) Contract: DappTokenSale
       initializes the contract with the correct values:
     AssertionError: has token contract address: expected '0x0000000000000000000000000000000000000000' to not equal 0
      at /mnt/d/Practice/LEarn/BlockChain/Dapp/Cryptocurrency on Ethereum/token_sale/test/DappTokenSale.js:21:14
      at processTicksAndRejections (internal/process/task_queues.js:97:5)

  5) Contract: DappTokenSale
       facilitates token buying:
     AssertionError: cannot purchase more tokens than available
      at /mnt/d/Practice/LEarn/BlockChain/Dapp/Cryptocurrency on Ethereum/token_sale/test/DappTokenSale.js:61:7
      at processTicksAndRejections (internal/process/task_queues.js:97:5)

  6) Contract: DappTokenSale
       ends token sale:
     Error: Returned error: VM Exception while processing transaction: revert
      at /mnt/d/Practice/LEarn/BlockChain/Dapp/Cryptocurrency on Ethereum/token_sale/test/DappTokenSale.js:78:32
