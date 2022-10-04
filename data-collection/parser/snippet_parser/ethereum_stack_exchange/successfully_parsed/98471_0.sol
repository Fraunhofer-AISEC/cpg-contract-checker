pragma solidity ^0.8.2;
import "https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router02.sol"; 

contract Test_Swap{

  address owner = msg.sender;     
  
  IUniswapV2Router02 uniswap = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
  
  address private token_address = 0x514910771AF9Ca656af840dff83E8264EcF986CA; 
  address private usdc = 0x0D9C8723B343A8368BebE0B5E89273fF8D712e3C;
  
  function getPathForETHtoToken() private view returns (address[] memory) {
     address[] memory path = new address[](2);
     path[0] = uniswap.WETH();
     path[1] = usdc;
   return path;
   }
   
  function swapContractEthToLink() external payable {  
  uniswap.swapExactETHForTokens{value: msg.value}(0,getPathForETHtoToken(), owner, block.timestamp + 15);  
  }
}
