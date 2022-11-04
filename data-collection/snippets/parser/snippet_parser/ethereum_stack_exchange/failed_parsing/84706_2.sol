  Contract: test contract balance with eth
ContractBalanceTest  0xb7Ff5FB586177E7F489B956e7b218CdeB731B319 0

    #deposit
ContractBalanceTest  0xb7Ff5FB586177E7F489B956e7b218CdeB731B319 1000000000000000000
      ✓ test deposit (131ms)
    #withdraw
ContractBalanceTest  0xb7Ff5FB586177E7F489B956e7b218CdeB731B319 1000000000000000000
      1) test withdraw

    Events emitted during test:
    ---------------------------

    ContractBalanceTest.Transfer(
      amount: <indexed> 500000000000000000 (type: uint256)
    )


    ---------------------------


  1 passing (508ms)
  1 failing

  1) Contract: test contract balance with eth
       #withdraw
         test withdraw:

      the contract's balance should be 0.5 ether
      + expected - actual

      -1000000000000000000
      +500000000000000000
      
      at Context.<anonymous> (test/test_contract_balance.js:34:14)
      at process._tickCallback (internal/process/next_tick.js:68:7)
