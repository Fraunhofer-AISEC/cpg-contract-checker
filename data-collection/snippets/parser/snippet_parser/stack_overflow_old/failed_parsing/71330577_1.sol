>>> contract = test.deploy({"from":accounts[0]})
Transaction sent: 0x18d498309e787b6c65bad40010461a8514a373b2361b74a952a221d201de1a60
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 0
  test.constructor confirmed   Block: 1   Gas used: 672896 (5.61%)
  test deployed at: 0x3194cBDC3dbcd3E11a07892e7bA5c3394048Cc87

>>> contract.enterAutomobiles("123", "abc", "def", "blue", {"from":accounts[0]})
Transaction sent: 0x15cb272745d39287220e9286bd2542fb1c3e654032c83323b8e918207b0c318c
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 1
  test.enterAutomobiles confirmed   Block: 2   Gas used: 151166 (1.26%)

<Transaction '0x15cb272745d39287220e9286bd2542fb1c3e654032c83323b8e918207b0c318c'>

>>> contract.getAllAutomobiles()
((0, 123, 'abc', 'def', 'blue'))
