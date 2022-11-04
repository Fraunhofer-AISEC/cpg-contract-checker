function buyCryptoOnUniswap1(uint256 etherCost , address cryptoToken) public payable returns (uint256) {

  IUniswapV2Router02 usi = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
      
   if(etherCost > address(this).balance){
          return 0;
    }
    uint deadline = now + 300; 
    
    uint[] memory amounts = usi.swapExactETHForTokens.value(etherCost)(0, getPathForETHToToken(cryptoToken), address(this), deadline);
    uint256 outputTokenCount = uint256(amounts[1]);
    
    return outputTokenCount;
      }


  function getPathForETHToToken(address crypto) private view returns (address[] memory) {
       
    address[] memory path = new address[](2);
    path[0] = usi.WETH();
    path[1] = crypto;
    
    return path;
  }
