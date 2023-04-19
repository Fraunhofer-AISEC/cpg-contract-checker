Compiler run failed
error[9582]: TypeError: Member "_value" not found or not visible after argument-dependent lookup in function (uint256) view external returns (address,uint256,bool,uint256).
  --> test/MultiSigWallet.t.sol:21:27:
   |
21 |         (,uint value,,) = multiSigWalletObj.transactionArr._value;
   |                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
