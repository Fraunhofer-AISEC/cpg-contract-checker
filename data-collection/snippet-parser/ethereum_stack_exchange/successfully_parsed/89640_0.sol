pragma solidity 0.7.1;

import "https://github.com/Uniswap/uniswap-v2-periphery/blob/master/contracts/interfaces/IUniswapV2Router02.sol"; 
 
 contract BuyToken{
          
    IUniswapV2Router02 usi = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
       
function buyTokenWithExactEth() public payable returns(uint256) {
        address cryptoToken = 0x4F96Fe3b7A6Cf9725f59d353F723c1bDb64CA6Aa;

        uint deadline = block.timestamp + 15; 
        usi.swapExactETHForTokens{value: msg.value}(0, getPathForETHToToken(cryptoToken), address(this), deadline);

        
        return 1000;
}

  function getPathForETHToToken(address crypto) private view returns (address[] memory) {
    address[] memory path = new address[](2);
    path[0] = usi.WETH();
    path[1] = crypto;
    
    return path;
  }

}
