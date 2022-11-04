>>> contract2 = deployContract.deploy(contract1,{"from":account})
Transaction sent: 0xeef5213bf540967ffb2dbbf398dab5187424033d7fcd811d8438dc49e334dfac
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 1
  deployContract.constructor confirmed   Block: 2   Gas used: 205549 (1.71%)
  deployContract deployed at: 0x602C71e4DAC47a042Ee7f46E0aee17F94A3bA0B6

>>> contract3 = deployContract.deploy(contract1.address,{"from":account})
Transaction sent: 0x0f15e77b7556c82418e45d7afe7029a535955abbd1c46b35bfd047b9efb67846
  Gas price: 0.0 gwei   Gas limit: 12000000   Nonce: 2
  deployContract.constructor confirmed   Block: 3   Gas used: 205549 (1.71%)
  deployContract deployed at: 0xE7eD6747FaC5360f88a2EFC03E00d25789F69291
