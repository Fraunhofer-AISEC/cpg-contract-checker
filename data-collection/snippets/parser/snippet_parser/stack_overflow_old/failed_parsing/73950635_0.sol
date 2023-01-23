TypeError: Type contract ILendingPool is not implicitly convertible to expected type uint256.
  --> contracts/MyFlashLoan.sol:36:46:
   |
36 |            IERC20(assets[i]).approve(address[LENDING_POOL], amountOwing);
   |                                              ^^^^^^^^^^^^


TypeError: Invalid type for argument in function call. Invalid implicit conversion from type(address[1] memory) to address requested.
  --> contracts/MyFlashLoan.sol:36:38:
   |
36 |            IERC20(assets[i]).approve(address[LENDING_POOL], amountOwing);
   |                                      ^^^^^^^^^^^^^^^^^^^^^


Error HH600: Compilation failed
