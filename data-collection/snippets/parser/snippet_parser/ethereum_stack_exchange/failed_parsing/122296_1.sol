TypeError: Explicit type conversion not allowed from "int24" to "uint256".
  --> @uniswap/v3-core/contracts/libraries/TickMath.sol:25:28:
   |
25 |         require(absTick <= uint256(MAX_TICK), 'T');
   |                            ^^^^^^^^^^^^^^^^^


TypeError: Explicit type conversion not allowed from "uint256" to "address".
  --> @uniswap/v3-periphery/contracts/libraries/PoolAddress.sol:35:16:
   |
35 |         pool = address(
   |                ^ (Relevant source part starts here and spans across multiple lines).


Error HH600: Compilation failed


