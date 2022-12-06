pragma solidity ^0.8.2;
import "https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router02.sol"; 

contract Coffre{

  address owner =msg.sender;     
  
  IUniswapV2Router02 uni = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
  
  address private token_address = 0x514910771AF9Ca656af840dff83E8264EcF986CA; 
  
  function getPathForETHtoToken() private view returns (address[] memory) {
     address[] memory path = new address[](2);
     path[0] = uni.WETH();
     path[1] = token_address;
   return path;
   }
   
  function swapContractEthToLink() public {  
  uni.swapExactETHForTokens(0,getPathForETHtoToken(), owner, block.timestamp + 15);  
  }  
}