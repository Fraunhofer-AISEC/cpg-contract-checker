function buyCryptoOnUniswap(uint256 etherCost , address cryptoToken) public payable returns(uint256){


require(etherCost <= address(this).balance , "Insufficient funds")



    uint256 cryptoAmountPurchasable = estimateTokensThatETHCanBuy(etherCost , cryptoToken)[1];
    cryptoAmountPurchasable = cryptoAmountPurchasable.mul(11).div(10);
 
    uint deadline = now + 300; 

   
    usi.swapExactETHForTokens.value(etherCost)(0, getPathForETHToToken(cryptoToken), address(this), deadline);

   return cryptoAmountPurchasable;

}

 function estimateTokensThatETHCanBuy(uint ethAmount , address crypto) public view returns (uint[] memory) {
       return usi.getAmountsOut(ethAmount, getPathForETHToToken(crypto));
  }

  function getPathForETHToToken(address crypto) private view returns (address[] memory) {
    address[] memory path = new address[](2);
    path[0] = usi.WETH();
    path[1] = crypto;
    
    return path;
  }
