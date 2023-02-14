

pragma solidity >=0.4.22 <0.9.0;


contract IUniswapV2Pair {
  function getReserves() public view returns (uint112 reserve0, uint112 reserve1, uint32 blockTimestampLast) {}
}


contract getReserve {
  function get(address[] memory _add) external view returns (uint[] memory) {
    uint n = _add.length;
    uint[] memory liste = new uint[](n*2);
    
    
    uint112 reserve0;
    uint112 reserve1;
    uint32 blockTimestampLast;
    for (uint i=0; i<n; i++) {
      
      (reserve0, reserve1, blockTimestampLast) = IUniswapV2Pair(_add[i]).getReserves();
      liste[i*2] = reserve0;
      liste[i*2+1] = reserve1;
    }
    
    return liste;
  }

  function getOnlyOne(address _add) external view returns (uint112, uint112, uint32) {
    return IUniswapV2Pair(_add).getReserves();
  }
}

