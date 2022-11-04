 contract SellTokens{
    
       IUniswapV2Router02 usi = IUniswapV2Router02(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);
          
    function sellDai(uint256 daiQty , address cryptoToken) public payable returns(uint256){



    uint256 ethAmountDerivable = getEstimatedTokenForETH(daiQty , cryptoToken)[0];
 
  uint deadline = now + 300; 

    usi.swapExactTokensForETH(daiQty , ethAmountDerivable, getPathForTokenToETH(cryptoToken), address(this), deadline);

   return ethAmountDerivable;

}
    
    function getEstimatedTokenForETH(uint daiQty , address crypto) public view returns (uint[] memory) {
        return usi.getAmountsIn(daiQty, getPathForTokenToETH(crypto));
      }
    
     function getPathForTokenToETH(address crypto) private view returns (address[] memory) {
        address[] memory path = new address[](2);
        path[0] = crypto;
        path[1] = usi.WETH();
        
        return path;
      }
    
    }
