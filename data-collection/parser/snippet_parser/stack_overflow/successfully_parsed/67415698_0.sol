pragma solidity ^0.5.1;

import '@uniswap/v2-core/contracts/interfaces/IUniswapV2Pair.sol';
import './IERC20.sol';


contract Uniswap {

   
   function getTokenPrice(address pairAddress, uint amount) public view returns(uint)
   {
    IUniswapV2Pair pair = IUniswapV2Pair(pairAddress);
    IERC20 token1 = IERC20(pair.token1);
    (uint Res0, uint Res1,) = pair.getReserves();

    
    uint res0 = Res0*(10**token1.decimals());
    return((amount*res0)/Res1); 
   }
    
}
