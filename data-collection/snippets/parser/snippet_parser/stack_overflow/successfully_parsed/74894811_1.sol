

pragma solidity >=0.4.22 <0.9.0;

contract IUniswapV2Pair {
  function getReserves() external pure returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast) {
    reserve0 = 11;
    reserve1 = 12;
    blockTimestampLast = 13;
    return (reserve0, reserve1, blockTimestampLast);
  }

}

